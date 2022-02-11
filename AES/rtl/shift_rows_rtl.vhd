-- ====================================================================
-- File Name     : shift_rows_rtl.vhd
-- Author        : Philip Davey
-- Design Folder : AES
-- Date          : February 2022
-- Rtl/Sim/Pkg   : RTL
-- --------------------------------------------------------------------
-- HDL           : VHDL 2008
-- --------------------------------------------------------------------
-- Description   : This is used to perform the Shift Rows operation.
--               : This consists of rotating each row by an incrementing
--               : number of bytes as follows:
--               :
--               : Row 0 : Same as original.
--               : Row 1 : Rotate by 1 byte.
--               : Row 2 : Rotate by 2 bytes.
--               : Row 3 : Rotate by 3 bytes.
-- ====================================================================

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY shift_rows IS
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
END shift_rows;

ARCHITECTURE arch OF shift_rows IS

BEGIN
    PROCESS(CLK, RST_N)
    BEGIN
        IF (RST_N = '0') THEN
            OUTPUT_DATA <= (OTHERS => '0');
            OUTPUT_EN <= '0';
        ELSIF RISING_EDGE(CLK) THEN
            
            OUTPUT_EN <= '0';

            IF (INPUT_EN = '1') THEN
                -- Not Rotated:
                OUTPUT_DATA(127 DOWNTO 96) <= INPUT_DATA(127 DOWNTO 96);
                -- Rotate by 1 byte:
                OUTPUT_DATA( 95 DOWNTO 64) <= INPUT_DATA( 87 DOWNTO 64) & INPUT_DATA(95 DOWNTO 88);
                -- Rotate by 2 bytes:
                OUTPUT_DATA( 63 DOWNTO 32) <= INPUT_DATA( 47 DOWNTO 32) & INPUT_DATA(63 DOWNTO 48);
                -- Rotate by 3 bytes:
                OUTPUT_DATA( 31 DOWNTO  0) <= INPUT_DATA(  7 DOWNTO  0) & INPUT_DATA(31 DOWNTO  8);

                OUTPUT_EN <= '1';

            END IF;
        END IF;
    END PROCESS;
END arch ;