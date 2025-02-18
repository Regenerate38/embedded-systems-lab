-- MUX here let x1 be A and x2 be B
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is 
	Port(
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		S : in STD_LOGIC;
		Y : out STD_LOGIC
	);
end mux2to1;

architecture Structural of mux2to1 is 
	begin 
	process (A, B, S)
	begin 
	if  (S = '0') then 
	Y <= A;
	ELSE 
	Y <= B;
	end if;
	end process;
end Structural;