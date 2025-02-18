library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FBADDER is
	Port (
	A0, B0, A1, B1, A2, B2, A3, B3, K : in STD_LOGIC;
	S0, S1, S2, S3, Cout : out STD_LOGIC
	);
end FBADDER;

architecture Structural of FBADDER is 
	
	signal C0, C1, C2, X0, X1, X2, X3: STD_LOGIC;
	
	component OBADDER
		Port (
		A, B, Cin: in STD_LOGIC;
		S, Cout: out STD_LOGIC
		);
	end component;

begin
	X0 <= K XOR B0;
	X1 <= K XOR B1;
	X2 <= K XOR B2;
	X3 <= K XOR B3;
	
	ADD0: OBADDER
		port map (
			A => A0,
			B => X0,
			S => S0, 
			Cin => K,
			Cout => C0
		);
	ADD1: OBADDER
		port map (
			A => A1,
			B => X1,
			S => S1, 
			Cin => C0,
			Cout => C1
		);		
	ADD2: OBADDER
		port map (
			A => A2,
			B => X2,
			S => S2, 
			Cin => C1,
			Cout => C2
		);
	ADD3: OBADDER
		port map (
			A => A3,
			B => X3,
			S => S3, 
			Cin => C2,
			Cout => Cout
		);

end Structural;