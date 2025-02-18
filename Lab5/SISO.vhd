--SISO

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SISO is 
	Port(
	Din, CLK : in STD_LOGIC;
	Dout : out STD_LOGIC
	);
end SISO;

architecture Structural of SISO is 

component D_FlipFlop
        Port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            Q_bar : out STD_LOGIC
        );
    end component;
    
    signal D1, D2, D3, Q_bar_internal : STD_LOGIC;
    
begin
    DFF0: D_FlipFlop
        port map (
            D     => Din,
            CLK   => CLK,
            Q     => D1,
            Q_bar => Q_bar_internal
        );

    DFF1: D_FlipFlop
        port map (
            D     => D1,
            CLK   => CLK,
            Q     => D2,
            Q_bar => Q_bar_internal
        );
    DFF2: D_FlipFlop
        port map (
            D     => D2,
            CLK   => CLK,
            Q     => D3,
            Q_bar => Q_bar_internal
        );

    DFF3: D_FlipFlop
        port map (
            D     => D3,
            CLK   => CLK,
            Q     => Dout,
            Q_bar => Q_bar_internal
        );
end Structural;