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
                -- Calculate 02s and 03s:
				FOR i IN 15 DOWNTO 0 LOOP
					IF (int_input_cols((i+1)*8-1) = '1') THEN
						s(i+16) <= ((int_input_cols(((i+1)*8-2) DOWNTO ((i+1)*8-8)) & '0') XOR "00011011");		
						s(i)    <= (int_input_cols(((i+1)*8-2)  DOWNTO ((i+1)*8-8)) & '0') XOR "00011011" XOR int_input(((i+1)*8-1) DOWNTO ((i+1)*8-8));
					ELSE
						s(i+16) <= (int_input(((i+1)*8-2)downto((i+1)*8-8)) & '0');
						s(i)    <= (int_input(((i+1)*8-2)downto((i+1)*8-8)) & '0') xor int_input(((i+1)*8-1)downto((i+1)*8-8));
					END IF;
				end loop;

            END IF;
        END IF;
    END PROCESS;
END arch;


-- NEED TO CONVERT COLUMNS INTO ROWS BEFORE BEING OUTPUT!

-- https://www.angelfire.com/biz7/atleast/mix_columns.pdf
-- 
--  | 02 03 01 01 |   | D4 |
--  | 01 02 03 01 | . | BF | = (02 . D4) + (03 . bf) + (01 . 5d) + (01 . 30)
--  | 01 01 02 03 |   | 5D |
--  | 03 01 01 02 |   | 30 |
--
-- Multiplication by 02:
-- 1. Shift left by 1 bit.
-- 2. XOR with "00011011" (If leftmost bit of original value (before shift) is '1').
--
-- EG: D4 = "11010100"
-- Leftmost bit = '1', therefore:
-- 1. Shift left by 1 = "10101000"
-- 2. "10101000" XOR "00011011" = B3.