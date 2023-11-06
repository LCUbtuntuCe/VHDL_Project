library ieee;
use ieee.std_logic_1164.all;

entity dff1 is
	port(clk, d:in std_logic ;
			  q:out std_logic) ;
end dff1;
architecture rtl of dff1 is
begin
	process(clk)
	begin
		if (clk'event and clk = '1') then
			q<=d ;
		end if ;
	end process;
end rtl;