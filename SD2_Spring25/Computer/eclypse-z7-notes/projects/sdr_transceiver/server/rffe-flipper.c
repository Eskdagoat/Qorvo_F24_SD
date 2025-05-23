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
void write_to_LO_Start(volatile uint32_t *LO_Start, uint32_t to_split);


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
   LO_Start = mmap(NULL, sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x46000000);
   EXP_REG = mmap(NULL, sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x47000000);

    if (LO_Start == MAP_FAILED) {
        perror("mmap");
        return EXIT_FAILURE;
    }

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
    uint32_t allF = 0xFFFFFFFF;
    uint32_t oneeight = 0x12345678;
    int run = 0; 

    ADF4351 synth = ADF4351_init(10.0e6, false, false, 1);
    printf("Created synth\n");
    //*LO_Start = 0xAAAAAA;
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
        write_to_LO_Start(LO_Start, oneeight);
        sleep(1);
        // Write ADF4351 registers: R5 to R0
        //write_to_LO_Start(LO_Start, regs.R5);
        *LO_Start = regs.R5;
        printf("ADF_R5 0x%X\n", regs.R5);
       // sleep(5);
        //write_to_LO_Start(LO_Start, regs.R4);
        *LO_Start = regs.R4;
        printf("ADF_R4 0x%X\n", regs.R4);
        //sleep(5);
        *LO_Start = regs.R3;
        printf("ADF_R3 0x%X\n", regs.R3);
        //sleep(5);
        *LO_Start = regs.R2;
        printf("ADF_R2 0x%X\n", regs.R2);
       // sleep(5);
        *LO_Start = regs.R1;
        printf("ADF_R1 0x%X\n", regs.R1);
       // sleep(5);
        *LO_Start = regs.R0;
        printf("ADF_R0 0x%X\n", regs.R0);
       // sleep(5);


        printf("Registers written\n");

        printf("regs.R0: 0x%08X\n", (uint32_t)regs.R0);


        if (freq_Hz < 1e9) {
            printf("Low End Expander\n");
            *EXP_REG = 0x40;
            sleep(1);
            *EXP_REG = 0x12;
            sleep(1);
            *EXP_REG = 0x3D;
        } else {
            printf("High End Expander\n");
            *EXP_REG = 0x40;
            *EXP_REG = 0x12;
            *EXP_REG = 0x3E;
        }

        //printf("Wrote and read back: 0x%X\n", *EXP_REG);

       // break;  // One-shot session per connection
    }

    close(sock_client);
}

void write_to_LO_Start(volatile uint32_t *LO_Start, uint32_t to_split) {
    // Split the 32-bit value into two 16-bit parts
    uint16_t low = to_split & 0xFFFF;           // Lower 16 bits
    uint16_t high = (to_split >> 16) & 0xFFFF;  // Upper 16 bits

    // Write the lower 16 bits to LO_Start
    *LO_Start = low;  // Write the lower 16 bits
    printf("Written Lower 16 bits: 0x%04X\n", low);

    // Wait for a short amount of time before writing the upper 16 bits
    usleep(100);  // Adjust the delay as needed (in microseconds)

    // Write the upper 16 bits to the same location (LO_Start points to the same place)
    *LO_Start = high;  // Write the upper 16 bits
    printf("Written Upper 16 bits: 0x%04X\n", high);
}