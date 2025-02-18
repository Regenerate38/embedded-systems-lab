library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab1c is
    Port (
        x1 : in STD_LOGIC;  
        x2 : in STD_LOGIC;  
        x3 : in STD_LOGIC;  
        F  : out STD_LOGIC  
    );
end lab1c;

architecture Dataflow of lab1c is 
begin 
    F <= (x1 and x2 and not x3) or 
         (x1 and not x2 and x3) or 
         (not x1 and x2 and x3); 
end Dataflow;

architecture Behavioral of lab1c is
begin 
    process (x1, x2, x3)
    begin
        if (x1 = '1' and x2 = '1' and x3 = '0') then
            F <= '1';
        elsif (x1 = '1' and x2 = '0' and x3 = '1') then
            F <= '1';
        elsif (x1 = '0' and x2 = '1' and x3 = '1') then
            F <= '1';
        else
            F <= '0';
        end if;
    end process;
end Behavioral;

architecture Structural of lab1c is
    signal A_B : STD_LOGIC;  
    signal A_C : STD_LOGIC;   
    signal B_C : STD_LOGIC; 
begin
    A_B <= x1 and x2;               
    A_C <= x1 and x3;               
    B_C <= x2 and x3;               

    F <= (A_B and not x3) or 
         (A_C and not x2) or 
         (B_C and not x1); 
end Structural;
