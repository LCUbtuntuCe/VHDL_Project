library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;
use ieee.std_logic_unsigned.all ;

entity Division is
	port(
		sw : in std_logic_vector(2 downto 0) ;
		clk : in std_logic ;
		ld : buffer std_logic
	) ;
end Division ;

architecture Delay of Division is
	signal num : integer := 0 ;		-- the times of rising edge ;
	signal num1 : integer := 0 ;	-- the times of falling edge ;
	signal result : std_logic := '0' ;		-- when clk is rising ;
	signal result1 : std_logic := '0' ;		-- when clk is falling ;
begin
	process(sw, clk)
		variable n : integer := 0 ;
		variable n1 : integer := 0 ;
	begin
		if rising_edge(clk) then
			num <= num + 1 ;
			if (sw = "011" or sw = "101" or sw = "111") then
				if (sw = "011") then
					n := 3 ;
				elsif (sw = "101") then
					n := 5 ;
				elsif (sw = "111") then
					n := 7 ;
				end if ;
				
				if (n = 3 and (num = 2 or ((num-2) rem n = 0)) ) then
					result <= Not result ;
				elsif (n = 5 and (num = 3 or ((num-3) rem n = 0)) ) then
					result <= Not result ;
				elsif (n = 7 and (num = 4 or ((num-4) rem n = 0)) ) then
					result <= Not result ;
				end if ;
			end if ;
		elsif falling_edge(clk) then
			num1 <= num1 + 1 ;
			if (sw = "010" or sw = "100" or sw = "110") then
				if (sw = "010") then
					n1 := 2 ;
				elsif (sw = "100") then
					n1 := 4 ;
				elsif (sw = "110") then
					n1 := 6 ;
				end if ;
	
				if (num1 = (n1/2) or ((num1 - (n1/2)) rem n1 = 0)) then
					result1 <= Not result1 ;
				elsif (num1 rem n1 = 0) then
					result1 <= Not result1 ;
				end if ;
			elsif (sw = "011" or sw = "101" or sw = "111") then
				if (sw = "011") then
					n1 := 3 ;
				elsif (sw = "101") then
					n1 := 5 ;
				elsif (sw = "111") then
					n1 := 7 ;
				end if ;
				
				if (num1 rem n1 = 0) then
					result1 <= Not result1 ;
				end if ;
			end if ;
		end if ;
		ld <= result xor result1 ;
	end process ;
end Delay ;