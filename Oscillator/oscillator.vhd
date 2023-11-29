library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;
use ieee.std_logic_unsigned.all ;

entity Oscillator is
	port(
		sw : in std_logic_vector(2 downto 0) ;
		clk : in std_logic ;
		ld : buffer std_logic
	) ;
end oscillator ;

architecture Delay of Oscillator is
	signal num : integer := 0 ;
begin
	process(sw, clk, num)
		variable n : integer := 0 ;
	begin
		if (sw = "010" or sw = "100" or sw = "110") then
			if (sw = "010") then
				n := 2 ;
			elsif (sw = "100") then
				n := 4 ;
			elsif (sw = "110") then
				n := 6 ;
			end if ;
			if (clk'event and clk = '1') then
				num <= num + 1 ;
				if (num = 1 or ((num-1) rem n = 0)) then
					ld <= '1' ;
				elsif (num /= 1 and ((num-1) rem (n/2) = 0)) then
					ld <= '0' ;
				end if ;
			end if ;
		end if ;
	end process ;
	
end Delay ;