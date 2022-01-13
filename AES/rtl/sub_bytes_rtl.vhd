LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sub_bytes IS
    PORT(
        CLK         : IN STD_LOGIC;
        RST_N       : IN STD_LOGIC
        INPUT_DATA  : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
        OUTPUT_DATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
    );

ARCHITECTURE arch OF sub_bytes IS

BEGIN

END arch ;
