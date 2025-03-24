#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <math.h>
#include <string.h>
#include <pthread.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include "ADF4351.h"

// Hardware register pointers
volatile uint32_t *rx_freq;
volatile uint32_t *rx_IODIRA, *rx_OLATA;
volatile uint32_t *ADF_R0, *ADF_R1, *ADF_R2, *ADF_R3, *ADF_R4, *ADF_R5;

// Socket tracking
int sock_thread[4] = {-1, -1, -1, -1};
pthread_t thread;

void *rx_rffe_handler(void *arg);

// Thread handler table
void *(*handler[4])(void *) = {
    rx_rffe_handler,
    NULL,
    NULL,
    NULL
};

int main() {
    int fd, sock_server, sock_client;
    struct sockaddr_in addr;
    uint32_t command;
    ssize_t result;
    int yes = 1;
    uint16_t port = 1000;

    // Open /dev/mem
    if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0) {
        perror("open");
        return EXIT_FAILURE;
    }

    // Map RF Front-End memory block
    volatile void *rffe = mmap(NULL, 8 * sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x45000000);
    if (rffe == MAP_FAILED) {
        perror("mmap");
        return EXIT_FAILURE;
    }

    // Assign register pointers
    rx_freq   = (uint32_t *)(rffe + 0x04);
    rx_IODIRA = (uint32_t *)(rffe + 0x20);
    rx_OLATA  = (uint32_t *)(rffe + 0x24);

    ADF_R5 = (uint32_t *)(rffe + 0x100);
    ADF_R4 = (uint32_t *)(rffe + 0x104);
    ADF_R3 = (uint32_t *)(rffe + 0x108);
    ADF_R2 = (uint32_t *)(rffe + 0x10C);
    ADF_R1 = (uint32_t *)(rffe + 0x110);
    ADF_R0 = (uint32_t *)(rffe + 0x114);

    // Setup TCP socket
    if ((sock_server = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        perror("socket");
        return EXIT_FAILURE;
    }

    setsockopt(sock_server, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(yes));

    memset(&addr, 0, sizeof(addr));
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_ANY);
    addr.sin_port = htons(port);

    if (bind(sock_server, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
        perror("bind");
        return EXIT_FAILURE;
    }

    listen(sock_server, 1024);

    printf("RF controller listening on port %d...\n", port);

    while (1) {
        sock_client = accept(sock_server, NULL, NULL);
        if (sock_client < 0) {
            perror("accept");
            continue;
        }

        result = recv(sock_client, &command, sizeof(command), MSG_WAITALL);
        if (result <= 0 || command > 3 || sock_thread[command] > -1) {
            close(sock_client);
            continue;
        }

        sock_thread[command] = sock_client;

        if (pthread_create(&thread, NULL, handler[command], NULL) != 0) {
            perror("pthread_create");
            close(sock_client);
            sock_thread[command] = -1;
            continue;
        }

        pthread_detach(thread);
    }

    close(sock_server);
    return EXIT_SUCCESS;
}

void *rx_rffe_handler(void *arg) {
    int sock_client = sock_thread[0];
    uint32_t command;
    ADF4351 synth = ADF4351_init(10.0e6, false, false, 1);

    while (1) {
        if (recv(sock_client, &command, sizeof(command), MSG_WAITALL) <= 0)
            break;

        uint32_t value = command & 0x0FFFFFFF;  // 28-bit frequency
        double freq_Hz = (double)value;

        if (!ADF4351_setFrequency(&synth, freq_Hz, 0.0)) {
            fprintf(stderr, "ADF4351 failed to lock at %.2f Hz\n", freq_Hz);
            continue;
        }

        ADF4351_Regs regs = ADF4351_getRegisters(&synth);

        // Write ADF4351 registers: R5 to R0
        *ADF_R5 = regs.R5;
        *ADF_R4 = regs.R4;
        *ADF_R3 = regs.R3;
        *ADF_R2 = regs.R2;
        *ADF_R1 = regs.R1;
        *ADF_R0 = regs.R0;

        // IO expander for band select
        if(freq_Hz < 1e9) // if frequency is less than 1GHz
        {
          *rx_OLATA = 0x40143d; // Low End
        }
        else
        {
          *rx_OLATA = 0x40143e; // High End
        }

        break;  // Remove this if you want persistent socket sessions
    }

    close(sock_client);
    sock_thread[0] = -1;
    return NULL;
}
