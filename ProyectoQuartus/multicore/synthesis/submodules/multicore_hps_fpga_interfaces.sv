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


module multicore_hps_fpga_interfaces(
// h2f_reset
  output wire [1 - 1 : 0 ] h2f_rst_n
// h2f_axi_clock
 ,input wire [1 - 1 : 0 ] h2f_axi_clk
// h2f_axi_master
 ,output wire [12 - 1 : 0 ] h2f_AWID
 ,output wire [30 - 1 : 0 ] h2f_AWADDR
 ,output wire [4 - 1 : 0 ] h2f_AWLEN
 ,output wire [3 - 1 : 0 ] h2f_AWSIZE
 ,output wire [2 - 1 : 0 ] h2f_AWBURST
 ,output wire [2 - 1 : 0 ] h2f_AWLOCK
 ,output wire [4 - 1 : 0 ] h2f_AWCACHE
 ,output wire [3 - 1 : 0 ] h2f_AWPROT
 ,output wire [1 - 1 : 0 ] h2f_AWVALID
 ,input wire [1 - 1 : 0 ] h2f_AWREADY
 ,output wire [12 - 1 : 0 ] h2f_WID
 ,output wire [64 - 1 : 0 ] h2f_WDATA
 ,output wire [8 - 1 : 0 ] h2f_WSTRB
 ,output wire [1 - 1 : 0 ] h2f_WLAST
 ,output wire [1 - 1 : 0 ] h2f_WVALID
 ,input wire [1 - 1 : 0 ] h2f_WREADY
 ,input wire [12 - 1 : 0 ] h2f_BID
 ,input wire [2 - 1 : 0 ] h2f_BRESP
 ,input wire [1 - 1 : 0 ] h2f_BVALID
 ,output wire [1 - 1 : 0 ] h2f_BREADY
 ,output wire [12 - 1 : 0 ] h2f_ARID
 ,output wire [30 - 1 : 0 ] h2f_ARADDR
 ,output wire [4 - 1 : 0 ] h2f_ARLEN
 ,output wire [3 - 1 : 0 ] h2f_ARSIZE
 ,output wire [2 - 1 : 0 ] h2f_ARBURST
 ,output wire [2 - 1 : 0 ] h2f_ARLOCK
 ,output wire [4 - 1 : 0 ] h2f_ARCACHE
 ,output wire [3 - 1 : 0 ] h2f_ARPROT
 ,output wire [1 - 1 : 0 ] h2f_ARVALID
 ,input wire [1 - 1 : 0 ] h2f_ARREADY
 ,input wire [12 - 1 : 0 ] h2f_RID
 ,input wire [64 - 1 : 0 ] h2f_RDATA
 ,input wire [2 - 1 : 0 ] h2f_RRESP
 ,input wire [1 - 1 : 0 ] h2f_RLAST
 ,input wire [1 - 1 : 0 ] h2f_RVALID
 ,output wire [1 - 1 : 0 ] h2f_RREADY
// f2h_sdram0_data
 ,input wire [32 - 1 : 0 ] f2h_sdram0_ARADDR
 ,input wire [4 - 1 : 0 ] f2h_sdram0_ARLEN
 ,input wire [8 - 1 : 0 ] f2h_sdram0_ARID
 ,input wire [3 - 1 : 0 ] f2h_sdram0_ARSIZE
 ,input wire [2 - 1 : 0 ] f2h_sdram0_ARBURST
 ,input wire [2 - 1 : 0 ] f2h_sdram0_ARLOCK
 ,input wire [3 - 1 : 0 ] f2h_sdram0_ARPROT
 ,input wire [1 - 1 : 0 ] f2h_sdram0_ARVALID
 ,input wire [4 - 1 : 0 ] f2h_sdram0_ARCACHE
 ,input wire [32 - 1 : 0 ] f2h_sdram0_AWADDR
 ,input wire [4 - 1 : 0 ] f2h_sdram0_AWLEN
 ,input wire [8 - 1 : 0 ] f2h_sdram0_AWID
 ,input wire [3 - 1 : 0 ] f2h_sdram0_AWSIZE
 ,input wire [2 - 1 : 0 ] f2h_sdram0_AWBURST
 ,input wire [2 - 1 : 0 ] f2h_sdram0_AWLOCK
 ,input wire [3 - 1 : 0 ] f2h_sdram0_AWPROT
 ,input wire [1 - 1 : 0 ] f2h_sdram0_AWVALID
 ,input wire [4 - 1 : 0 ] f2h_sdram0_AWCACHE
 ,output wire [2 - 1 : 0 ] f2h_sdram0_BRESP
 ,output wire [8 - 1 : 0 ] f2h_sdram0_BID
 ,output wire [1 - 1 : 0 ] f2h_sdram0_BVALID
 ,input wire [1 - 1 : 0 ] f2h_sdram0_BREADY
 ,output wire [1 - 1 : 0 ] f2h_sdram0_ARREADY
 ,output wire [1 - 1 : 0 ] f2h_sdram0_AWREADY
 ,input wire [1 - 1 : 0 ] f2h_sdram0_RREADY
 ,output wire [64 - 1 : 0 ] f2h_sdram0_RDATA
 ,output wire [2 - 1 : 0 ] f2h_sdram0_RRESP
 ,output wire [1 - 1 : 0 ] f2h_sdram0_RLAST
 ,output wire [8 - 1 : 0 ] f2h_sdram0_RID
 ,output wire [1 - 1 : 0 ] f2h_sdram0_RVALID
 ,input wire [1 - 1 : 0 ] f2h_sdram0_WLAST
 ,input wire [1 - 1 : 0 ] f2h_sdram0_WVALID
 ,input wire [64 - 1 : 0 ] f2h_sdram0_WDATA
 ,input wire [8 - 1 : 0 ] f2h_sdram0_WSTRB
 ,output wire [1 - 1 : 0 ] f2h_sdram0_WREADY
 ,input wire [8 - 1 : 0 ] f2h_sdram0_WID
// f2h_sdram0_clock
 ,input wire [1 - 1 : 0 ] f2h_sdram0_clk
);


