#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <math.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include "ADF4351.h"

// Hardware register pointers
volatile uint32_t *LO_Start, *EXP_REG;
// Forward declaration
void rx_rffe_handler(int sock_client);

int main() {
    int fd, sock_server, sock_client;
    struct sockaddr_in addr;
    uint32_t command;
    ssize_t result;
    int yes = 1;
    uint16_t port = 1000;
    volatile void *rffe;

    // Open /dev/mem
    if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0) {
        perror("open");
        return EXIT_FAILURE;
    }

    // Map RF Front-End memory block
   LO_Start = mmap(NULL, sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x45000000);
   EXP_REG = mmap(NULL, sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x46000000);

    if (LO_Start == MAP_FAILED) {
        perror("mmap");
        return EXIT_FAILURE;
    }

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


    *EXP_REG = 0x40;
    *EXP_REG = 0x00;
    *EXP_REG = 0x00;
    printf("Configured expander");

    while (1) {
        sock_client = accept(sock_server, NULL, NULL);
        if (sock_client < 0) {
            perror("accept");
            continue;
        }

        result = recv(sock_client, &command, sizeof(command), MSG_WAITALL);
        if (result <= 0 || command != 0) {
            close(sock_client);
            continue;
        }

        // Direct call without threading
        rx_rffe_handler(sock_client);
    }

    close(sock_server);
    return EXIT_SUCCESS;
}

void rx_rffe_handler(int sock_client) {
    printf("RX Handler\n");
    uint32_t command;
    int run = 0; 

    ADF4351 synth = ADF4351_init(10.0e6, false, false, 1);
    printf("Created synth\n");
    while (1) {
        run = run +1;
        printf("Run number: %X\n", run);
        if (recv(sock_client, &command, sizeof(command), MSG_WAITALL) <= 0)
            break;

        uint32_t value = command & 0x0FFFFFFF;  // 28-bit frequency
        double freq_Hz = (double)value;
        printf("Frequency: %.2f Hz\n", freq_Hz);

        if (freq_Hz < 1e9) {
            printf("Low End Expander\n");
            *EXP_REG = 0x40;
            *EXP_REG = 0x12;
            *EXP_REG = 0x3D;
        } else {
            printf("High End Expander\n");
            *EXP_REG = 0x40;
            *EXP_REG = 0x12;
            *EXP_REG = 0x3E;
        }

        if (!ADF4351_setFrequency(&synth, freq_Hz, 0.0)) {
            fprintf(stderr, "ADF4351 failed to lock at %.2f Hz\n", freq_Hz);
            continue;
        }

        ADF4351_Regs regs = ADF4351_getRegisters(&synth);
        sleep(1);
        // Write ADF4351 registers: R5 to R0
        *LO_Start = regs.R5;
        printf("ADF_R5 0x%X\n", regs.R5);
        *LO_Start = regs.R4;
        printf("ADF_R4 0x%X\n", regs.R4);
        *LO_Start = regs.R3;
        printf("ADF_R3 0x%X\n", regs.R3);
        *LO_Start = regs.R2;
        printf("ADF_R2 0x%X\n", regs.R2);
        *LO_Start = regs.R1;
        printf("ADF_R1 0x%X\n", regs.R1);
        *LO_Start = regs.R0;
        printf("ADF_R0 0x%X\n", regs.R0);
        printf("Registers written\n");

      if (freq_Hz < 1e9) {
        printf("Low End Expander - LO CS Disabled\n");
        *EXP_REG = 0x40;
        *EXP_REG = 0x12;
        *EXP_REG = 0x39;
    } else {
        printf("High End Expander - LO CS Disabled\n");
        *EXP_REG = 0x40;
        *EXP_REG = 0x12;
        *EXP_REG = 0x3A;
    }
    }

    close(sock_client);
}
