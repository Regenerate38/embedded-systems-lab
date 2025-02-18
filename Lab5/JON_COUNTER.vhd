-- JOHNSON Counter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JON_COUNTER is 
	Port(
	CLK : in STD_LOGIC;
	Q0, Q1, Q2, Q3 : out STD_LOGIC
	);
end JON_COUNTER;

architecture Structural of JON_COUNTER is 

	component D_FlipFlop
        Port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            Q_bar : out STD_LOGIC
        );
    end component;
	
	signal y1, y2, y3, y4, Q_bar_internal : STD_LOGIC;
	
begin

	DFF0: D_FlipFlop
        port map (
            D     => y4,
            CLK   => CLK,
            Q     => y1,
            Q_bar => Q_bar_internal
        );
	
	DFF1: D_FlipFlop
        port map (
            D     => y1,
            CLK   => CLK,
            Q     => y2,
            Q_bar => Q_bar_internal
        );
	
	DFF2: D_FlipFlop
        port map (
            D     => y2,
            CLK   => CLK,
            Q     => y3,
            Q_bar => Q_bar_internal
        );
        
	DFF3: D_FlipFlop
        port map (
            D     => y3,
            CLK   => CLK,
            Q     => Q3,
            Q_bar => y4
        );
	
	Q0 <= y1;
	Q1 <= y2;
	Q2 <= y3;
	
end Structural;