#ifndef ADF4351_H
#define ADF4351_H

#include <stdint.h>
#include <stdbool.h>

#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))


typedef struct {
    uint32_t R0;
    uint32_t R1;
    uint32_t R2;
    uint32_t R3;
    uint32_t R4;
    uint32_t R5;
} ADF4351_Regs;

typedef struct {
    double fRef;
    bool refDbl;
    bool rdiv2;
    int rCounter;
    double fOut;
    double fChan;
    ADF4351_Regs regs;
} ADF4351;

ADF4351 ADF4351_init(double refFreqHz, bool enableRefDoubler, bool enableRDIV2, int RCounter);
bool ADF4351_setFrequency(ADF4351* dev, double freqHz, double channelSpacingHz);
ADF4351_Regs ADF4351_getRegisters(ADF4351* dev);

#endif // ADF4351_H
