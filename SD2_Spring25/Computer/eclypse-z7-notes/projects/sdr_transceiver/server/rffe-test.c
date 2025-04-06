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
#include <netinet/in.h>

// Hardware register pointers
volatile uint32_t *ADF_R0, *ADF_R1, *ADF_R2, *ADF_R3, *ADF_R4, *ADF_R5, *LO_Start, *EXP_REG, *EXP_Start;
volatile uint32_t *Test;


int main() {
    int fd;
    volatile void *rffe;

    // Open /dev/mem
    if ((fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0) {
        perror("open");
        return EXIT_FAILURE;
    }

    // Map RF Front-End memory block
   rffe = mmap(NULL, 8*sysconf(_SC_PAGESIZE), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0x40500000);
    if (rffe == MAP_FAILED) {
        perror("mmap");
        return EXIT_FAILURE;
    }



    // Assign register pointers


    ADF_R5 = (uint32_t *)(rffe + 224);
    ADF_R4 = (uint32_t *)(rffe + 192);
    ADF_R3 = (uint32_t *)(rffe + 160);
    ADF_R2 = (uint32_t *)(rffe + 128);
    ADF_R1 = (uint32_t *)(rffe + 64);
    ADF_R0 = (uint32_t *)(rffe + 32);
    LO_Start = (uint32_t *)(rffe);
    EXP_REG = (uint32_t *)(rffe + 288);
    EXP_Start = (uint32_t *)(rffe + 320);
    Test = (uint32_t *)(rffe + 320);

    printf("Registers Assigned\n");


    printf("RFFE Memory about to print every second\n");
    int run = 0;
    while (1) {
        run = run +1;
        printf("Run number: %X\n", run);

        // Read ADF4351 registers: R5 to R0
        printf("ADF_R5 0x%X\n", *ADF_R5);
        printf("ADF_R4 0x%X\n", *ADF_R4);
        printf("ADF_R3 0x%X\n", *ADF_R3);
        printf("ADF_R2 0x%X\n", *ADF_R2);
        printf("ADF_R1 0x%X\n", *ADF_R1);
        printf("ADF_R0 0x%X\n", *ADF_R0);
        printf("LO Start 0x%X\n", *LO_Start);
        sleep(2);
    }

    return EXIT_SUCCESS;
}
