library ieee ;
use ieee.std_logic_1164.all ;
entity jioujy is
	port (
		d : in std_logic_vector(7 downto 0) ;
		q : out std_logic
	);
end jioujy ;
architecture rtl of jioujy is
begin
	process(d)
		variable tmp : std_logic ;
	begin
		tmp := '0';
		for j in 0 to 7 loop
			tmp := tmp xor d(j) ;
		end loop ;
		q <= tmp ;
	end process ;
end rtl ;