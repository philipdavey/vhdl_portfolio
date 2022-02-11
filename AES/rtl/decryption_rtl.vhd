-- ====================================================================
-- File Name     : decryption_rtl.vhd
-- Author        : Philip Davey
-- Design Folder : AES
-- Date          : February 2022
-- Rtl/Sim/Pkg   : RTL
-- --------------------------------------------------------------------
-- HDL           : VHDL 2008
-- --------------------------------------------------------------------
-- Description   : The decryption top level. It performs the following
--               :
--               : - Key Schedule Expansion
--               : 
--               : 1. Initial inverse round.
--               : 2. 9 Main Inverse rounds.
--               : 3. Inverse Final round.
-- ====================================================================

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY decryption IS
    PORT(
        --------------------------------------------------
        -- Clock and Active Low Reset:
        --------------------------------------------------
        CLK         : IN  STD_LOGIC;
        RST_N       : IN  STD_LOGIC;
        --------------------------------------------------
        -- Enable, Input Data and Cipher Key:
        --------------------------------------------------
        INPUT_EN    : IN  STD_LOGIC;
        CIPHER_TEXT : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        CIPHER_KEY  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        --------------------------------------------------
        -- Output Data and Enable:
        --------------------------------------------------
        OUTPUT_EN   : OUT STD_LOGIC;
        PLAIN_TEXT  : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
        
    );
END decryption;

ARCHITECTURE arch OF decryption IS

    ----------------------------------
    -- Round Key
    ----------------------------------
    -- Key schedule output enable:
    SIGNAL key_sch_output_en : STD_LOGIC_VECTOR(9 DOWNTO 0);

    -- Output of each key schedule:
    TYPE round_key_array IS ARRAY (0 TO 10) OF STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL round_key : round_key_array;

    ----------------------------------
    -- Main Rounds
    ----------------------------------
    -- Round output enable:
    TYPE round_en_array IS ARRAY (0 TO 9) OF STD_LOGIC;
    SIGNAL inv_round_en   : round_en_array;

    -- Output of each round:
    TYPE round_data_array IS ARRAY (0 TO 9) OF STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL inv_round_data : round_data_array;

    -- Stored Decryption input:
    SIGNAL int_cipher_text : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL init_round_en   : STD_LOGIC;

BEGIN

    ----------------------------------
    -- When Input Enable is asserted, store Cipher Key.
    ----------------------------------
    PROCESS(CLK, RST_N)
    BEGIN
        IF (RST_N = '0') THEN
        ELSIF RISING_EDGE(CLK) THEN
            IF (INPUT_EN = '1') THEN
                round_key(0) <= CIPHER_KEY;
            END IF;
        END IF;
    END PROCESS;

    ----------------------------------
    -- Key Schedule:
    ----------------------------------
    key_schedule_i : ENTITY work.key_schedule
        GENERIC MAP(
            KEY_SCH_NUM_g => 0
        )
        PORT MAP(
            -- Clock and Reset:
            CLK         => CLK,
            RST_N       => RST_N,
            -- Input Enable/RK:
            INPUT_EN    => INPUT_EN,
            CIPHER_KEY  => CIPHER_KEY,
            -- Output Enable/RK:
            OUTPUT_EN   => key_sch_output_en(0),
            OUTPUT_DATA => round_key(1)
        );

    key_schedule_gen_i: FOR i IN 0 TO 8 GENERATE
        key_schedule_i : ENTITY work.key_schedule
            GENERIC MAP(
                KEY_SCH_NUM_g => i + 1
            )
            PORT MAP(
                -- Clock and Reset:
                CLK         => CLK,
                RST_N       => RST_N,
                -- Input Enable/RK:
                INPUT_EN    => key_sch_output_en(i),
                CIPHER_KEY  => round_key(i+1),
                -- Output Enable/RK:
                OUTPUT_EN   => key_sch_output_en(i+1),
                OUTPUT_DATA => round_key(i+2)
            );
    END GENERATE;

    ----------------------------------
    -- Rounds:
    ----------------------------------

    PROCESS(CLK, RST_N)
    BEGIN
        IF (RST_N = '0') THEN
            int_cipher_text <= (OTHERS => '0');
            init_round_en  <= '0';
        ELSIF RISING_EDGE(CLK) THEN
            IF (INPUT_EN = '1') THEN
                int_cipher_text <= CIPHER_TEXT;
            END IF;
            
            IF (key_sch_output_en(9) = '1') THEN
                init_round_en <= '1';
            ELSE
                init_round_en <= '0';
            END IF;

        END IF;
    END PROCESS;

    ----------------------------------
    -- Initial round:
    ----------------------------------
    init_round_i: ENTITY work.add_roundkey
        PORT MAP(
            -- Clock and Reset:
            CLK         => CLK,
            RST_N       => RST_N,
            -- Input Enable/Data/RK:
            INPUT_EN    => init_round_en,
            INPUT_DATA  => int_cipher_text,
            ROUND_KEY   => round_key(10),
            -- Output Enable/Data:
            OUTPUT_EN   => inv_round_en(0),
            OUTPUT_DATA => inv_round_data(0)
        );

    ----------------------------------
    -- 9 Main Rounds:
    ----------------------------------
    main_round_gen_i: FOR i IN 0 TO 8 GENERATE
        main_round_i: ENTITY work.inv_round
            PORT MAP(
                -- Clock and Reset:
                CLK         => CLK,
                RST_N       => RST_N,
                -- Input Enable/Data/RK:
                INPUT_EN    => inv_round_en(i),
                INPUT_DATA  => inv_round_data(i),
                ROUND_KEY   => round_key(9-i),
                -- Output Enable/Data:
                OUTPUT_EN   => inv_round_en(i+1),
                OUTPUT_DATA => inv_round_data(i+1)
            );
    END GENERATE;

    ----------------------------------
    -- Final Round:
    ----------------------------------
    final_round_i: ENTITY work.inv_final_round
    PORT MAP(
        -- Clock and Reset:
        CLK         => CLK,
        RST_N       => RST_N,
        -- Input Enable/Data/RK:
        INPUT_EN    => inv_round_en(9),
        INPUT_DATA  => inv_round_data(9),
        ROUND_KEY   => round_key(0),
        -- Output Enable/Data:
        OUTPUT_EN   => OUTPUT_EN,
        OUTPUT_DATA => PLAIN_TEXT
    );

END arch;