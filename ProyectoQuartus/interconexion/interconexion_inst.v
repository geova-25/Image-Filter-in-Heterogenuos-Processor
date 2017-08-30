	interconexion u0 (
		.clk_clk                       (<connected-to-clk_clk>),                       //                clk.clk
		.hps_h2f_mpu_events_eventi     (<connected-to-hps_h2f_mpu_events_eventi>),     // hps_h2f_mpu_events.eventi
		.hps_h2f_mpu_events_evento     (<connected-to-hps_h2f_mpu_events_evento>),     //                   .evento
		.hps_h2f_mpu_events_standbywfe (<connected-to-hps_h2f_mpu_events_standbywfe>), //                   .standbywfe
		.hps_h2f_mpu_events_standbywfi (<connected-to-hps_h2f_mpu_events_standbywfi>), //                   .standbywfi
		.memory_mem_a                  (<connected-to-memory_mem_a>),                  //             memory.mem_a
		.memory_mem_ba                 (<connected-to-memory_mem_ba>),                 //                   .mem_ba
		.memory_mem_ck                 (<connected-to-memory_mem_ck>),                 //                   .mem_ck
		.memory_mem_ck_n               (<connected-to-memory_mem_ck_n>),               //                   .mem_ck_n
		.memory_mem_cke                (<connected-to-memory_mem_cke>),                //                   .mem_cke
		.memory_mem_cs_n               (<connected-to-memory_mem_cs_n>),               //                   .mem_cs_n
		.memory_mem_ras_n              (<connected-to-memory_mem_ras_n>),              //                   .mem_ras_n
		.memory_mem_cas_n              (<connected-to-memory_mem_cas_n>),              //                   .mem_cas_n
		.memory_mem_we_n               (<connected-to-memory_mem_we_n>),               //                   .mem_we_n
		.memory_mem_reset_n            (<connected-to-memory_mem_reset_n>),            //                   .mem_reset_n
		.memory_mem_dq                 (<connected-to-memory_mem_dq>),                 //                   .mem_dq
		.memory_mem_dqs                (<connected-to-memory_mem_dqs>),                //                   .mem_dqs
		.memory_mem_dqs_n              (<connected-to-memory_mem_dqs_n>),              //                   .mem_dqs_n
		.memory_mem_odt                (<connected-to-memory_mem_odt>),                //                   .mem_odt
		.memory_mem_dm                 (<connected-to-memory_mem_dm>),                 //                   .mem_dm
		.memory_oct_rzqin              (<connected-to-memory_oct_rzqin>),              //                   .oct_rzqin
		.reset_reset_n                 (<connected-to-reset_reset_n>),                 //              reset.reset_n
		.sdram_wire_addr               (<connected-to-sdram_wire_addr>),               //         sdram_wire.addr
		.sdram_wire_ba                 (<connected-to-sdram_wire_ba>),                 //                   .ba
		.sdram_wire_cas_n              (<connected-to-sdram_wire_cas_n>),              //                   .cas_n
		.sdram_wire_cke                (<connected-to-sdram_wire_cke>),                //                   .cke
		.sdram_wire_cs_n               (<connected-to-sdram_wire_cs_n>),               //                   .cs_n
		.sdram_wire_dq                 (<connected-to-sdram_wire_dq>),                 //                   .dq
		.sdram_wire_dqm                (<connected-to-sdram_wire_dqm>),                //                   .dqm
		.sdram_wire_ras_n              (<connected-to-sdram_wire_ras_n>),              //                   .ras_n
		.sdram_wire_we_n               (<connected-to-sdram_wire_we_n>)                //                   .we_n
	);

