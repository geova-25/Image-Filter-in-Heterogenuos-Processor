
module interconexion (
	clk_clk,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	reset_reset_n,
	hps_h2f_mpu_events_eventi,
	hps_h2f_mpu_events_evento,
	hps_h2f_mpu_events_standbywfe,
	hps_h2f_mpu_events_standbywfi,
	hps_io_hps_io_gpio_inst_HLGPI0,
	hps_io_hps_io_gpio_inst_HLGPI1,
	hps_io_hps_io_gpio_inst_HLGPI2,
	hps_io_hps_io_gpio_inst_HLGPI3,
	hps_io_hps_io_gpio_inst_HLGPI4,
	hps_io_hps_io_gpio_inst_HLGPI5,
	hps_io_hps_io_gpio_inst_HLGPI6,
	hps_io_hps_io_gpio_inst_HLGPI7,
	hps_io_hps_io_gpio_inst_HLGPI8,
	hps_io_hps_io_gpio_inst_HLGPI9,
	hps_io_hps_io_gpio_inst_HLGPI10,
	hps_io_hps_io_gpio_inst_HLGPI11,
	hps_io_hps_io_gpio_inst_HLGPI12,
	hps_io_hps_io_gpio_inst_HLGPI13);	

	input		clk_clk;
	output	[12:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[7:0]	memory_mem_dq;
	inout		memory_mem_dqs;
	inout		memory_mem_dqs_n;
	output		memory_mem_odt;
	output		memory_mem_dm;
	input		memory_oct_rzqin;
	output	[11:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[31:0]	sdram_wire_dq;
	output	[3:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		reset_reset_n;
	input		hps_h2f_mpu_events_eventi;
	output		hps_h2f_mpu_events_evento;
	output	[1:0]	hps_h2f_mpu_events_standbywfe;
	output	[1:0]	hps_h2f_mpu_events_standbywfi;
	input		hps_io_hps_io_gpio_inst_HLGPI0;
	input		hps_io_hps_io_gpio_inst_HLGPI1;
	input		hps_io_hps_io_gpio_inst_HLGPI2;
	input		hps_io_hps_io_gpio_inst_HLGPI3;
	input		hps_io_hps_io_gpio_inst_HLGPI4;
	input		hps_io_hps_io_gpio_inst_HLGPI5;
	input		hps_io_hps_io_gpio_inst_HLGPI6;
	input		hps_io_hps_io_gpio_inst_HLGPI7;
	input		hps_io_hps_io_gpio_inst_HLGPI8;
	input		hps_io_hps_io_gpio_inst_HLGPI9;
	input		hps_io_hps_io_gpio_inst_HLGPI10;
	input		hps_io_hps_io_gpio_inst_HLGPI11;
	input		hps_io_hps_io_gpio_inst_HLGPI12;
	input		hps_io_hps_io_gpio_inst_HLGPI13;
endmodule
