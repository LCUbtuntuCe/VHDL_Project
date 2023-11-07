library ieee ;
use ieee.std_logic_1164.all ;
entity mux2 is
	port (
		d0 : in std_logic_vector(3 downto 0) ;
		d1 : in std_logic_vector(3 downto 0) ;
		sel: in std_logic ;
		q : out std_logic_vector(3 downto 0)
	) ;
end mux2 ;
architecture rtl of mux2 is
begin
	process (d0, d1, sel)
	begin
		if (sel = '1') then
			q <= d0 ;
		else
			q <= d1 ;
		end if ;
	end process ;
end rtl ;