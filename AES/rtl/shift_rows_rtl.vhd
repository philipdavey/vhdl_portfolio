LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY shift_rows IS
    PORT(
        CLK         : IN  STD_LOGIC;
        RST_N       : IN  STD_LOGIC
        INPUT_DATA  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        IN_DATA_EN  : IN  STD_LOGIC;
        OUTPUT_DATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
        OUT_DATA_EN : OUT STD_LOGIC
    );

ARCHITECTURE arch OF shift_rows IS

BEGIN
    PROCESS(CLK, RST_N)
    BEGIN
        IF (RST_N = '0') THEN
            OUTPUT_DATA <= (OTHERS => '0');
            OUT_DATA_EN <= '0';
        ELSIF RISING_EDGE(CLK) THEN
            OUT_DATA_EN <= '0';
            IF (IN_DATA_EN = '1') THEN
                -- Not Rotated:
                OUTPUT_DATA(127 DOWNTO 96) <= INPUT_DATA(127 DOWNTO 96);
                -- Rotate by 1 byte:
                OUTPUT_DATA( 95 DOWNTO 64) <= INPUT_DATA( 88 DOWNTO 64) & INPUT_DATA(95 DOWNTO 89);
                -- Rotate by 2 bytes:
                OUTPUT_DATA( 63 DOWNTO 32) <= INPUT_DATA( 47 DOWNTO 32) & INPUT_DATA(63 DOWNTO 48);
                -- Rotate by 3 bytes:
                OUTPUT_DATA( 31 DOWNTO  0) <= INPUT_DATA(  7 DOWNTO  0) & INPUT_DATA(31 DOWNTO  8);
                OUT_DATA_EN <= '1';
            END IF;
        END IF;
    END PROCESS;
END arch ;