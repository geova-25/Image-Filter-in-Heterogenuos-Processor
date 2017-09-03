	component multicore is
		port (
			clk_clk            : in    std_logic                     := 'X';             -- clk
			led_export         : out   std_logic_vector(7 downto 0);                     -- export
			reset_reset_n      : in    std_logic                     := 'X';             -- reset_n
			sdram_clk_clk      : out   std_logic;                                        -- clk
			sdram_wire_addr    : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba      : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n   : out   std_logic;                                        -- cas_n
			sdram_wire_cke     : out   std_logic;                                        -- cke
			sdram_wire_cs_n    : out   std_logic;                                        -- cs_n
			sdram_wire_dq      : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm     : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n   : out   std_logic;                                        -- ras_n
			sdram_wire_we_n    : out   std_logic;                                        -- we_n
			memory_mem_a       : out   std_logic_vector(12 downto 0);                    -- mem_a
			memory_mem_ba      : out   std_logic_vector(2 downto 0);                     -- mem_ba
			memory_mem_ck      : out   std_logic;                                        -- mem_ck
			memory_mem_ck_n    : out   std_logic;                                        -- mem_ck_n
			memory_mem_cke     : out   std_logic;                                        -- mem_cke
			memory_mem_cs_n    : out   std_logic;                                        -- mem_cs_n
			memory_mem_ras_n   : out   std_logic;                                        -- mem_ras_n
			memory_mem_cas_n   : out   std_logic;                                        -- mem_cas_n
			memory_mem_we_n    : out   std_logic;                                        -- mem_we_n
			memory_mem_reset_n : out   std_logic;                                        -- mem_reset_n
			memory_mem_dq      : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dq
			memory_mem_dqs     : inout std_logic                     := 'X';             -- mem_dqs
			memory_mem_dqs_n   : inout std_logic                     := 'X';             -- mem_dqs_n
			memory_mem_odt     : out   std_logic;                                        -- mem_odt
			memory_mem_dm      : out   std_logic;                                        -- mem_dm
			memory_oct_rzqin   : in    std_logic                     := 'X'              -- oct_rzqin
		);
	end component multicore;

	u0 : component multicore
		port map (
			clk_clk            => CONNECTED_TO_clk_clk,            --        clk.clk
			led_export         => CONNECTED_TO_led_export,         --        led.export
			reset_reset_n      => CONNECTED_TO_reset_reset_n,      --      reset.reset_n
			sdram_clk_clk      => CONNECTED_TO_sdram_clk_clk,      --  sdram_clk.clk
			sdram_wire_addr    => CONNECTED_TO_sdram_wire_addr,    -- sdram_wire.addr
			sdram_wire_ba      => CONNECTED_TO_sdram_wire_ba,      --           .ba
			sdram_wire_cas_n   => CONNECTED_TO_sdram_wire_cas_n,   --           .cas_n
			sdram_wire_cke     => CONNECTED_TO_sdram_wire_cke,     --           .cke
			sdram_wire_cs_n    => CONNECTED_TO_sdram_wire_cs_n,    --           .cs_n
			sdram_wire_dq      => CONNECTED_TO_sdram_wire_dq,      --           .dq
			sdram_wire_dqm     => CONNECTED_TO_sdram_wire_dqm,     --           .dqm
			sdram_wire_ras_n   => CONNECTED_TO_sdram_wire_ras_n,   --           .ras_n
			sdram_wire_we_n    => CONNECTED_TO_sdram_wire_we_n,    --           .we_n
			memory_mem_a       => CONNECTED_TO_memory_mem_a,       --     memory.mem_a
			memory_mem_ba      => CONNECTED_TO_memory_mem_ba,      --           .mem_ba
			memory_mem_ck      => CONNECTED_TO_memory_mem_ck,      --           .mem_ck
			memory_mem_ck_n    => CONNECTED_TO_memory_mem_ck_n,    --           .mem_ck_n
			memory_mem_cke     => CONNECTED_TO_memory_mem_cke,     --           .mem_cke
			memory_mem_cs_n    => CONNECTED_TO_memory_mem_cs_n,    --           .mem_cs_n
			memory_mem_ras_n   => CONNECTED_TO_memory_mem_ras_n,   --           .mem_ras_n
			memory_mem_cas_n   => CONNECTED_TO_memory_mem_cas_n,   --           .mem_cas_n
			memory_mem_we_n    => CONNECTED_TO_memory_mem_we_n,    --           .mem_we_n
			memory_mem_reset_n => CONNECTED_TO_memory_mem_reset_n, --           .mem_reset_n
			memory_mem_dq      => CONNECTED_TO_memory_mem_dq,      --           .mem_dq
			memory_mem_dqs     => CONNECTED_TO_memory_mem_dqs,     --           .mem_dqs
			memory_mem_dqs_n   => CONNECTED_TO_memory_mem_dqs_n,   --           .mem_dqs_n
			memory_mem_odt     => CONNECTED_TO_memory_mem_odt,     --           .mem_odt
			memory_mem_dm      => CONNECTED_TO_memory_mem_dm,      --           .mem_dm
			memory_oct_rzqin   => CONNECTED_TO_memory_oct_rzqin    --           .oct_rzqin
		);
