library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY lab1-2 IS
    Port (
        A: in STD_LOGIC;
        B: in STD_LOGIC;
        C: in STD_LOGIC;
        D: in STD_LOGIC;
        F: out STD_LOGIC
    );
end lab1-2;

architecture Dataflow of lab1-2 is 
begin 
    F <= ((A AND B) OR (NOT B AND C)) OR ((NOT B AND C) AND D);
end Dataflow;

architecture Behavioral of lab1-2 is
begin 
    process (A, B, C, D)
    begin
        if (A = '1' AND B = '1') THEN
            F <= '1';
        elsif (NOT B = '1' AND C = '1') THEN
            F <= '1';
        elsif (NOT B = '1' AND C = '1' AND D = '1') THEN
            F <= '1';
        else
            F <= '0';
        end if;
    end process;
end Behavioral;

architecture Structural of lab1-2 is
    signal A_B : STD_LOGIC;  
    signal BC : STD_LOGIC;   
    signal BC_C : STD_LOGIC; 
    signal BC_D : STD_LOGIC; 
begin
    A_B <= A AND B;                  
    BC <= NOT B;                     
    BC_C <= BC AND C;               
    BC_D <= BC_C AND D;             
    
    F <= A_B OR BC_C OR BC_D;       
end Structural;

	