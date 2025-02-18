-- UP Counter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UP_COUNTER is 
	Port(
	I, CLK : in STD_LOGIC;
	Q3 : out STD_LOGIC
	);
end UP_COUNTER;

architecture Structural of UP_COUNTER is 

	component T_FlipFlop
        Port (
            T     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            Q_BAR : out STD_LOGIC
        );
    end component;
	
	signal y1, y2, y3, y4, y5, Q_bar_internal : STD_LOGIC;
	
begin

	TFF0 : T_FlipFlop 
		port map (
			T => I , 
			CLK => CLK,
			Q => y3,
			Q_BAR => Q_bar_internal
		);
	
	TFF1 : T_FlipFlop 
		port map (
			T => y3, 
			CLK => CLK,
			Q => y4,
			Q_BAR => Q_bar_internal
		);
	
	TFF2 : T_FlipFlop 
		port map (
			T => y1, 
			CLK => CLK,
			Q => y5,
			Q_BAR => Q_bar_internal
		);
	TFF3 : T_FlipFlop 
		port map (
			T => y2, 
			CLK => CLK,
			Q => Q3,
			Q_BAR => Q_bar_internal
		);
	
	y1 <= y3 and y4;
	y2 <= y1 and y5;
	
end Structural;