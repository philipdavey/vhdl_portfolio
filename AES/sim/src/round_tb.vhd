LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY round_tb IS
END ENTITY round_tb;

ARCHITECTURE arch OF round_tb IS
----------------------------------
-- Testbench Parameters:
----------------------------------
CONSTANT TIME_PERIOD_c : time := 10 ns;

CONSTANT TC_01         : STD_LOGIC := '1';
CONSTANT TC_02         : STD_LOGIC := '0';

----------------------------------
-- UUT Signals Defined:
----------------------------------
-- Clock and Reset:
SIGNAL clk         : STD_LOGIC;
SIGNAL rst_n       : STD_LOGIC;
-- Input data/en:
SIGNAL input_data  : STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL input_en    : STD_LOGIC;
-- Roundkey:
SIGNAL round_key   : STD_LOGIC_VECTOR(127 DOWNTO 0);
-- Output data/en:
SIGNAL output_data : STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL output_en   : STD_LOGIC;

----------------------------------
-- Inputs:
----------------------------------
-- TYPE INPUT_DATA_ARRAY IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
-- CONSTANT test_init_input : INPUT_DATA_ARRAY := (x"32_88_31_E0",
--                                                 x"43_5A_31_37",
--                                                 x"F6_30_98_07",
--                                                 x"A8_8D_A2_34");

CONSTANT test_input_0    : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"19_A0_9A_E9_3D_F4_C6_F8_E3_E2_8D_48_BE_2B_2A_08");

CONSTANT test_input_rk_0 : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"A0_88_23_2A_FA_54_A3_6C_FE_2C_39_76_17_B1_39_05");

CONSTANT test_output_0   : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"A4_68_6B_02_9C_9F_5B_6A_7F_35_EA_50_F2_2B_43_49");

BEGIN

    -- UUT Declaration:
    UUT: ENTITY work.round
    PORT MAP(
        -- Clock and Active Low Reset:
        CLK         => clk,
        RST_N       => rst_n,
        -- Input Data/Enable:
        INPUT_DATA  => input_data,
        INPUT_EN    => input_en,
        -- Input Roundkey:
        ROUND_KEY   => round_key,
        -- Output Data/Enable:
        OUTPUT_DATA => output_data,
        OUTPUT_EN   => output_en
    );

    -- Clock Process:
    clk_gen_i: PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR TIME_PERIOD_C/2;
        clk <= '1';
        WAIT FOR TIME_PERIOD_c/2;
    END PROCESS;

    -- Stimulus Process:
    stim_i: PROCESS
    BEGIN
        rst_n <= '0';
        WAIT FOR TIME_PERIOD_c*5;
        rst_n <= '1';

        WAIT UNTIL RISING_EDGE(CLK);

        IF (TC_01 = '1') THEN
            input_data <= test_input_0;
            input_en   <= '1';
            WAIT UNTIL RISING_EDGE(CLK);
            input_data <= (OTHERS => '0');
            input_en   <= '0';

            WAIT UNTIL output_en = '1';
            WAIT UNTIL RISING_EDGE(CLK);
        END IF;

        WAIT;
    END PROCESS stim_i;

END arch ;















