library ieee ;
use ieee.std_logic_1164.all ;
entity priorityencoder is
	port ( input : in std_logic_vector(7 downto 0) ;
		   y : out std_logic_vector(2 downto 0)
	) ;
end priorityencoder ;
architecture rtl of priorityencoder is
begin
	process (input)
	begin
		if input(0) = '0' then
			y <= "111" ;
		elsif input(1) = '0' then
			y <= "110" ;
		elsif input(2) = '0' then
			y <= "101" ;
		elsif input(3) = '0' then
			y <= "100" ;
		elsif input(4) = '0' then
			y <= "011" ;
		elsif input(5) = '0' then
			y <= "010" ;
		elsif input(6) = '0' then
			y <= "001" ;
		else
			y <= "000" ;
		end if ;
	end process ;
end rtl ;