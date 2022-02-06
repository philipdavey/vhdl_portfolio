LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.tb_pkg.ALL;
USE std.env.STOP;

ENTITY inv_round_tb IS
END ENTITY inv_round_tb;

ARCHITECTURE arch OF inv_round_tb IS
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

CONSTANT data_in        : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"69_C4_E0_D8_6A_7B_04_30_D8_CD_B7_80_70_B4_C5_5A");

CONSTANT round_key_in   : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"13_11_1D_7F_E3_94_4A_17_F3_07_A7_8B_4D_2B_30_C5");

CONSTANT exp_round_data : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"19_A0_9A_E9_3D_F4_C6_F8_E3_E2_8D_48_BE_2B_2A_08");

BEGIN

    -- UUT Declaration:
    UUT: ENTITY work.inv_round
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
        input_en   <= '0';             -- Deassert Input Enable.
        input_data <= (OTHERS => '0'); -- Reset Input Data.
        round_key  <= (OTHERS => '0'); -- Reset Round Key.

        rst_n <= '0';
        WAIT FOR TIME_PERIOD_c*5;
        rst_n <= '1';

        WAIT UNTIL RISING_EDGE(CLK);

        IF (TC_01 = '1') THEN

            WAIT UNTIL RISING_EDGE(CLK);

            input_en   <= '1';       -- Assert Input Enable.
            input_data <= data_in;   -- Insert Input data.
            round_key  <= round_key_in; -- Insert Round Key.

            WAIT UNTIL RISING_EDGE(CLK);

            input_en   <= '0';             -- Deassert Input Enable.
            input_data <= (OTHERS => '0'); -- Reset Input Data.
            round_key  <= (OTHERS => '0'); -- Reset Round Key.

            WAIT UNTIL output_en = '1'; -- Wait for Sub Bytes.

            self_check_vector("ROUND OUTPUT", output_data, exp_round_data); -- Check Sub Bytes.

            -- WAIT FOR 50 ns;

            -- report "Calling 'stop'";
            -- STOP;
        END IF;

        WAIT;
    END PROCESS stim_i;

END arch ;