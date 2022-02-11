-- ====================================================================
-- File Name     : decryption_tb.vhd
-- Author        : Philip Davey
-- Design Folder : AES
-- Date          : February 2022
-- Rtl/Sim/Pkg   : Sim
-- --------------------------------------------------------------------
-- HDL           : VHDL 2008
-- --------------------------------------------------------------------
-- Description   : Testbench for decryption_rtl.vhd.
--               :
--               : Inputs Ciphertext and Cipherkey, checks the output of
--               : each round and the Plaintext.
--               :
-- ====================================================================

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.tb_pkg.ALL;
USE std.env.STOP;

ENTITY decryption_tb IS
END ENTITY decryption_tb;

ARCHITECTURE arch OF decryption_tb IS
----------------------------------
-- Testbench Parameters:
----------------------------------
CONSTANT TIME_PERIOD_c : time := 10 ns;

CONSTANT TC_01     : STD_LOGIC := '1';
CONSTANT TC_02     : STD_LOGIC := '0';

----------------------------------
-- UUT Signals Defined:
----------------------------------
-- Clock and Reset:
SIGNAL clk         : STD_LOGIC;
SIGNAL rst_n       : STD_LOGIC;
-- Input data/en:
SIGNAL input_en    : STD_LOGIC;
SIGNAL cipher_text : STD_LOGIC_VECTOR(127 DOWNTO 0);
-- Roundkey:
SIGNAL cipher_key  : STD_LOGIC_VECTOR(127 DOWNTO 0);
-- Output data/en:
SIGNAL output_en   : STD_LOGIC;
SIGNAL plain_text  : STD_LOGIC_VECTOR(127 DOWNTO 0);

----------------------------------
-- Inputs:
----------------------------------

CONSTANT data_in : STD_LOGIC_VECTOR(127 DOWNTO 0)      := x"696AD870C47BCDB4E004B7C5D830805A";

CONSTANT round_key_in : STD_LOGIC_VECTOR(127 DOWNTO 0) := x"0004080C0105090D02060A0E03070B0F";

TYPE EXP_DATA_ARRAY IS ARRAY (0 TO 10) OF STD_LOGIC_VECTOR(127 DOWNTO 0);

CONSTANT exp_round_data  : EXP_DATA_ARRAY := (x"7A892B3DD5EFCA9FFD4E10F5A7270B9F",
                                              x"546B96A1D9A0BB11909AF470A1B50E2F",
                                              x"3EB68DF61CFCA81722BF5004C0766795",
                                              x"B4684B5F58B69915128AF8554C012E4C",
                                              x"E8143FE7DA77F747B6D4F5DD9065E24F",
                                              x"36F99FC433B52C409D39096D50262D23",
                                              x"2D3F095B6D3336FB7EE30212F034DDC7",
                                              x"3BFC57C0D974675922FBCB0E6873E02D",
                                              x"A797D81FBEADC9611A73CA8B699B4561",
                                              x"6309CDBA536070CAE0E1B7D08C0451E7",
                                              x"004488CC115599DD2266AAEE3377BBFF");

BEGIN

    -- UUT Declaration:
    UUT: ENTITY work.decryption
    PORT MAP(
        -- Clock and Active Low Reset:
        CLK         => clk,
        RST_N       => rst_n,
        -- Input Data/Enable:
        INPUT_EN    => input_en,
        CIPHER_TEXT => cipher_text,
        -- Cipher Key:
        CIPHER_KEY  => cipher_key,
        -- Output Data/Enable:
        OUTPUT_EN   => output_en,
        PLAIN_TEXT  => plain_text
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

        ALIAS ext_inv_round_en   IS << SIGNAL .decryption_tb.UUT.inv_round_en   : round_en_array >>;
        ALIAS ext_inv_round_data IS << SIGNAL .decryption_tb.UUT.inv_round_data : round_data_array >>;
    BEGIN
        rst_n <= '0';
        WAIT FOR TIME_PERIOD_c*5;
        rst_n <= '1';

        input_en   <= '0';
        cipher_key <= (OTHERS => '0');

        WAIT UNTIL RISING_EDGE(CLK);

        IF (TC_01 = '1') THEN
            WAIT UNTIL RISING_EDGE(CLK);
            input_en    <= '1';          -- Assert Input Enable.
            cipher_text <= data_in;      -- Input Plain Text.
            cipher_key  <= round_key_in; -- Input Cipher Key.
            WAIT UNTIL RISING_EDGE(CLK);
            input_en    <= '0';
            cipher_text <= (OTHERS => '0');
            cipher_key  <= (OTHERS => '0');

            FOR i IN exp_round_data'LOW TO exp_round_data'HIGH -1 LOOP
                WAIT UNTIL ext_inv_round_en(i) = '1';

                self_check_vector("Round " & to_string(i), ext_inv_round_data(i), exp_round_data(i));
            END LOOP;

            WAIT UNTIL output_en = '1';
    
            self_check_vector("Plain Text", plain_text, exp_round_data(10));

            WAIT FOR 50 ns;

            report "Calling 'stop'";
            STOP;

        END IF;

        WAIT;
    END PROCESS stim_i;

END arch ;

