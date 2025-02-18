library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OBADDER is 
	Port (
		A, B, Cin: in STD_LOGIC;
		S, Cout: out STD_LOGIC
	);
end OBADDER;


architecture Dataflow of OBADDER is 
signal A_B, CAB, AB : STD_LOGIC;
begin
	A_B <= A XOR B;
	S <= A_B XOR Cin;
	AB <= A AND B;
	CAB <= Cin AND A_B;
	Cout <= CAB OR AB;

end Dataflow;