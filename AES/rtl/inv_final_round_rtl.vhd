-- ====================================================================
-- File Name     : inv_final_round_rtl.vhd
-- Author        : Philip Davey
-- Design Folder : AES
-- Date          : February 2022
-- Rtl/Sim/Pkg   : RTL
-- --------------------------------------------------------------------
-- HDL           : VHDL 2008
-- --------------------------------------------------------------------
-- Description   : The main round of encryption. It performs the following
--               : calculations:
--               :
--               : 1. inv_sub_bytes
--               : 2. inv_shift_rows
--               : 3. add_roundkey
--               :
-- ====================================================================

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY inv_final_round IS
    PORT(
        --------------------------------------------------
        -- Clock and Active Low Reset:
        --------------------------------------------------
        CLK         : IN  STD_LOGIC;
        RST_N       : IN  STD_LOGIC;
        --------------------------------------------------
        -- Input Data and Enable:
        --------------------------------------------------
        INPUT_EN    : IN  STD_LOGIC;
        INPUT_DATA  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        ROUND_KEY   : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        --------------------------------------------------
        -- Output Data and Enable:
        --------------------------------------------------
        OUTPUT_EN   : OUT STD_LOGIC;
        OUTPUT_DATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
    );
END inv_final_round;

ARCHITECTURE arch OF inv_final_round IS

    ----------------------------------
    -- Signals Defined:
    ----------------------------------
    -- Sub Bytes:
    SIGNAL inv_sub_bytes_out_en   : STD_LOGIC;
    SIGNAL inv_sub_bytes_dout     : STD_LOGIC_VECTOR(127 DOWNTO 0);

    -- Shift Rows:
    SIGNAL inv_shift_rows_out_en  : STD_LOGIC;
    SIGNAL inv_shift_rows_dout    : STD_LOGIC_VECTOR(127 DOWNTO 0);
    
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
    inv_sub_bytes_i: ENTITY work.inv_sub_bytes
        PORT MAP(
            -- Clock and Reset:
            CLK         => CLK,
            RST_N       => RST_N,
            -- Input Enable/Data:
            INPUT_EN    => INPUT_EN,
            INPUT_DATA  => INPUT_DATA,
            -- Output Enable/Data:
            OUTPUT_EN   => inv_sub_bytes_out_en,
            OUTPUT_DATA => inv_sub_bytes_dout
        );

    ----------------------------------
    -- Shift Rows:
    ----------------------------------
    inv_shift_rows_i: ENTITY work.inv_shift_rows
        PORT MAP(
            -- Clock and Reset:
            CLK         => CLK,
            RST_N       => RST_N,
            -- Input Enable/Data:
            INPUT_EN    => inv_sub_bytes_out_en,
            INPUT_DATA  => inv_sub_bytes_dout,
            -- Output Enable/Data:
            OUTPUT_EN   => inv_shift_rows_out_en,
            OUTPUT_DATA => inv_shift_rows_dout
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
            INPUT_EN    => inv_shift_rows_out_en,
            INPUT_DATA  => inv_shift_rows_dout,
            ROUND_KEY   => store_rk,
            -- Output Enable/Data:
            OUTPUT_EN   => OUTPUT_EN,
            OUTPUT_DATA => OUTPUT_DATA
        );    
END arch ;