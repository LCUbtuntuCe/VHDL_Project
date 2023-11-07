library ieee ;
use ieee.std_logic_1164.all ;
entity dff2 is
	port ( clk, d : in std_logic ;
		   q : out std_logic
	) ;
end dff2 ;
architecture rtl of dff2 is
begin
	process (clk)
	begin
		if (clk'event and clk = '1') then
			q <= d ;
		end if ;
	end process ;
end rtl ;