wire [11 - 1 : 0] intermediate;
assign intermediate[1:1] = intermediate[0:0];
assign intermediate[5:5] = intermediate[3:3];
assign intermediate[6:6] = intermediate[4:4];
assign intermediate[2:2] = intermediate[8:8];
assign intermediate[7:7] = intermediate[8:8];
assign intermediate[9:9] = intermediate[8:8];
assign intermediate[10:10] = intermediate[8:8];
assign intermediate[0:0] = f2h_sdram0_RREADY[0:0];
assign intermediate[3:3] = f2h_sdram0_WLAST[0:0];
assign intermediate[4:4] = f2h_sdram0_WVALID[0:0];
assign intermediate[8:8] = f2h_sdram0_clk[0:0];

cyclonev_hps_interface_clocks_resets clocks_resets(
 .f2h_pending_rst_ack({
    1'b1 // 0:0
  })
,.f2h_warm_rst_req_n({
    1'b1 // 0:0
  })
,.f2h_dbg_rst_req_n({
    1'b1 // 0:0
  })
,.h2f_rst_n({
    h2f_rst_n[0:0] // 0:0
  })
,.f2h_cold_rst_req_n({
    1'b1 // 0:0
  })
);


cyclonev_hps_interface_dbg_apb debug_apb(
 .DBG_APB_DISABLE({
    1'b0 // 0:0
  })
,.P_CLK_EN({
    1'b0 // 0:0
  })
);


cyclonev_hps_interface_tpiu_trace tpiu(
 .traceclk_ctl({
    1'b1 // 0:0
  })
);


cyclonev_hps_interface_boot_from_fpga boot_from_fpga(
 .boot_from_fpga_ready({
    1'b0 // 0:0
  })
,.boot_from_fpga_on_failure({
    1'b0 // 0:0
  })
,.bsel_en({
    1'b0 // 0:0
  })
,.csel_en({
    1'b0 // 0:0
  })
,.csel({
    2'b01 // 1:0
  })
,.bsel({
    3'b001 // 2:0
  })
);


cyclonev_hps_interface_fpga2hps fpga2hps(
 .port_size_config({
    2'b11 // 1:0
  })
);


cyclonev_hps_interface_hps2fpga hps2fpga(
 .port_size_config({
    2'b01 // 1:0
  })
,.arsize({
    h2f_ARSIZE[2:0] // 2:0
  })
,.wvalid({
    h2f_WVALID[0:0] // 0:0
  })
,.rlast({
    h2f_RLAST[0:0] // 0:0
  })
,.clk({
    h2f_axi_clk[0:0] // 0:0
  })
,.rresp({
    h2f_RRESP[1:0] // 1:0
  })
,.arready({
    h2f_ARREADY[0:0] // 0:0
  })
,.arprot({
    h2f_ARPROT[2:0] // 2:0
  })
,.araddr({
    h2f_ARADDR[29:0] // 29:0
  })
,.bvalid({
    h2f_BVALID[0:0] // 0:0
  })
,.arid({
    h2f_ARID[11:0] // 11:0
  })
,.bid({
    h2f_BID[11:0] // 11:0
  })
,.arburst({
    h2f_ARBURST[1:0] // 1:0
  })
,.arcache({
    h2f_ARCACHE[3:0] // 3:0
  })
,.awvalid({
    h2f_AWVALID[0:0] // 0:0
  })
,.wdata({
    h2f_WDATA[63:0] // 63:0
  })
,.rid({
    h2f_RID[11:0] // 11:0
  })
,.rvalid({
    h2f_RVALID[0:0] // 0:0
  })
,.wready({
    h2f_WREADY[0:0] // 0:0
  })
,.awlock({
    h2f_AWLOCK[1:0] // 1:0
  })
,.bresp({
    h2f_BRESP[1:0] // 1:0
  })
,.arlen({
    h2f_ARLEN[3:0] // 3:0
  })
,.awsize({
    h2f_AWSIZE[2:0] // 2:0
  })
,.awlen({
    h2f_AWLEN[3:0] // 3:0
  })
,.bready({
    h2f_BREADY[0:0] // 0:0
  })
,.awid({
    h2f_AWID[11:0] // 11:0
  })
,.rdata({
    h2f_RDATA[63:0] // 63:0
  })
,.awready({
    h2f_AWREADY[0:0] // 0:0
  })
,.arvalid({
    h2f_ARVALID[0:0] // 0:0
  })
,.wlast({
    h2f_WLAST[0:0] // 0:0
  })
,.awprot({
    h2f_AWPROT[2:0] // 2:0
  })
,.awaddr({
    h2f_AWADDR[29:0] // 29:0
  })
,.wid({
    h2f_WID[11:0] // 11:0
  })
,.awcache({
    h2f_AWCACHE[3:0] // 3:0
  })
,.arlock({
    h2f_ARLOCK[1:0] // 1:0
  })
,.awburst({
    h2f_AWBURST[1:0] // 1:0
  })
,.rready({
    h2f_RREADY[0:0] // 0:0
  })
,.wstrb({
    h2f_WSTRB[7:0] // 7:0
  })
);


