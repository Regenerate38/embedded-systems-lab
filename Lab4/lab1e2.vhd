-- MUX here let x1 be A and x2 be B
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab1e2 is 
	Port(
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		S : in STD_LOGIC;
		Y : out STD_LOGIC
	);
end lab1e2;

architecture Structural of lab1e2 is 
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