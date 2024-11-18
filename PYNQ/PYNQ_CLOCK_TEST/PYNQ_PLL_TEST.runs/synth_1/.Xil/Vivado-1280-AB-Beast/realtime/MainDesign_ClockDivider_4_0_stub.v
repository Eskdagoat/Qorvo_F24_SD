// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ClockDivider,Vivado 2024.1" *)
module MainDesign_ClockDivider_4_0(CLK_IN, CLK_OUT);
  input CLK_IN /* synthesis syn_isclock = 1 */;
  output CLK_OUT;
endmodule
