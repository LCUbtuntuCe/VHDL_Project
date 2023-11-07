library ieee ;
use ieee.std_logic_1164.all ;

entity decoder_38 is
	port(
		d : in std_logic_vector(2 downto 0) ;
		q : out std_logic_vector(7 downto 0)
	) ;
end decoder_38 ;

architecture rtl of decoder_38 is
begin
	process (d)
	begin
		case d is
			when "000" => q <= "00000001" ;
			when "001" => q <= "00000010" ;
			when "010" => q <= "00000100" ;
			when "011" => q <= "00001000" ;
			when "100" => q <= "00010000" ;
			when "101" => q <= "00100000" ;
			when "110" => q <= "01000000" ;
			when others => q <= "10000000" ;
		end case ;
	end process ;
end rtl ;