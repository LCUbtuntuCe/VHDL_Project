entity SRAM_interface is
	generic (
		ADDR_WIDTH: natural := 16;
		DATA_WIDTH: natural := 8) ;
	port (
		we: out std_logic ;
		addr: out std_logic_vector(ADDR_WIDTH-1 downto 0) ;
		data: inout std_logic_vector(DATA_WIDTH-1 downto 0)) ;
end entity SRAM_interface ;