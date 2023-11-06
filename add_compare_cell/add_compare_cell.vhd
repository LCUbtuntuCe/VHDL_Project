library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity add_compare_cell is
	port (
	a,b: in std_logic_vector(2 downto 0) ;
	comp: out std_logic ;
	sum: out std_logic_vector(3 downto 0)) ;
end entity ;

architecture dataflow of add_compare_cell is
	signal a_uns, b_uns: unsigned (3 downto 0) ;
begin
	a_uns <= unsigned ('0' & a) ;
	b_uns <= unsigned ('0' & b) ;
	comp <= '1' when a_uns > b_uns else '0' ;
	sum <= std_logic_vector(a_uns + b_uns) ;
end architecture ;