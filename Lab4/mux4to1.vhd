-- MUX here let x1 be A and x2 be B
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux4to1 is 
	Port (
		A: in STD_LOGIC;
		B: in STD_LOGIC;
		C: in STD_LOGIC;
		D: in STD_LOGIC;
		s1: in STD_LOGIC;
		s2: in STD_LOGIC;
		
		Y: out STD_LOGIC
	);
end mux4to1;

architecture Structural of mux4to1 is

	signal A_B, C_D : STD_LOGIC;

	component mux2to1 
			Port (
				A : in STD_LOGIC;
				B : in STD_LOGIC;
				S : in STD_LOGIC;
				Y : out STD_LOGIC
			);
	end component;
	
begin
		mux1: mux2to1
			port map (
				A => A,
				B => B, 
				S => S1,
				Y => A_B
			);

		mux2: mux2to1
			port map (
				A => C,
				B => D, 
				S => S1,
				Y => C_D
			);
		mux3: mux2to1 
			port map (
				A => A_B,
				B => C_D,
				S => S2,
				Y => Y
			);
			
end Structural;