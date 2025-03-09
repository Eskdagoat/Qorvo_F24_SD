// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module ClockDivider_Block (
  CLK_IN,
  pmod_a_7,
  pmod_a_6,
  syzygy_a_p2c_clk_p,
  pmod_a_2,
  pmod_a_3
);

  (* X_INTERFACE_IGNORE = "true" *)
  input CLK_IN;
  (* X_INTERFACE_IGNORE = "true" *)
  output pmod_a_7;
  (* X_INTERFACE_IGNORE = "true" *)
  output pmod_a_6;
  (* X_INTERFACE_IGNORE = "true" *)
  input syzygy_a_p2c_clk_p;
  (* X_INTERFACE_IGNORE = "true" *)
  output pmod_a_2;
  (* X_INTERFACE_IGNORE = "true" *)
  output pmod_a_3;

  // stub module has no contents

endmodule
