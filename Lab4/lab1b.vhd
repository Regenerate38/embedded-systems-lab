library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab1b is
    Port (
        BCD : in STD_LOGIC_VECTOR(3 downto 0); -- BCD input
        Gray : out STD_LOGIC_VECTOR(3 downto 0) -- Gray code output
    );
end lab1b;

architecture Dataflow of lab1b is 
begin 
    Gray(3) <= BCD(3); -- MSB remains the same
    Gray(2) <= BCD(3) XOR BCD(2); -- G2 = B3 XOR B2
    Gray(1) <= BCD(2) XOR BCD(1); -- G1 = B2 XOR B1
    Gray(0) <= BCD(1) XOR BCD(0); -- G0 = B1 XOR B0
end Dataflow;

architecture Behavioral of lab1b is
begin 
    process (BCD)
    begin
        Gray(3) <= BCD(3); -- MSB remains the same
        Gray(2) <= BCD(3) XOR BCD(2); -- G2 = B3 XOR B2
        Gray(1) <= BCD(2) XOR BCD(1); -- G1 = B2 XOR B1
        Gray(0) <= BCD(1) XOR BCD(0); -- G0 = B1 XOR B0
    end process;
end Behavioral;

architecture Structural of lab1b is
    signal A_B : STD_LOGIC;  
    signal BC : STD_LOGIC;   
    signal BC_C : STD_LOGIC; 
begin
    -- Assign the MSB directly
    Gray(3) <= BCD(3);
    
    -- Intermediate signals for XOR operations
    A_B <= BCD(3) AND NOT(BCD(2)); 
    BC <= NOT(BCD(2));                     
    BC_C <= BC AND BCD(1);               
    
    -- Assigning the Gray code outputs using intermediate signals
    Gray(2) <= A_B OR (BC AND BCD(2)); 
    Gray(1) <= NOT(BCD(1)) XOR (BCD(2) AND NOT(BCD(1))); 
    Gray(0) <= NOT(BCD(0)) XOR (BCD(1)); 
end Structural;
