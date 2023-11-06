library ieee ;
use ieee.std_logic_1164.all ;

entity flip_flop is
	port (
		d, clk, rset: in std_logic ;
		q: out std_logic) ;
end entity ;

architecture flip_flop of flip_flop is
begin
	process (clk, rset)
	begin
		if rset then
			q <= '0' ;
		elsif rising_dege(clk) then
			q <= d ;
		end if ;
	end process ;
end architecture ;