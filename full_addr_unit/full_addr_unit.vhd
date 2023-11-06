entity full_addr_unit is
	port (
		a, b, cin: in bit ;
		sum, cout: out bit) ;
end entity full_addr_unit ;

architecture boolean_equations of full_addr_unit is
begin
	sum <= a xor b xor cin ;
	cout <= (a and b) or (a and cin) or (b and cin) ;
end architecture boolean_equations ;