library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FlipFlop is 
	Port(
	T, CLK : in STD_LOGIC;
	Q, Q_BAR: out STD_LOGIC
	);
end T_FlipFlop;

architecture Structural of T_FlipFlop is 

component D_FlipFlop
        Port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            Q_bar : out STD_LOGIC
        );
    end component;
    
    signal Y1, Y2, Y3, Y4, Y5, Y6, Q_internal, Q_bar_internal : STD_LOGIC;
    
begin
	Y1 <= NOT T;
	Y5 <= Q_internal;
	Y6 <= Q_bar_internal;
	Y2 <= Y1 AND Y5;
	Y3 <= Y6 AND T;
	Y4 <= Y2 OR Y3;
	
	DFF : D_FlipFlop 
		port map (
			D => Y4, 
			CLK => CLK,
			Q => Q_internal,
			Q_bar => Q_bar_internal
		);
	Q <= Q_internal;
	Q_BAR <= Q_bar_internal;
	
end Structural;