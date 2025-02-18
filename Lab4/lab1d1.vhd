-- here let A = x1, B = x2, C = x3, D = x4
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab1d1 is 
	Port(
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC;
		F : out STD_LOGIC
	);
end lab1d1;

architecture Dataflow of lab1d1 is 
begin
	F <= (((NOT A) AND (NOT C)) OR ( A AND B AND C) OR ((NOT B) AND (NOT C)));
end Dataflow;


architecture Behavioral of lab1d1 is 
begin
	process (A,B,C,D)
	begin
		if (A = '1' AND B = '1' AND C = '1') THEN 
			F <= '1';
		elsif (B = '0' AND C = '0') THEN 
			F <= '1';
		elsif (A = '0' AND C = '0') THEN
			F <= '1';
		else 
			F <= '0';
		end if;
	end process;
end Behavioral;

architecture Structural of lab1d1 is
    signal ABC : STD_LOGIC;
    signal NANC : STD_LOGIC;
    signal NBNC : STD_LOGIC;
begin

    ABC <= not (A or B or C);  
    NANC <= not (A or C);  
    NBNC <= not (B or C);  

    F <= not (ABC or NANC or NBNC);  
end Structural;

