library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY practice IS 
	Port (
		A: in STD_LOGIC;
		B: in STD_LOGIC;
		C: in STD_LOGIC;
		D: in STD_LOGIC;
		E: in STD_LOGIC;
		F: out STD_LOGIC
	);
end practice;

architecture Dataflow of practice is
begin
	F <= (((A AND B) OR (C AND D)) XOR (NOT E));
end Dataflow;

architecture Behavioral of practice is 
begin 
	process (A, B, C, D, E)
	begin
		if ((A = '1' AND B = '1') OR (C = '1' AND D='1')) THEN
			F <= ('1' XOR (NOT E));
		else
			F <= ('0' XOR (NOT E));
		end if;
	end process;
end Behavioral;


architecture Structural of practice is
	signal AB : STD_LOGIC;
	signal CD : STD_LOGIC;
	signal AB_CD : STD_LOGIC;

begin 
	AB <= A AND B;
	CD <= C AND D;
	AB_CD <= AB OR CD;
	
	F <= (AB_CD XOR (NOT E));

end Structural;