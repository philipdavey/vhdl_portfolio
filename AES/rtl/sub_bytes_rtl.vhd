-- ====================================================================
-- File Name     : sub_bytes_rtl.vhd
-- Author        : Philip Davey
-- Design Folder : AES
-- Date          : February 2022
-- Rtl/Sim/Pkg   : RTL
-- --------------------------------------------------------------------
-- HDL           : VHDL 2008
-- --------------------------------------------------------------------
-- Description   :
--               :
--               :
--               :
--               :
-- ====================================================================

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY sub_bytes IS
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
        --------------------------------------------------
        -- Output Data and Enable:
        --------------------------------------------------
        OUTPUT_EN   : OUT STD_LOGIC;
        OUTPUT_DATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
    );
END sub_bytes;

ARCHITECTURE arch OF sub_bytes IS

SIGNAL int_output_data : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN

    ----------------------------------
    -- SBOX LUT:
    ----------------------------------
    sbox_gen_i: FOR i IN 0 TO 15 GENERATE
        sbox_lut_i: ENTITY work.sbox_lut
            PORT MAP(
                INPUT  => INPUT_DATA((i+1)*8-1 DOWNTO i*8),
                OUTPUT => int_output_data((i+1)*8-1 DOWNTO i*8));
    END GENERATE sbox_gen_i;

    PROCESS(CLK, RST_N)
    BEGIN
        IF (RST_N = '0') THEN
            OUTPUT_DATA <= (OTHERS => '0');
            OUTPUT_EN   <= '0';
        ELSIF RISING_EDGE(CLK) THEN
            IF (INPUT_EN = '1') THEN
                OUTPUT_DATA <= int_output_data;
                OUTPUT_EN   <= '1';
            ELSE
                OUTPUT_DATA <= (OTHERS => '0');
                OUTPUT_EN   <= '0';
            END IF;
        END IF;
    END PROCESS;
END arch ;