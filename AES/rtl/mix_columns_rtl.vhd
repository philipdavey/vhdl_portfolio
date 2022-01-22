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
--
--
-- Multiplication by 03:
-- 1. Shift left by 1 bit.
-- 2. XOR with original input.
-- 3. XOR with "00011011" (If leftmost bit of original value (before shift) is '1').
--
-- EG: BF = "10111111"
-- 2. Shift left by 1 = "10101000"
-- 3. "10101000" XOR "10111111" XOR "00011011" = DA.
--
-- (02 . D4) + (03 . bf) + (01 . 5d) + (01 . 30) = 
--
-- B3 XOR DA XOR 5D XOR 30 = 04 (Final Answer).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY mix_columns IS
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
        INPUT_EN    : IN  STD_LOGIC;
        --------------------------------------------------
        -- Output Data and Enable:
        --------------------------------------------------
        OUTPUT_DATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
        OUTPUT_EN   : OUT STD_LOGIC
    );
END mix_columns;

ARCHITECTURE arch OF mix_columns IS

    -- Calculate 02s:
    FUNCTION calc_02s (input : STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR IS
        VARIABLE output : STD_LOGIC_VECTOR(7 DOWNTO 0);
    BEGIN
        IF (input(7) = '1') THEN -- If Leftmost Bit = '1'.
            output := (input(6 DOWNTO 0) & '0') XOR "00011011"; -- Shift Left by 1, XOR with "00011011".
        ELSE
            output := (input(6 DOWNTO 0) & '0'); -- Shift Left by 1.
        END IF;
        RETURN output;
    END FUNCTION calc_02s;

    -- Calculate 02s:
    FUNCTION calc_03s (input : STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR IS
        VARIABLE output : STD_LOGIC_VECTOR(7 DOWNTO 0);
    BEGIN
        IF (input(7) = '1') THEN -- If Leftmost Bit = '1'.
            output := (input(6 DOWNTO 0) & '0') XOR "00011011" XOR input; -- Shift Left by 1, XOR with "00011011", XOR with input.
        ELSE
            output := (input(6 DOWNTO 0) & '0') XOR input; -- Shift Left by 1, XOR with input.
        END IF;
        RETURN output;
    END FUNCTION calc_03s;

    -- Calculate 02s:
    FUNCTION calc_col (input : STD_LOGIC_VECTOR(31 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR IS
        VARIABLE output : STD_LOGIC_VECTOR(31 DOWNTO 0);
    BEGIN
        -- Loop to calculate each mixed column.
        output(31 DOWNTO 24) := calc_02s(input(31 DOWNTO 24)) XOR calc_03s(input(23 DOWNTO 16)) XOR          input(15 DOWNTO 8)  XOR          input(7 DOWNTO 0);
        output(23 DOWNTO 16) :=          input(31 DOWNTO 24)  XOR calc_02s(input(23 DOWNTO 16)) XOR calc_03s(input(15 DOWNTO 8)) XOR          input(7 DOWNTO 0);
        output(15 DOWNTO  8) :=          input(31 DOWNTO 24)  XOR          input(23 DOWNTO 16)  XOR calc_02s(input(15 DOWNTO 8)) XOR calc_03s(input(7 DOWNTO 0));
        output( 7 DOWNTO  0) := calc_03s(input(31 DOWNTO 24)) XOR          input(23 DOWNTO 16)  XOR          input(15 DOWNTO 8)  XOR calc_02s(input(7 DOWNTO 0));
        RETURN output;
    END FUNCTION calc_col;

    SIGNAL int_input_cols : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL int_output     : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN

    -- Convert Rows into Columns.
    int_input_cols <= rows_2_cols(INPUT_DATA);
    
    -- Every Rising Clock edge, Calculate mixed columns and store in int_output.
    int_output(127 DOWNTO 96) <= calc_col(int_input_cols(127 DOWNTO 96));
    int_output( 95 DOWNTO 64) <= calc_col(int_input_cols( 95 DOWNTO 64));
    int_output( 63 DOWNTO 32) <= calc_col(int_input_cols( 63 DOWNTO 32));
    int_output( 31 DOWNTO  0) <= calc_col(int_input_cols( 31 DOWNTO  0));

    PROCESS(CLK, RST_N)
    BEGIN
        IF (RST_N = '0') THEN
            OUTPUT_EN   <= '0';
            OUTPUT_DATA <= (OTHERS => '0');
        ELSIF RISING_EDGE(CLK) THEN
            OUTPUT_EN <= '0';
            IF (INPUT_EN = '1') THEN
                OUTPUT_EN   <= '1';
                OUTPUT_DATA <= cols_2_rows(int_output);
            END IF;
        END IF;
    END PROCESS;
END arch;