// (C) 2001-2016 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


module interconexion_hps_hps_io_border(
// memory
  output wire [13 - 1 : 0 ] mem_a
 ,output wire [3 - 1 : 0 ] mem_ba
 ,output wire [1 - 1 : 0 ] mem_ck
 ,output wire [1 - 1 : 0 ] mem_ck_n
 ,output wire [1 - 1 : 0 ] mem_cke
 ,output wire [1 - 1 : 0 ] mem_cs_n
 ,output wire [1 - 1 : 0 ] mem_ras_n
 ,output wire [1 - 1 : 0 ] mem_cas_n
 ,output wire [1 - 1 : 0 ] mem_we_n
 ,output wire [1 - 1 : 0 ] mem_reset_n
 ,inout wire [8 - 1 : 0 ] mem_dq
 ,inout wire [1 - 1 : 0 ] mem_dqs
 ,inout wire [1 - 1 : 0 ] mem_dqs_n
 ,output wire [1 - 1 : 0 ] mem_odt
 ,output wire [1 - 1 : 0 ] mem_dm
 ,input wire [1 - 1 : 0 ] oct_rzqin
// hps_io
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI0
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI1
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI2
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI3
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI4
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI5
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI6
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI7
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI8
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI9
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI10
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI11
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI12
 ,input wire [1 - 1 : 0 ] hps_io_gpio_inst_HLGPI13
);


cyclonev_hps_peripheral_gpio gpio_inst(
 .GPIO2_PORTA_I({
    hps_io_gpio_inst_HLGPI13[0:0] // 26:26
   ,hps_io_gpio_inst_HLGPI12[0:0] // 25:25
   ,hps_io_gpio_inst_HLGPI11[0:0] // 24:24
   ,hps_io_gpio_inst_HLGPI10[0:0] // 23:23
   ,hps_io_gpio_inst_HLGPI9[0:0] // 22:22
   ,hps_io_gpio_inst_HLGPI8[0:0] // 21:21
   ,hps_io_gpio_inst_HLGPI7[0:0] // 20:20
   ,hps_io_gpio_inst_HLGPI6[0:0] // 19:19
   ,hps_io_gpio_inst_HLGPI5[0:0] // 18:18
   ,hps_io_gpio_inst_HLGPI4[0:0] // 17:17
   ,hps_io_gpio_inst_HLGPI3[0:0] // 16:16
   ,hps_io_gpio_inst_HLGPI2[0:0] // 15:15
   ,hps_io_gpio_inst_HLGPI1[0:0] // 14:14
   ,hps_io_gpio_inst_HLGPI0[0:0] // 13:13
   ,13'b0000000000000 // 12:0
  })
);


hps_sdram hps_sdram_inst(
 .mem_dq({
    mem_dq[7:0] // 7:0
  })
,.mem_odt({
    mem_odt[0:0] // 0:0
  })
,.mem_ras_n({
    mem_ras_n[0:0] // 0:0
  })
,.mem_dqs_n({
    mem_dqs_n[0:0] // 0:0
  })
,.mem_dqs({
    mem_dqs[0:0] // 0:0
  })
,.mem_dm({
    mem_dm[0:0] // 0:0
  })
,.mem_we_n({
    mem_we_n[0:0] // 0:0
  })
,.mem_cas_n({
    mem_cas_n[0:0] // 0:0
  })
,.mem_ba({
    mem_ba[2:0] // 2:0
  })
,.mem_a({
    mem_a[12:0] // 12:0
  })
,.mem_cs_n({
    mem_cs_n[0:0] // 0:0
  })
,.mem_ck({
    mem_ck[0:0] // 0:0
  })
,.mem_cke({
    mem_cke[0:0] // 0:0
  })
,.oct_rzqin({
    oct_rzqin[0:0] // 0:0
  })
,.mem_reset_n({
    mem_reset_n[0:0] // 0:0
  })
,.mem_ck_n({
    mem_ck_n[0:0] // 0:0
  })
);

endmodule

