void rx_rffe_handler(int sock_client) {
    printf("RX Handler\n");
    uint32_t command;
    uint8_t mux_status;
    int run = 0;

    ADF4351 synth = ADF4351_init(10.0e6, false, false, 1);
    printf("Created synth\n");

    while (1) {
        run++;
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
        sleep(1);

        // Write registers: FPGA will now handle LE pulse
        *LO_Start = regs.R5; printf("ADF_R5 0x%X\n", regs.R5);
        *LO_Start = regs.R4; printf("ADF_R4 0x%X\n", regs.R4);
        *LO_Start = regs.R3; printf("ADF_R3 0x%X\n", regs.R3);
        *LO_Start = regs.R2; printf("ADF_R2 0x%X\n", regs.R2);
        *LO_Start = regs.R1; printf("ADF_R1 0x%X\n", regs.R1);
        *LO_Start = regs.R0; printf("ADF_R0 0x%X\n", regs.R0);

        printf("Registers written\n");

        if (*MUX_OUT >= 1) {
            mux_status = 1;
            printf("MUXOUT = 1\n");
        } else {
            mux_status = 0;
        }

        if (send(sock_client, &mux_status, sizeof(mux_status), MSG_NOSIGNAL) < 0)
            break;
    }

    close(sock_client);
}
