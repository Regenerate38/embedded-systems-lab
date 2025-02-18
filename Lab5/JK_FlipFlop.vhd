library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_FlipFlop is
    Port (
        J     : in  STD_LOGIC;
        K     : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        Q     : out STD_LOGIC;
        Q_bar : out STD_LOGIC
    );
end JK_FlipFlop;

architecture Structural of JK_FlipFlop is
    -- Internal signals to hold feedback values
    signal Q_internal     : STD_LOGIC;
    signal Q_bar_internal : STD_LOGIC;

    -- Component declaration for D Flip-Flop
    component D_FlipFlop
        Port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            Q_bar : out STD_LOGIC
        );
    end component;

    -- Signal for D input
    signal D : STD_LOGIC;

begin
    -- Logic for D input
    D <= (J AND Q_bar_internal) OR (NOT K AND Q_internal);

    -- Instantiating the D flip-flop
    DFF: D_FlipFlop
        port map (
            D     => D,
            CLK   => CLK,
            Q     => Q_internal,
            Q_bar => Q_bar_internal
        );

    -- Assign internal signals to output ports
    Q <= Q_internal;
    Q_bar <= Q_bar_internal;

end Structural;