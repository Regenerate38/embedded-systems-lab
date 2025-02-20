library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity OBBCD is
    Port (
        Enable : in  STD_LOGIC;
        CLR    : in  STD_LOGIC;
        CLK    : in  STD_LOGIC;
        Q0     : out STD_LOGIC;
        Q1     : out STD_LOGIC;
        Q2     : out STD_LOGIC;
        Q3     : out STD_LOGIC;
        Q4     : out STD_LOGIC;
        Q5     : out STD_LOGIC;
        Q6     : out STD_LOGIC;
        Q7     : out STD_LOGIC
    );
end OBBCD;

architecture Behavioral of OBBCD is

    signal lower_digit  : STD_LOGIC_VECTOR(3 downto 0);
    signal upper_digit  : STD_LOGIC_VECTOR(3 downto 0);
    signal load_lower   : STD_LOGIC;
    signal load_upper   : STD_LOGIC;
    signal and_q0_q4    : STD_LOGIC;
    signal and_prev     : STD_LOGIC;

    component D_FlipFlop is
        Port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            CLR   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            Q_bar : out STD_LOGIC
        );
    end component;

begin

    and_q0_q4 <= lower_digit(0) and upper_digit(0);  
    load_lower <= CLR or and_q0_q4;  
    load_upper <= CLR or and_q0_q4 or and_prev;  
    DFF0 : D_FlipFlop
        Port map (
            D     => lower_digit(0),
            CLK   => CLK,
            CLR   => load_lower,
            Q     => Q0,
            Q_bar => open
        );

    DFF1 : D_FlipFlop
        Port map (
            D     => lower_digit(1),
            CLK   => CLK,
            CLR   => load_lower,
            Q     => Q1,
            Q_bar => open
        );

    DFF2 : D_FlipFlop
        Port map (
            D     => lower_digit(2),
            CLK   => CLK,
            CLR   => load_lower,
            Q     => Q2,
            Q_bar => open
        );

    DFF3 : D_FlipFlop
        Port map (
            D     => lower_digit(3),
            CLK   => CLK,
            CLR   => load_lower,
            Q     => Q3,
            Q_bar => open
        );

    DFF4 : D_FlipFlop
        Port map (
            D     => upper_digit(0),
            CLK   => CLK,
            CLR   => load_upper,
            Q     => Q4,
            Q_bar => open
        );

    DFF5 : D_FlipFlop
        Port map (
            D     => upper_digit(1),
            CLK   => CLK,
            CLR   => load_upper,
            Q     => Q5,
            Q_bar => open
        );

    DFF6 : D_FlipFlop
        Port map (
            D     => upper_digit(2),
            CLK   => CLK,
            CLR   => load_upper,
            Q     => Q6,
            Q_bar => open
        );

    DFF7 : D_FlipFlop
        Port map (
            D     => upper_digit(3),
            CLK   => CLK,
            CLR   => load_upper,
            Q     => Q7,
            Q_bar => open
        );

    process(CLK)
    begin
        if rising_edge(CLK) then
            if Enable = '1' then
                if lower_digit = "1001" then
                    lower_digit <= "0000";
                    if upper_digit = "1001" then
                        upper_digit <= "0000";
                    else
                        upper_digit <= std_logic_vector(to_unsigned(to_integer(unsigned(upper_digit)) + 1, 4));
                    end if;
                else
                    lower_digit <= std_logic_vector(to_unsigned(to_integer(unsigned(lower_digit)) + 1, 4));
                end if;
            end if;
        end if;
    end process;

end Behavioral;
