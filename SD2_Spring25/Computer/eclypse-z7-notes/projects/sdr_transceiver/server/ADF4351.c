#include "ADF4351.h"
#include <math.h>
#include <stdio.h>

static void buildRegisters(ADF4351* dev, int INT, int FRAC, int MOD,
    bool prescaler89, int divSel, double fPFD) {
    printf("build Registers\n");
ADF4351_Regs* regs = &dev->regs;

// R0
regs->R0 = ((FRAC & 0xFFF) << 3) | ((INT & 0xFFFF) << 15);

// R1
regs->R1 = ((MOD & 0xFFF) << 3) | (1 << 15);
if (prescaler89) regs->R1 |= (1 << 27);
regs->R1 |= 0x1;

// R2 
regs->R2 = ((dev->rCounter & 0x3FF) << 14);
if (dev->refDbl) regs->R2 |= (1 << 25);
if (dev->rdiv2)  regs->R2 |= (1 << 24);
regs->R2 |= (6 << 9);  // Charge pump current
regs->R2 |= (1 << 8) | (1 << 7) | (1 << 6);  // LDF, LDP, PD polarity
regs->R2 |= (6 << 26); //MUXOUT for Lock Detect
regs->R2 |= 0x2;

// R3
regs->R3 = (1 << 22) | (1 << 21) | 0x3;

// R4
regs->R4 = (1 << 23) | ((divSel & 0x7) << 20) | (3 << 3) | (1 << 5) | 0x4;

// R5
regs->R5 = (1 << 22) | 0x5;
}

// Constructor-like init function
ADF4351 ADF4351_init(double refFreqHz, bool enableRefDoubler, bool enableRDIV2, int RCounter) {
    ADF4351 dev = {
        .fRef = refFreqHz,
        .refDbl = enableRefDoubler,
        .rdiv2 = enableRDIV2,
        .rCounter = RCounter,
        .fOut = 0.0,
        .fChan = 0.0
    };
    return dev;
}

bool ADF4351_setFrequency(ADF4351* dev, double freqHz, double channelSpacingHz) {
    if (freqHz < 34.375e6 || freqHz > 4.4e9) {
        fprintf(stderr, "ERROR: Frequency out of range: %f Hz\n", freqHz);
        return false;
    }
    printf("attempting to set freq\n");
    dev->fOut = freqHz;
    dev->fChan = channelSpacingHz;

    double refFactor = dev->refDbl ? 2.0 : 1.0;
    double divBy2 = dev->rdiv2 ? 2.0 : 1.0;
    double fPFD = (dev->fRef * refFactor) / (double)dev->rCounter / divBy2;

    const int divTable[] = {1, 2, 4, 8, 16, 32, 64};
    int dividerSel = 0;
    double fVCO = 0.0;

    for (int i = 0; i < 7; i++) {
        double testVCO = freqHz * divTable[i];
        if (testVCO >= 2.2e9 && testVCO <= 4.4e9) {
            fVCO = testVCO;
            dividerSel = i;
            break;
        }
    }

    if (fVCO == 0.0) {
        fprintf(stderr, "ERROR: Could not place VCO in 2.2–4.4 GHz range.\n");
        return false;
    }

    bool fractionalMode = (channelSpacingHz > 1.0);
    double N_real = fVCO / fPFD;
    int INT = (int)floor(N_real);
    double fracPart = N_real - INT;

    int MOD = 2;
    int FRAC = 0;

    if (fractionalMode) {
        double desiredMOD = fPFD / channelSpacingHz;
        desiredMOD = MIN(MAX(desiredMOD, 2.0), 4095.0);
        MOD = (int)round(desiredMOD);
        FRAC = (int)round(fracPart * MOD);
        if (FRAC >= MOD) {
            FRAC = 0;
            INT += 1;
        }
    }

    bool prescaler89 = (INT > 75);
    if (prescaler89 && INT < 75) INT = 75;
    if (!prescaler89 && INT < 23) INT = 23;

    buildRegisters(dev, INT, FRAC, MOD, prescaler89, dividerSel, fPFD);
    return true;
}

ADF4351_Regs ADF4351_getRegisters(ADF4351* dev) {
    return dev->regs;
}





