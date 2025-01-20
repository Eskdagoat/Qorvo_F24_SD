`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 10:54:46 PM
// Design Name: 
// Module Name: ClockDivider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// https://blog.umer-farooq.com/a-pynq-z2-guide-for-absolute-dummies-part-iii-tick-tock-using-fpga-clock-33a34ef3f51a#:~:text=Phase%20Lock%20Loop%20%28PLL%29%20is%20a%20hardware%20block,can%20be%20used%20to%20achieve%20the%20desired%20purpose.
module ClockDivider(
    input CLK_IN,
    output reg CLK_OUT
    );
    
    // For everyone rising edge, we will increment the counter variable
    reg[27:0] counter=28'd0;
    
    // parameters: They can be dynamically configured in the RTL diagram
    // Ideally: If you use DIVISOR=2, it will generate a frequency of CLK_IN/2 as the output
    // Use a divisor value that is perfectly divisble by 2. OTherwise you will have unexpected results
    parameter DIVISOR = 28'd2;
    
    //posedge: Perfoms some computation when the rising edge occurs at the CLK_IN
    always @(posedge CLK_IN)
    begin
        counter <= counter + 28'd1;   // At every rising edge, we increment counter variable by 1
        if(counter >= ( DIVISOR-1 ) ) // If the counter is equal or greater than DIVISOR - 1
            counter <= 28'd0;         // then reset the counter variable to 0.
        
        // For first half of the clock period, Set CLK_OUT to 1
        // For second half of the clock period, Set CLK_OUT to 0 
        // Use a divisor that can always be perfectly divided by 2

        CLK_OUT <= ( counter < DIVISOR >> 1 )? 1'b1 : 1'b0;  
    end
endmodule
