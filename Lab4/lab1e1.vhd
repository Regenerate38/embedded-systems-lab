-- MUX here let x1 be A and x2 be B
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab1e1 is 
	Port(
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		S : in STD_LOGIC;
		Y : out STD_LOGIC
	);
end lab1e1;

architecture Structural of lab1e1 is 
	begin 
	Y <= A WHEN (S = '0') ELSE B;
end Structural;