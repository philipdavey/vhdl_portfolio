LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY round IS
    PORT(
        --------------------------------------------------
        -- Clock and Active Low Reset:
        --------------------------------------------------
        CLK         : IN  STD_LOGIC;
        RST_N       : IN  STD_LOGIC;
        --------------------------------------------------
        -- Input Data and Enable:
        --------------------------------------------------
        INPUT_DATA  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        ROUND_KEY   : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        INPUT_EN    : IN  STD_LOGIC;
        --------------------------------------------------
        -- Output Data and Enable:
        --------------------------------------------------
        OUTPUT_DATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
        OUTPUT_EN   : OUT STD_LOGIC
    );
END round;

ARCHITECTURE arch OF round IS

    ----------------------------------
    -- Signals Defined:
    ----------------------------------
    -- Sub Bytes:
    SIGNAL sub_bytes_out_en   : STD_LOGIC;
    SIGNAL sub_bytes_dout     : STD_LOGIC_VECTOR(127 DOWNTO 0);

    -- Shift Rows:
    SIGNAL shift_rows_out_en  : STD_LOGIC;
    SIGNAL shift_rows_dout    : STD_LOGIC_VECTOR(127 DOWNTO 0);
    
    -- Mixed Columns:
    SIGNAL mix_columns_out_en : STD_LOGIC;
    SIGNAL mix_columns_dout   : STD_LOGIC_VECTOR(127 DOWNTO 0);
    
    -- Store Round Key:
    SIGNAL store_rk           : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN

    ----------------------------------
    -- STORE ROUNDKEY PROCESS:
    -- 1. Store roundkey when input
    -- enable = '1';
    ----------------------------------
    PROCESS(CLK, RST_N)
    BEGIN
        IF (RST_N = '0') THEN
            store_rk <= (OTHERS => '0');
        ELSIF RISING_EDGE(CLK) THEN
            IF (INPUT_EN = '1') THEN
                store_rk <= ROUND_KEY;
            END IF;
        END IF;
    END PROCESS;

    ----------------------------------
    -- Sub Bytes:
    ----------------------------------
    sub_bytes_i: ENTITY work.sub_bytes
        PORT MAP(
            -- Clock and Reset:
            CLK         => CLK,
            RST_N       => RST_N,
            -- Input Enable/Data:
            INPUT_EN    => INPUT_EN,
            INPUT_DATA  => INPUT_DATA,
            -- Output Enable/Data:
            OUTPUT_EN   => sub_bytes_out_en,
            OUTPUT_DATA => sub_bytes_dout
        );

    ----------------------------------
    -- Shift Rows:
    ----------------------------------
    shift_rows_i: ENTITY work.shift_rows
        PORT MAP(
            -- Clock and Reset:
            CLK         => CLK,
            RST_N       => RST_N,
            -- Input Enable/Data:
            INPUT_EN    => sub_bytes_out_en,
            INPUT_DATA  => sub_bytes_dout,
            -- Output Enable/Data:
            OUTPUT_EN   => shift_rows_out_en,
            OUTPUT_DATA => shift_rows_dout
        );

    ----------------------------------
    -- Mixed Columns:
    ----------------------------------
    mix_columns_i: ENTITY work.mix_columns
        PORT MAP(
            -- Clock and Reset:
            CLK         => CLK,
            RST_N       => RST_N,
            -- Input Enable/Data:
            INPUT_EN    => shift_rows_out_en,
            INPUT_DATA  => shift_rows_dout,
            -- Output Enable/Data:
            OUTPUT_EN   => mix_columns_out_en,
            OUTPUT_DATA => mix_columns_dout
        );

    ----------------------------------
    -- Add Roundkey:
    ----------------------------------
    add_roundkey_i: ENTITY work.add_roundkey
        PORT MAP(
            -- Clock and Reset:
            CLK         => CLK,
            RST_N       => RST_N,
            -- Input Enable/Data/RK:
            INPUT_EN    => mix_columns_out_en,
            INPUT_DATA  => mix_columns_dout,
            ROUND_KEY   => store_rk,
            -- Output Enable/Data:
            OUTPUT_EN   => OUTPUT_EN,
            OUTPUT_DATA => OUTPUT_DATA
        );    
END arch ;