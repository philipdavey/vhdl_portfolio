-- ====================================================================
-- File Name     : encryption_tb.vhd
-- Author        : Philip Davey
-- Design Folder : AES
-- Date          : February 2022
-- Rtl/Sim/Pkg   : Sim
-- --------------------------------------------------------------------
-- HDL           : VHDL 2008
-- --------------------------------------------------------------------
-- Description   : Testbench for encryption_rtl.vhd.
--               :
--               : Inputs Plaintext and Cipherkey, checks the output of
--               : each round and the Ciphertext.
--               :
-- ====================================================================

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.tb_pkg.ALL;
USE std.env.STOP;

ENTITY encryption_tb IS
END ENTITY encryption_tb;

ARCHITECTURE arch OF encryption_tb IS
----------------------------------
-- Testbench Parameters:
----------------------------------
CONSTANT TIME_PERIOD_c : time := 10 ns;

CONSTANT TC_01         : STD_LOGIC := '1'; -- Full Encryption, self check output of each round.
CONSTANT TC_02         : STD_LOGIC := '0'; -- Pipeline test.

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
-- Stimulus:
----------------------------------

TYPE DATA_ARRAY IS ARRAY (INTEGER RANGE <>) OF STD_LOGIC_VECTOR(127 DOWNTO 0);

CONSTANT stim_plaintext : DATA_ARRAY(0 TO 1) := (x"328831E0435A3137F6309807A88DA234",
                                                 x"004488CC115599DD2266AAEE3377BBFF");

CONSTANT stim_cipherkey : DATA_ARRAY(0 TO 1) := (x"2B28AB097EAEF7CF15D2154F16A6883C",
                                                 x"0004080C0105090D02060A0E03070B0F");

CONSTANT exp_ciphertext : DATA_ARRAY(0 TO 1) := (x"3902DC1925DC116A8409850B1DFB9732",
                                                 x"696AD870C47BCDB4E004B7C5D830805A");

CONSTANT exp_round_data : DATA_ARRAY(0 TO 9) := (x"19A09AE93DF4C6F8E3E28D48BE2B2A08",
                                                 x"A4686B029C9F5B6A7F35EA50F22B4349",
                                                 x"AA6182688FDDD2325FE34A4603EFD29A",
                                                 x"48674DD66C1DE35F4E9DB158EE0D38E7",
                                                 x"E0C8D9859263B1B87F6335BEE8C05001",
                                                 x"F1C17C5D0092C8B56F4C8BD555EF320C",
                                                 x"263DE8FD0E4164D22EB7728B177DA925",
                                                 x"5A19A37A4149E08C42DC1904B11F650C",
                                                 x"EA04658583455D965C3398B0F02DADC5",
                                                 x"EB598B1B402EA1C3F23813421E84E7D2");

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

        input_en   <= '0';
        cipher_key <= (OTHERS => '0');

        WAIT UNTIL RISING_EDGE(CLK);

        IF (TC_01 = '1') THEN
            WAIT UNTIL RISING_EDGE(CLK);
            input_en   <= '1';            -- Assert Input Enable.
            plain_text <= stim_plaintext; -- Input Plain Text.
            cipher_key <= stim_cipherkey; -- Input Cipher Key.
            WAIT UNTIL RISING_EDGE(CLK);
            input_en   <= '0';
            plain_text <= (OTHERS => '0');
            cipher_key <= (OTHERS => '0');

            FOR i IN EXP_DATA_ARRAY'LOW TO EXP_DATA_ARRAY'HIGH -1 LOOP
                WAIT UNTIL ext_round_en(i) = '1';
                self_check_vector("Round " & to_string(i), ext_round_data(i), exp_round_data(i));
            END LOOP;

            WAIT UNTIL output_en = '1';
    
            self_check_vector("Ciphertext", cipher_text, exp_ciphertext(0));
        END IF;

        IF (TC_02 = '1') THEN
            WAIT UNTIL RISING_EDGE(CLK);
            input_en   <= '1';               -- Assert Input Enable.
            plain_text <= stim_plaintext(0); -- Input Plain Text.
            cipher_key <= stim_cipherkey(0);    -- Input Cipher Key.
            WAIT UNTIL RISING_EDGE(CLK);
            input_en   <= '0';
            plain_text <= (OTHERS => '0');
            cipher_key <= (OTHERS => '0');

            FOR i IN 0 TO 2 LOOP
               WAIT UNTIL RISING_EDGE(CLK);
            END LOOP;

            input_en   <= '1';               -- Assert Input Enable.
            plain_text <= stim_plaintext(1); -- Input Plain Text.
            cipher_key <= stim_cipherkey(1);    -- Input Cipher Key.
            WAIT UNTIL RISING_EDGE(CLK);
            input_en   <= '0';
            plain_text <= (OTHERS => '0');
            cipher_key <= (OTHERS => '0');

            WAIT UNTIL output_en = '1';
    
            self_check_vector("Ciphertext", cipher_text, exp_ciphertext(0));

            WAIT UNTIL output_en = '1';
    
            self_check_vector("Ciphertext", cipher_text, exp_ciphertext(1));

        END IF;

        WAIT FOR 50 ns;

        report "Calling 'stop'";
        STOP;

    END PROCESS stim_i;

END arch;