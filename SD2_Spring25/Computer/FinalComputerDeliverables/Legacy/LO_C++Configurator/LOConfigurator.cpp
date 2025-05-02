/*****************************************************************************
 * ADF4351 C++ Register Configuration Class
 *
 * This code generates 6 x 32-bit register settings for the ADF4351.
 * It can handle frequencies from ~35 MHz up to 4.4 GHz, using its output dividers.
 * It supports fractional-N if the user provides a nonzero channel spacing.
 * Default reference frequency is 10 MHz with no doubler and no divide-by-2,
 * but the constructor can be changed for other reference configurations.
 *
 * Usage Steps:
 *  1. Create an instance, for example:
 *       ADF4351 synth(10e6, false, false, 1);
 *     This sets a 10 MHz reference, no reference doubler, no RDIV2, and R=1.
 *
 *  2. Call setFrequency(desiredFreqHz, channelSpacingHz).
 *     If channelSpacingHz is 0, the code uses integer-N mode.
 *     Otherwise, it uses fractional-N mode.
 *
 *  3. Retrieve the final 6 registers by calling getRegisters().
 *     They are returned in a struct with fields R0..R5.
 *
 *  4. Write the registers to the hardware in the order R5..R0.
 *     Then cause the FPGA or MCU to clock them out via SPI to the ADF4351.
 *
 *  5. The ADF4351 locks to the requested frequency if the loop filter and
 *     charge pump settings match the hardware design.
 *****************************************************************************/

#include <iostream>
#include <cmath>
#include <cstdint>
#include <array>

/******************************************************************************
 * ADF4351 Class
 *****************************************************************************/
class ADF4351
{
public:
    // This struct holds the final six 32-bit registers after setFrequency()
    struct Regs {
        uint32_t R0;
        uint32_t R1;
        uint32_t R2;
        uint32_t R3;
        uint32_t R4;
        uint32_t R5;
    };

    /**
     * Constructor:
     *  @param refFreqHz        Reference frequency in Hz (default 10 MHz)
     *  @param enableRefDoubler Set true to double the reference internally
     *  @param enableRDIV2      Set true to divide reference by 2 internally
     *  @param RCounter         R divider value, typically 1
     */
    ADF4351(double refFreqHz = 10e6,
            bool enableRefDoubler = false,
            bool enableRDIV2      = false,
            int  RCounter         = 1)
    {
        fRef_      = refFreqHz;
        refDbl_    = enableRefDoubler;
        rdiv2_     = enableRDIV2;
        rCounter_  = RCounter;
    }