cyclonev_hps_interface_fpga2sdram f2sdram(
 .cmd_data_1({
    f2h_sdram0_AWPROT[1:0] // 59:58
   ,f2h_sdram0_AWLOCK[1:0] // 57:56
   ,f2h_sdram0_AWBURST[1:0] // 55:54
   ,f2h_sdram0_AWSIZE[2:0] // 53:51
   ,f2h_sdram0_AWID[7:0] // 50:43
   ,4'b0000 // 42:39
   ,f2h_sdram0_AWLEN[3:0] // 38:35
   ,f2h_sdram0_AWADDR[31:0] // 34:3
   ,1'b0 // 2:2
   ,1'b1 // 1:1
   ,1'b0 // 0:0
  })
,.wr_valid_0({
    intermediate[6:6] // 0:0
  })
,.cmd_data_0({
    f2h_sdram0_ARPROT[1:0] // 59:58
   ,f2h_sdram0_ARLOCK[1:0] // 57:56
   ,f2h_sdram0_ARBURST[1:0] // 55:54
   ,f2h_sdram0_ARSIZE[2:0] // 53:51
   ,f2h_sdram0_ARID[7:0] // 50:43
   ,4'b0000 // 42:39
   ,f2h_sdram0_ARLEN[3:0] // 38:35
   ,f2h_sdram0_ARADDR[31:0] // 34:3
   ,1'b0 // 2:2
   ,1'b0 // 1:1
   ,1'b1 // 0:0
  })
,.cfg_port_width({
    12'b000000000101 // 11:0
  })
,.rd_valid_0({
    f2h_sdram0_RVALID[0:0] // 0:0
  })
,.wr_clk_0({
    intermediate[7:7] // 0:0
  })
,.cfg_cport_type({
    12'b000000000110 // 11:0
  })
,.wr_data_0({
    17'b00000000000000000 // 89:73
   ,intermediate[5:5] // 72:72
   ,f2h_sdram0_WSTRB[7:0] // 71:64
   ,f2h_sdram0_WDATA[63:0] // 63:0
  })
,.cfg_rfifo_cport_map({
    16'b0000000000000000 // 15:0
  })
,.cfg_cport_wfifo_map({
    18'b000000000000000000 // 17:0
  })
,.cmd_port_clk_1({
    intermediate[10:10] // 0:0
  })
,.cmd_port_clk_0({
    intermediate[9:9] // 0:0
  })
,.cfg_cport_rfifo_map({
    18'b000000000000000000 // 17:0
  })
,.wrack_data_1({
    f2h_sdram0_BID[7:0] // 9:2
   ,f2h_sdram0_BRESP[1:0] // 1:0
  })
,.rd_ready_0({
    intermediate[1:1] // 0:0
  })
,.cmd_ready_1({
    f2h_sdram0_AWREADY[0:0] // 0:0
  })
,.rd_clk_0({
    intermediate[2:2] // 0:0
  })
,.cmd_ready_0({
    f2h_sdram0_ARREADY[0:0] // 0:0
  })
,.cfg_wfifo_cport_map({
    16'b0000000000000001 // 15:0
  })
,.wrack_ready_1({
    f2h_sdram0_BREADY[0:0] // 0:0
  })
,.cmd_valid_1({
    f2h_sdram0_AWVALID[0:0] // 0:0
  })
,.cmd_valid_0({
    f2h_sdram0_ARVALID[0:0] // 0:0
  })
,.wrack_valid_1({
    f2h_sdram0_BVALID[0:0] // 0:0
  })
,.wr_ready_0({
    f2h_sdram0_WREADY[0:0] // 0:0
  })
,.rd_data_0({
    f2h_sdram0_RID[7:0] // 74:67
   ,f2h_sdram0_RLAST[0:0] // 66:66
   ,f2h_sdram0_RRESP[1:0] // 65:64
   ,f2h_sdram0_RDATA[63:0] // 63:0
  })
,.cfg_axi_mm_select({
    6'b000011 // 5:0
  })
);

endmodule

