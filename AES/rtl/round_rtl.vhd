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