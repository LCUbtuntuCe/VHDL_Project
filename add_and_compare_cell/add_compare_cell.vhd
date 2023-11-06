entity add_compare_cell is
	port (
		a, b: in integer range 0 to 7 ;
		comp: out bit ;
		sum:	out integer range 0 to 15 ) ;
end entity ;

architecture dataflow of add_compare_cell is
begin
	comp <= '1' when a>b else '0' ;
	sum <= a+b ;
end architecture ;