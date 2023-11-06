library ieee ;
use ieee.std_logic_1164.all ;

entity parity_detector is
	port (
		byte: in std_logic_vector(7 downto 0) ;
		parity: out std_logic) ;
end entity ;

architecture tree_type of parity_detector is
begin
	parity <= (byte(0) xor byte(1)) xor (byte(2) xor byte(3)) xor
				 (byte(4) xor byte(5)) xor (byte(6) xor byte(7)) ;
end architecture ;