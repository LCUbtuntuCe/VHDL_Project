library ieee ;
use ieee.std_logic_1164.all ;

entity diff is
	port (d, clk, rst:in std_logic;
						 q:out std_logic) ;
end diff ;

architecture behavior of diff is
begin
	process (clk, rst)
	begin
		if (rst = '1') then
			q <= '0' ;
		elsif clk' event and clk = '1' then 
			q <= d ;
	end if ;
	end process ;
end behavior ;