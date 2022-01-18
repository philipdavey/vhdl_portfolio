LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sub_bytes IS
    PORT(
        --------------------------------------------------
        -- Clock and Active Low Reset:
        --------------------------------------------------
        CLK         : IN  STD_LOGIC;
        RST_N       : IN  STD_LOGIC
        --------------------------------------------------
        -- Input Data and Enable:
        --------------------------------------------------
        INPUT_DATA  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        INPUT_EN    : IN  STD_LOGIC;
        --------------------------------------------------
        -- Output Data and Enable:
        --------------------------------------------------
        OUTPUT_DATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
        OUTPUT_EN   : OUT STD_LOGIC
    );
END sub_bytes;

ARCHITECTURE arch OF sub_bytes IS

TYPE INT_OUTPUT_ARRAY IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL int_output : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN

    PROCESS(CLK, RST_N)
    BEGIN
        IF (RST_N = '0') THEN

        ELSIF RISING_EDGE(CLK) THEN

        FOR x IN 0 TO 3 LOOP
            FOR i IN 0 TO LOOP
                int_output <= 


        END IF;
    END PROCESS;
END arch ;

TO_INTEGER(UNSIGNED(INPUT_DATA(31 DOWNTO 24)));

-- convert byte into integer, seperate into msb and lsb
-- use that as coordinates for the table