LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY encryption IS
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
        PLAIN_TEXT  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        CIPHER_KEY  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        --------------------------------------------------
        -- Output Data and Enable:
        --------------------------------------------------
        OUTPUT_EN   : OUT STD_LOGIC;
        CIPHER_TEXT : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
    );
END encryption;

ARCHITECTURE arch OF encryption IS

    TYPE round_en_array   IS ARRAY 0 TO 9 OF STD_LOGIC;
    SIGNAL round_en : round_en_array;

    TYPE round_data_array IS ARRAY 0 TO 9 OF STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL round_data : round_data_array;

BEGIN

    ----------------------------------
    -- Key Schedule:
    ----------------------------------

    ----------------------------------
    -- Initial round:
    ----------------------------------
    init_round_i: ENTITY work.add_roundkey
        PORT MAP(
            -- Clock and Reset:
            CLK         => CLK,
            RST_N       => RST_N,
            -- Input Enable/Data/RK:
            INPUT_EN    => INPUT_EN,
            INPUT_DATA  => PLAIN_TEXT,
            ROUND_KEY   => CIPHER_KEY,
            -- Output Enable/Data:
            OUTPUT_EN   => round_en(0),
            OUTPUT_DATA => round_data(0)
        );

    ----------------------------------
    -- 9 Main Rounds:
    ----------------------------------
    FOR i IN 0 TO 8 GENERATE
        main_round_i: ENTITY work.round
            PORT MAP(
                -- Clock and Reset:
                CLK         => CLK,
                RST_N       => RST_N,
                -- Input Enable/Data/RK:
                INPUT_EN    => round_en(i),
                INPUT_DATA  => round_data(i),
                ROUND_KEY   =>
                -- Output Enable/Data:
                OUTPUT_EN   => round_en(i+1)
                OUTPUT_DATA => round_data(i+1)
            );
    END GENERATE;

    ----------------------------------
    -- Final Round:
    ----------------------------------
    main_round_i: ENTITY work.round
    PORT MAP(
        -- Clock and Reset:
        CLK         => CLK,
        RST_N       => RST_N,
        -- Input Enable/Data/RK:
        INPUT_EN    => round_en(9),
        INPUT_DATA  => round_data(9),
        ROUND_KEY   =>
        -- Output Enable/Data:
        OUTPUT_EN   => OUTPUT_EN,
        OUTPUT_DATA => CIPHER_TEXT
    );

END arch;