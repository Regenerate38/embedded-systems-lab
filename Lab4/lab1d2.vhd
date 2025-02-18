-- here let A = x1, B = x2, C = x3, D = x4
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab1d2 is 
	Port(
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		C : in STD_LOGIC;
		D : in STD_LOGIC;
		F : out STD_LOGIC
	);
end lab1d2;

architecture Dataflow of lab1d2 is 
begin
	F <= ((B OR C) AND (C OR (NOT D)) AND ((NOT A) OR (NOT B) OR (NOT D)));
end Dataflow;

architecture Behavioral of lab1d2 is 
begin 
	process (A, B, C, D)
	begin
		if ((B = '1' OR C = '1') AND (C = '1' OR D = '0') AND (A = '0' OR B = '0' OR D = '0')) THEN
		F <= '1';
		else
		F <= '0';
		end if;
	end process;
end Behavioral;

architecture Structural of lab1d2 is

    signal not_A, not_B, not_C, not_D : std_logic;
    signal or1_out, or2_out, and_out : std_logic;

begin

    not_A <= A nor A;
    not_B <= B nor B;
    not_C <= C nor C;
    not_D <= D nor D;

    or1_out <= (B nor B) nor (C nor C); 
    or2_out <= (C nor C) nor not_D;     

    and_out <= (or1_out nor or1_out) nor (or2_out nor or2_out); 

    F <= (and_out nor and_out) nor ((not_A nor not_B) nor not_D);

end Structural;
