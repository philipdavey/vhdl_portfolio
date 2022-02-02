LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.tb_pkg.ALL;

ENTITY encryption_tb IS
END ENTITY encryption_tb;

ARCHITECTURE arch OF encryption_tb IS
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
SIGNAL input_en    : STD_LOGIC;
SIGNAL plain_text  : STD_LOGIC_VECTOR(127 DOWNTO 0);
-- Roundkey:
SIGNAL cipher_key  : STD_LOGIC_VECTOR(127 DOWNTO 0);
-- Output data/en:
SIGNAL output_en   : STD_LOGIC;
SIGNAL cipher_text : STD_LOGIC_VECTOR(127 DOWNTO 0);

----------------------------------
-- Inputs:
----------------------------------

CONSTANT data_in : STD_LOGIC_VECTOR(127 DOWNTO 0) := x"32_88_31_E0_43_5A_31_37_F6_30_98_07_A8_8D_A2_34";

CONSTANT round_key_in : STD_LOGIC_VECTOR(127 DOWNTO 0) := x"2B_28_AB_09_7E_AE_F7_CF_15_D2_15_4F_16_A6_88_3C";

TYPE EXP_DATA_ARRAY IS ARRAY (0 TO 10) OF STD_LOGIC_VECTOR(127 DOWNTO 0);

CONSTANT exp_round_data  : EXP_DATA_ARRAY := (x"19_A0_9A_E9_3D_F4_C6_F8_E3_E2_8D_48_BE_2B_2A_08",
                                              x"A4_68_6B_02_9C_9F_5B_6A_7F_35_EA_50_F2_2B_43_49",
                                              x"AA_61_82_68_8F_DD_D2_32_5F_E3_4A_46_03_EF_D2_9A",
                                              x"48_67_4D_D6_6C_1D_E3_5F_4E_9D_B1_58_EE_0D_38_E7",
                                              x"E0_C8_D9_85_92_63_B1_B8_7F_63_35_BE_E8_C0_50_01",
                                              x"F1_C1_7C_5D_00_92_C8_B5_6F_4C_8B_D5_55_EF_32_0C",
                                              x"26_3D_E8_FD_0E_41_64_D2_2E_B7_72_8B_17_7D_A9_25",
                                              x"5A_19_A3_7A_41_49_E0_8C_42_DC_19_04_B1_1F_65_0C",
                                              x"EA_04_65_85_83_45_5D_96_5C_33_98_B0_F0_2D_AD_C5",
                                              x"EB_59_8B_1B_40_2E_A1_C3_F2_38_13_42_1E_84_E7_D2",
                                              x"39_02_DC_19_25_DC_11_6A_84_09_85_0B_1D_FB_97_32");

BEGIN

    -- UUT Declaration:
    UUT: ENTITY work.encryption
    PORT MAP(
        -- Clock and Active Low Reset:
        CLK         => clk,
        RST_N       => rst_n,
        -- Input Data/Enable:
        INPUT_EN    => input_en,
        PLAIN_TEXT  => plain_text,
        -- Cipher Key:
        CIPHER_KEY  => cipher_key,
        -- Output Data/Enable:
        OUTPUT_EN   => output_en,
        CIPHER_TEXT => cipher_text
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
        TYPE round_en_array   IS ARRAY (0 TO 9) OF STD_LOGIC;
        TYPE round_data_array IS ARRAY (0 TO 9) OF STD_LOGIC_VECTOR(127 DOWNTO 0);

        ALIAS ext_round_en   IS << SIGNAL .encryption_tb.UUT.round_en   : round_en_array >>;
        ALIAS ext_round_data IS << SIGNAL .encryption_tb.UUT.round_data : round_data_array >>;
    BEGIN
        rst_n <= '0';
        WAIT FOR TIME_PERIOD_c*5;
        rst_n <= '1';

        WAIT UNTIL RISING_EDGE(CLK);

        IF (TC_01 = '1') THEN
            WAIT UNTIL RISING_EDGE(CLK);
            input_en   <= '1';             -- Assert Input Enable.
            plain_text <= data_in;      -- Input Plain Text.
            cipher_key <= round_key_in; -- Input Cipher Key.
            WAIT UNTIL RISING_EDGE(CLK);
            input_en   <= '0';
            plain_text <= (OTHERS => '0');
            cipher_key <= (OTHERS => '0');

            FOR i IN EXP_DATA_ARRAY'LOW TO EXP_DATA_ARRAY'HIGH -1 LOOP

                WAIT UNTIL ext_round_en(i) = '1';
                self_check_vector("Round " & to_string(i), ext_round_data(i), exp_round_data(i));
            END LOOP;

            WAIT UNTIL output_en = '1';
    
            self_check_vector("Ciphertext", cipher_text, exp_round_data(10));


        END IF;

        WAIT;
    END PROCESS stim_i;

END arch ;