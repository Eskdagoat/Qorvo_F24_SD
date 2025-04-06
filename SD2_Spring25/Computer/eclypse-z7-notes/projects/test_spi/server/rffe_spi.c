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
volatile uint32_t *ADF_R0, *ADF_R1, *ADF_R2, *ADF_R3, *ADF_R4, *ADF_R5, *LO_Start, *EXP_REG, *EXP_Start;
volatile uint32_t *Test;
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
   LO_Start = mmap(NULL, sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x42000000);
    if (LO_Start == MAP_FAILED) {
        perror("mmap");
        return EXIT_FAILURE;
    }



    // Assign register pointers


   // ADF_R5 = (uint32_t *)(rffe + 224);
  //  ADF_R4 = (uint32_t *)(rffe + 192);
  //  ADF_R3 = (uint32_t *)(rffe + 160);
 //   ADF_R2 = (uint32_t *)(rffe + 128);
 //   ADF_R1 = (uint32_t *)(rffe + 64);
 //  ADF_R0 = (uint32_t *)(rffe + 32);
    //LO_Start = (uint32_t *)(rffe);
 //   EXP_REG = (uint32_t *)(rffe + 288);
 //   EXP_Start = (uint32_t *)(rffe + 320);
 //   Test = (uint32_t *)(rffe + 320);

    printf("Registers Assigned\n");

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
    *LO_Start = 0xAAAAAA;
    while (1) {
        run = run +1;
        printf("Run number: %X\n", run);
        if (recv(sock_client, &command, sizeof(command), MSG_WAITALL) <= 0)
            break;

        uint32_t value = command & 0x0FFFFFFF;  // 28-bit frequency
        double freq_Hz = (double)value;
        printf("Frequency: %.2f Hz\n", freq_Hz);

        if (!ADF4351_setFrequency(&synth, freq_Hz, 0.0)) {
            fprintf(stderr, "ADF4351 failed to lock at %.2f Hz\n", freq_Hz);
            continue;
        }

        ADF4351_Regs regs = ADF4351_getRegisters(&synth);
        *LO_Start = 0xFFFFFFFF;
        sleep(1);
        // Write ADF4351 registers: R5 to R0
        *LO_Start = regs.R5;
        printf("ADF_R5 0x%X\n", regs.R5);
        sleep(5);
        *LO_Start = regs.R4;
        printf("ADF_R4 0x%X\n", regs.R4);
        sleep(5);
        *LO_Start = regs.R3;
        printf("ADF_R3 0x%X\n", regs.R3);
        sleep(5);
        *LO_Start = regs.R2;
        printf("ADF_R2 0x%X\n", regs.R2);
        sleep(5);
        *LO_Start = regs.R1;
        printf("ADF_R1 0x%X\n", regs.R1);
        sleep(5);
        *LO_Start = regs.R0;
        printf("ADF_R0 0x%X\n", regs.R0);
        sleep(5);


        printf("Registers written\n");

        printf("regs.R0: 0x%08X\n", (uint32_t)regs.R0);
        // IO expander for band select
       // *EXP_REG = 0xFFFFFFFF;
      //  *EXP_Start = 1;

        if (freq_Hz < 1e9) {
            printf("Low End Expander\n");
            //*EXP_REG = 0x40143D;
            //*EXP_Start = 1;
        } else {
            printf("High End Expander\n");
            //*EXP_REG = 0x40143E;
            //*EXP_Start = 1;
        }

        //printf("Wrote and read back: 0x%X\n", *EXP_REG);

       // break;  // One-shot session per connection
    }

    close(sock_client);
}