    /**
     * setFrequency():
     *  Attempts to place the device at freqHz output frequency by selecting
     *  an output divider and computing the internal VCO frequency (2.2..4.4 GHz).
     *  If channelSpacingHz > 0, fractional-N mode is used for that spacing.
     *  If channelSpacingHz <= 0, integer-N mode is used (FRAC=0).
     *  Returns false if unable to fit frequency into the VCO range with output divider.
     */
    bool setFrequency(double freqHz, double channelSpacingHz = 0.0)
    {
        if (freqHz < 34.375e6 || freqHz > 4.4e9)
        {
            std::cerr << "ERROR: Frequency out of ADF4351 range: "
                      << freqHz << " Hz\n";
            return false;
        }

        fOut_  = freqHz;
        fChan_ = channelSpacingHz;

        // Compute the PFD frequency:
        // fPFD = (fRef_ * (refDbl_ ? 2 : 1)) / (rCounter_) / (rdiv2_ ? 2 : 1)
        double refFactor = (refDbl_ ? 2.0 : 1.0);
        double divBy2    = (rdiv2_ ? 2.0 : 1.0);
        double fPFD      = (fRef_ * refFactor) / double(rCounter_) / divBy2;

        // Choose an output divider so that VCO is in [2.2..4.4 GHz]
        static const int divTable[7] = {1,2,4,8,16,32,64};
        int dividerSel = 0;
        double fVCO = 0.0;
        for (int i = 0; i < 7; i++)
        {
            double testVCO = freqHz * divTable[i];
            if (testVCO >= 2.2e9 && testVCO <= 4.4e9)
            {
                fVCO = testVCO;
                dividerSel = i;
                break;
            }
        }
        if (fVCO < 2.2e9 || fVCO > 4.4e9)
        {
            std::cerr << "ERROR: Cannot place VCO in 2.2..4.4GHz using divider.\n";
            return false;
        }

        bool fractionalMode = (channelSpacingHz > 1.0);

        double N_real = fVCO / fPFD;
        int    INT    = static_cast<int>(std::floor(N_real));
        double fracPart = N_real - double(INT);

        int MOD  = 2; // default minimal
        int FRAC = 0;

        if (fractionalMode)
        {
            double desiredMOD = fPFD / channelSpacingHz;
            if (desiredMOD < 2.0)
                desiredMOD = 2.0;
            if (desiredMOD > 4095.0)
                desiredMOD = 4095.0;

            MOD = static_cast<int>(std::round(desiredMOD));
            double fracTimesMod = fracPart * double(MOD);
            FRAC = static_cast<int>(std::round(fracTimesMod));
            if (FRAC >= MOD)
            {
                FRAC = 0;
                INT += 1;
            }
        }

        // Prescaler logic: if INT>75, use 8/9. Else if <75, can use 4/5 (INT>=23)
        bool prescaler89 = false;
        if (INT > 75)
        {
            prescaler89 = true;
            if (INT < 75)
                INT = 75;
        }
        else
        {
            if (INT < 23)
                INT = 23;
        }

        buildRegisters(INT, FRAC, MOD, prescaler89, dividerSel, fPFD);
        return true;
    }

    /**
     * getRegisters():
     *  Returns the final 6 register values in a struct.
     *  The recommended write order is: R5, R4, R3, R2, R1, R0.
     */
    Regs getRegisters() const
    {
        return regs_;
    }

private:

    /**
     * buildRegisters():
     *  Assembles the 6 x 32-bit words in regs_.R5..R0 based on the chosen
     *  integer/fractional values and other settings. Includes typical defaults
     *  for charge pump current, lock detect, etc.
     */
    void buildRegisters(int INT, int FRAC, int MOD,
                        bool prescaler89, int divSel, double fPFD)
    {
        // R0: [INT, FRAC, control=000]
        uint32_t r0 = 0;
        r0 |= (static_cast<uint32_t>(FRAC & 0xFFF) << 3);
        r0 |= (static_cast<uint32_t>(INT  & 0xFFFF) << 15);
        r0 |= 0x0; // control bits=000 => R0
        regs_.R0 = r0;

        // R1: [MOD, Phase=1, Prescaler, control=001]
        uint32_t r1 = 0;
        r1 |= (static_cast<uint32_t>(MOD & 0xFFF) << 3);   // bits 3..14
        r1 |= (1 << 15);                                   // minimal phase=1
        if (prescaler89)
            r1 |= (1 << 27);                               // DB27 => prescaler=8/9
        r1 |= 0x1; // control=001 => R1
        regs_.R1 = r1;

        // R2: [R counter, CP current, lock detect, PD polarity, etc., control=010]
        uint32_t r2 = 0;
        // R counter => bits [14..23]
        uint32_t rCounterVal = static_cast<uint32_t>(rCounter_ & 0x3FF);
        r2 |= (rCounterVal << 14);

        // Reference doubler => DB25
        if (refDbl_)
            r2 |= (1 << 25);

        // RDIV2 => DB24
        if (rdiv2_)
            r2 |= (1 << 24);

        // CP current code => bits [9..12], example: 6 => ~2.5mA typical
        int cpCode = 6;
        r2 |= (static_cast<uint32_t>(cpCode & 0xF) << 9);

        // LDF=1 => integer-n lock detect => DB8
        r2 |= (1 << 8);
        // LDP=1 => 6ns => DB7
        r2 |= (1 << 7);
        // PD polarity=1 => DB6
        r2 |= (1 << 6);

        // control=010 => R2
        r2 |= 0x2;
        regs_.R2 = r2;

        // R3: [antibacklash=3ns, charge cancel=1, etc., control=011]
        uint32_t r3 = 0;
        // DB22=1 => 3ns ABP for integer-n
        r3 |= (1 << 22);
        // DB21=1 => charge cancel
        r3 |= (1 << 21);
        // control=011 => R3
        r3 |= 0x3;
        regs_.R3 = r3;

        // R4: [feedback from VCO, dividerSel, output power, main RF enable, control=100]
        uint32_t r4 = 0;
        // DB23 => feedback select=1 => from VCO
        r4 |= (1 << 23);
        // output divider => DB22..20 => divSel
        r4 |= (static_cast<uint32_t>(divSel & 0x7) << 20);
        // main RF output power => +5dBm => bits [4..3]=11 => 3<<3
        r4 |= (3 << 3);
        // main RF output enable => DB5 => 1
        r4 |= (1 << 5);
        // control=100 => R4
        r4 |= 0x4;
        regs_.R4 = r4;

        // R5: [lock detect pin, reserved fields, control=101]
        uint32_t r5 = 0;
        // digital lock detect => DB23..22 => 0b01 => (1<<22)
        r5 |= (1 << 22);
        // control=101 => R5
        r5 |= 0x5;
        regs_.R5 = r5;
    }

private:
    double fRef_;     // reference frequency in Hz
    bool   refDbl_;   // reference doubler enabled
    bool   rdiv2_;    // reference divide-by-2 enabled
    int    rCounter_; // R divider
    double fOut_;     // last requested output frequency
    double fChan_;    // last requested channel spacing
    Regs   regs_;     // final computed registers
};

