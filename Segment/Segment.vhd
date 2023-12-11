library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Segment is
	port(
		key : in std_logic ;					-- point to press ;
		clk : in std_logic ;					-- the signal from clock ;
		hex5 : out std_logic_vector(0 to 7) ;
		hex4 : out std_logic_vector(0 to 7) ;
		hex3 : out std_logic_vector(0 to 7) ;
		hex2 : out std_logic_vector(0 to 7) ;
		hex1 : out std_logic_vector(0 to 7) ;
		hex0 : out std_logic_vector(0 to 7)	;	-- all of them are digital segments
		
		hex6 : out std_logic_vector(0 to 7) ;
		hex7 : out std_logic_vector(0 to 7)		
) ;
end Segment ;

architecture Display of Segment is
	signal clk_50MHZ : std_logic ;
	constant matrix_num : integer := 6 ;
	TYPE Light is array (0 to matrix_num) of std_logic_vector(0 to 7);
	signal initial : Light := (('1', '1', '1', '1', '1', '1', '1', '1'),
							   ('1', '0', '0', '1', '1', '1', '1', '1'),			-- 1
							   ('0', '0', '1', '0', '0', '1', '0', '1'),			-- 2
							   ('0', '0', '0', '0', '1', '1', '0', '1'),			-- 3
							   ('1', '0', '0', '1', '1', '0', '0', '1'),			-- 4
							   ('0', '1', '0', '0', '1', '0', '0', '1'),			-- 5
							   ('0', '1', '0', '0', '0', '0', '0', '1')				-- 6
							  ) ;
	signal temporary : Light := (('1', '1', '1', '1', '1', '1', '1', '1'),
							   ('1', '0', '0', '1', '1', '1', '1', '1'),			-- 1
							   ('0', '0', '1', '0', '0', '1', '0', '1'),			-- 2
							   ('0', '0', '0', '0', '1', '1', '0', '1'),			-- 3
							   ('1', '0', '0', '1', '1', '0', '0', '1'),			-- 4
							   ('0', '1', '0', '0', '1', '0', '0', '1'),			-- 5
							   ('0', '1', '0', '0', '0', '0', '0', '1')				-- 6
							  ) ;
begin
	process(clk)							-- this process is a timer ;
		variable count : integer := 0 ;
	begin
		if (clk'event and clk = '1') then
			if (count = 50000000) then
				clk_50MHZ <= '1' ;
				count := 0 ;
			else
				clk_50MHZ <= '0' ;
				count := count + 1 ;
			end if ;
		end if ;
	end process ;
	
	process(key, clk_50MHZ)
		variable i : integer := 0 ;
	begin
		hex6 <= ('1', '1', '1', '1', '1', '1', '1', '1') ;		-- I don't want them to be light
		hex7 <= ('1', '1', '1', '1', '1', '1', '1', '1') ;
		
		if (key = '1' and rising_edge(clk_50MHZ)) then
			i := (i+1) MOD 6 ;
			if (i = 0) then
				temporary(1) <= initial(1) ;
				temporary(2) <= initial(2) ;
				temporary(3) <= initial(3) ;
				temporary(4) <= initial(4) ;
				temporary(5) <= initial(5) ;
				temporary(6) <= initial(6) ;
			elsif (i = 1) then
				temporary(1) <= initial(2) ;
				temporary(2) <= initial(3) ;
				temporary(3) <= initial(4) ;
				temporary(4) <= initial(5) ;
				temporary(5) <= initial(6) ;
				temporary(6) <= initial(1) ;
			elsif (i = 2) then
				temporary(1) <= initial(3) ;
				temporary(2) <= initial(4) ;
				temporary(3) <= initial(5) ;
				temporary(4) <= initial(6) ;
				temporary(5) <= initial(1) ;
				temporary(6) <= initial(2) ;
			elsif (i = 3) then
				temporary(1) <= initial(4) ;
				temporary(2) <= initial(5) ;
				temporary(3) <= initial(6) ;
				temporary(4) <= initial(1) ;
				temporary(5) <= initial(2) ;
				temporary(6) <= initial(3) ;
			elsif (i = 4) then
				temporary(1) <= initial(5) ;
				temporary(2) <= initial(6) ;
				temporary(3) <= initial(1) ;
				temporary(4) <= initial(2) ;
				temporary(5) <= initial(3) ;
				temporary(6) <= initial(4) ;
			elsif (i = 5) then
				temporary(1) <= initial(6) ;
				temporary(2) <= initial(1) ;
				temporary(3) <= initial(2) ;
				temporary(4) <= initial(3) ;
				temporary(5) <= initial(4) ;
				temporary(6) <= initial(5) ;
			end if ;
		end if ;
		hex5 <= temporary(1) ;
		hex4 <= temporary(2) ;
		hex3 <= temporary(3) ;
		hex2 <= temporary(4) ;
		hex1 <= temporary(5) ;
		hex0 <= temporary(6) ;
	end process ;
end Display ;