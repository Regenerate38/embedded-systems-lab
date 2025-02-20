-- DEC Counter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEC_COUNTER is 
	Port(
	I, CLK : in STD_LOGIC;
	Q0, Q1, Q2, Q3 : out STD_LOGIC
	);
end DEC_COUNTER;

architecture Structural of DEC_COUNTER is 

	component T_FlipFlop
        Port (
            T     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            Q_BAR : out STD_LOGIC;
            CLR : in STD_LOGIC
        );
    end component;
	
	signal y1, y2, y3, y4, y5, y6, Q_bar_internal : STD_LOGIC;
	
begin

	TFF0 : T_FlipFlop 
		port map (
			T => I , 
			CLK => CLK,
			Q => Q0,
			Q_BAR => y4,
			CLR => y3
		);
	
	TFF1 : T_FlipFlop 
		port map (
			T => I, 
			CLK => CLK,
			Q => y1,
			Q_BAR => y5,
			CLR => y3
		);
	
	TFF2 : T_FlipFlop 
		port map (
			T => I, 
			CLK => CLK,
			Q => Q2,
			Q_BAR => y6,
			CLR => y3
		);
	TFF3 : T_FlipFlop 
		port map (
			T => I, 
			CLK => CLK,
			Q => y2,
			Q_BAR => Q_bar_internal,
			CLR => y3
		);
	
	Q3 <= y2;
	Q1 <= y1;
	y3 <= y1 NAND y2;
	
	
end Structural;