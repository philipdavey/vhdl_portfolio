LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mix_columns IS
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
END mix_columns;

ARCHITECTURE arch OF shift_rows IS

    SIGNAL int_input_cols : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN

    -- Conver Rows into Columns.
    int_input_cols <= rows_2_cols(INPUT_DATA);

    PROCESS(CLK, RST_N)
    BEGIN
        IF (RST_N = '0') THEN

        ELSIF RISING_EDGE(CLK) THEN

            IF (INPUT_EN = '1') THEN


            END IF;
        END IF;
    END PROCESS;
END arch;


-- NEED TO CONVERT COLUMNS INTO ROWS BEFORE BEING OUTPUT!