/******************************************************************************
 * Example usage in a main() function (test mode).
 * Define TEST_ADF4351 before compiling if this standalone test is needed.
 *****************************************************************************/
#ifdef TEST_ADF4351
#include <cstdio>

int main()
{
    // Create a synthesizer instance for a 10 MHz reference, no doubler, no /2, R=1
    ADF4351 synth(10.0e6, false, false, 1);

    // Set frequency to 100 MHz (integer mode)
    bool ok = synth.setFrequency(100e6, 0.0);
    if(!ok) {
        std::cerr << "Failed to set 100 MHz.\n";
        return 1;
    }
    auto regsLow = synth.getRegisters();
    std::printf("For 100 MHz:\n");
    std::printf("R5=0x%08X\nR4=0x%08X\nR3=0x%08X\nR2=0x%08X\nR1=0x%08X\nR0=0x%08X\n",
        regsLow.R5, regsLow.R4, regsLow.R3, regsLow.R2, regsLow.R1, regsLow.R0);

    // Set frequency to 2.0 GHz (integer mode)
    ok = synth.setFrequency(2.0e9, 0.0);
    if(!ok) {
        std::cerr << "Failed to set 2.0 GHz.\n";
        return 1;
    }
    auto regsHigh = synth.getRegisters();
    std::printf("\nFor 2 GHz:\n");
    std::printf("R5=0x%08X\nR4=0x%08X\nR3=0x%08X\nR2=0x%08X\nR1=0x%08X\nR0=0x%08X\n",
        regsHigh.R5, regsHigh.R4, regsHigh.R3, regsHigh.R2, regsHigh.R1, regsHigh.R0);

    // Example fractional usage: 2.45 GHz with 1 MHz channel spacing
    synth.setFrequency(2.45e9, 1e6);
    auto frac = synth.getRegisters();
    std::printf("\nFractional 2.45 GHz:\n");
    std::printf("R5=0x%08X\nR4=0x%08X\nR3=0x%08X\nR2=0x%08X\nR1=0x%08X\nR0=0x%08X\n",
        frac.R5, frac.R4, frac.R3, frac.R2, frac.R1, frac.R0);

    return 0;
}
#endif
