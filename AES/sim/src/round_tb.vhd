LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.tb_pkg.ALL;

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
TYPE DATA_ARRAY IS ARRAY (0 TO 1) OF STD_LOGIC_VECTOR(127 DOWNTO 0);

CONSTANT data_in        : DATA_ARRAY := (x"19_A0_9A_E9_3D_F4_C6_F8_E3_E2_8D_48_BE_2B_2A_08",
                                         x"A4_68_6B_02_9C_9F_5B_6A_7F_35_EA_50_F2_2B_43_49");

CONSTANT round_key_in   : DATA_ARRAY := (x"A0_88_23_2A_FA_54_A3_6C_FE_2C_39_76_17_B1_39_05",
                                         x"F2_7A_59_73_C2_96_35_59_95_B9_80_F6_F2_43_7A_7F");

CONSTANT sub_bytes_out  : DATA_ARRAY := (x"D4_E0_B8_1E_27_BF_B4_41_11_98_5D_52_AE_F1_E5_30",
                                         x"49_45_7F_77_DE_DB_39_02_D2_96_87_53_89_F1_1A_3B");

CONSTANT shift_rows_out : DATA_ARRAY := (x"D4_E0_B8_1E_BF_B4_41_27_5D_52_11_98_30_AE_F1_E5",
                                         x"49_45_7F_77_DB_39_02_DE_87_53_D2_96_3B_89_F1_1A");

CONSTANT mix_cols_out   : DATA_ARRAY := (x"04_E0_48_28_66_CB_F8_06_81_19_D3_26_E5_9A_7A_4C",
                                         x"58_1B_DB_1B_4D_4B_E7_6B_CA_5A_CA_B0_F1_AC_A8_E5");

CONSTANT add_rk_out     : DATA_ARRAY := (x"A4_68_6B_02_9C_9F_5B_6A_7F_35_EA_50_F2_2B_43_49",
                                         x"AA_61_82_68_8F_DD_D2_32_5F_E3_4A_46_03_EF_D2_9A");

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
        ----------------------------------
        -- -- Externals:
        ----------------------------------
        -- Sub Bytes:
        ALIAS ext_sub_bytes_out_en   IS << SIGNAL .round_tb.UUT.sub_bytes_out_en   : STD_LOGIC >>;
        ALIAS ext_sub_bytes_out_data IS << SIGNAL .round_tb.UUT.sub_bytes_dout     : STD_LOGIC_VECTOR(127 DOWNTO 0) >>;

        -- Shift Rows:
        ALIAS ext_shift_rows_out_en  IS << SIGNAL .round_tb.UUT.shift_rows_out_en  : STD_LOGIC >>;
        ALIAS ext_shift_rows_dout    IS << SIGNAL .round_tb.UUT.shift_rows_dout    : STD_LOGIC_VECTOR(127 DOWNTO 0) >>;

        -- Mixed Columns:
        ALIAS ext_mix_columns_out_en IS << SIGNAL .round_tb.UUT.mix_columns_out_en : STD_LOGIC >>;
        ALIAS ext_mix_columns_dout   IS << SIGNAL .round_tb.UUT.mix_columns_dout   : STD_LOGIC_VECTOR(127 DOWNTO 0) >>;
    BEGIN
        rst_n <= '0';
        WAIT FOR TIME_PERIOD_c*5;
        rst_n <= '1';

        WAIT UNTIL RISING_EDGE(CLK);

        IF (TC_01 = '1') THEN

            FOR i IN DATA_ARRAY'LOW TO DATA_ARRAY'HIGH LOOP
                WAIT UNTIL RISING_EDGE(CLK);

                input_en   <= '1';             -- Assert Input Enable.
                input_data <= data_in(i);      -- Insert Input data.
                round_key  <= round_key_in(i); -- Insert Round Key.

                WAIT UNTIL ext_sub_bytes_out_en = '1'; -- Wait for Sub Bytes.

                input_en   <= '0';             -- Deassert Input Enable.
                input_data <= (OTHERS => '0'); -- Reset Input Data.
                round_key  <= (OTHERS => '0'); -- Reset Round Key.

                self_check_vector("SUBBYTES " & to_string(i), ext_sub_bytes_out_data, sub_bytes_out(i)); -- Check Sub Bytes.

                WAIT UNTIL ext_shift_rows_out_en = '1'; -- Wait for Shift Rows.

                self_check_vector("SHIFTROWS " & to_string(i), ext_shift_rows_dout, shift_rows_out(i)); -- Check Shift Rows.

                WAIT UNTIL ext_mix_columns_out_en = '1'; -- Wait for Mix Columns.

                self_check_vector("MIXCOLUMNS " & to_string(i), ext_mix_columns_dout, mix_cols_out(i)); -- Check Mix Columns.

                WAIT UNTIL output_en = '1'; -- Wait for Add Round Key.
                
                self_check_vector("ADD RK " & to_string(i), output_data, add_rk_out(i)); -- Check Add Round Key.
            END LOOP;
        END IF;

        WAIT;
    END PROCESS stim_i;

END arch ;