//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Wed Feb  7 20:59:46 2024
//Host        : Moataz running 64-bit major release  (build 9200)
//Command     : generate_target pmod_design_with_uart_wrapper.bd
//Design      : pmod_design_with_uart_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module pmod_design_with_uart_wrapper
   (reset,
    sys_clock,
    usb_uart_rxd,
    usb_uart_txd);
  input reset;
  input sys_clock;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire reset;
  wire sys_clock;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  pmod_design_with_uart pmod_design_with_uart_i
       (.reset(reset),
        .sys_clock(sys_clock),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
