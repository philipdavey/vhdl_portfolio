-- ====================================================================
-- File Name     : aes_pkg.vhd
-- Author        : Philip Davey
-- Design Folder : AES
-- Date          : February 2022
-- Rtl/Sim/Pkg   : Package
-- --------------------------------------------------------------------
-- HDL           : VHDL 2008
-- --------------------------------------------------------------------
-- Description   :
--               :
--               :
--               :
--               :
-- ====================================================================

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE aes_pkg IS

    --------------------------------------------------
    -- Row/Column Manipulation:
    --------------------------------------------------

    FUNCTION rows_2_cols (
        input_rows  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;

    FUNCTION cols_2_rows (
        input_cols  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;

    --------------------------------------------------
    -- Galois Field Multiplication:
    --------------------------------------------------

    -- Calculate 02s:
    FUNCTION calc_02s (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;

    -- Calculate 03s:
    FUNCTION calc_03s (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;

    -- Calculate 09s:
    FUNCTION calc_09s (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;

    -- Calculate 11s:
    FUNCTION calc_11s (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;

    -- Calculate 13s:
    FUNCTION calc_13s (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;

    -- Calculate 14s:
    FUNCTION calc_14s (
    input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;

END PACKAGE aes_pkg;

PACKAGE BODY aes_pkg IS

    --------------------------------------------------
    -- Row/Column Manipulation:
    --------------------------------------------------

    FUNCTION rows_2_cols (
        input_rows  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR IS
        VARIABLE output_cols : STD_LOGIC_VECTOR(127 DOWNTO 0);
    BEGIN
        -- Convert rows into columns
        output_cols(127 DOWNTO 96) := input_rows(127 DOWNTO 120) & input_rows(95 DOWNTO 88) & input_rows(63 DOWNTO 56) & input_rows(31 DOWNTO 24);
        output_cols( 95 DOWNTO 64) := input_rows(119 DOWNTO 112) & input_rows(87 DOWNTO 80) & input_rows(55 DOWNTO 48) & input_rows(23 DOWNTO 16);
        output_cols( 63 DOWNTO 32) := input_rows(111 DOWNTO 104) & input_rows(79 DOWNTO 72) & input_rows(47 DOWNTO 40) & input_rows(15 DOWNTO  8);
        output_cols( 31 DOWNTO  0) := input_rows(103 DOWNTO  96) & input_rows(71 DOWNTO 64) & input_rows(39 DOWNTO 32) & input_rows( 7 DOWNTO  0);
        RETURN output_cols;
    END FUNCTION rows_2_cols;

    FUNCTION cols_2_rows (
        input_cols  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR IS
        VARIABLE output_rows : STD_LOGIC_VECTOR(127 DOWNTO 0);
    BEGIN
        -- Convert columns into rows				
        output_rows(127 DOWNTO 96) := input_cols(127 DOWNTO 120) & input_cols(95 DOWNTO 88) & input_cols(63 DOWNTO 56) & input_cols(31 DOWNTO 24);
        output_rows( 95 DOWNTO 64) := input_cols(119 DOWNTO 112) & input_cols(87 DOWNTO 80) & input_cols(55 DOWNTO 48) & input_cols(23 DOWNTO 16);
        output_rows( 63 DOWNTO 32) := input_cols(111 DOWNTO 104) & input_cols(79 DOWNTO 72) & input_cols(47 DOWNTO 40) & input_cols(15 DOWNTO  8);
        output_rows( 31 DOWNTO  0) := input_cols(103 DOWNTO  96) & input_cols(71 DOWNTO 64) & input_cols(39 DOWNTO 32) & input_cols( 7 DOWNTO  0);
        RETURN output_rows;
    END FUNCTION cols_2_rows;

    --------------------------------------------------
    -- Galois Field Multiplication:
    --------------------------------------------------

    -- Calculate 02s:
    FUNCTION calc_02s (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
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

    -- Calculate 03s:
    FUNCTION calc_03s (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
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

    -- Calculate 09s:
    FUNCTION calc_09s (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR IS
        VARIABLE output : STD_LOGIC_VECTOR(7 DOWNTO 0);
    BEGIN
        output := calc_02s(calc_02s(calc_02s(input))) XOR input;
        RETURN output;
    END FUNCTION calc_09s;

    -- Calculate 11s:
    FUNCTION calc_11s (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR IS
        VARIABLE output : STD_LOGIC_VECTOR(7 DOWNTO 0);
    BEGIN
        output := (calc_02s(calc_02s(calc_02s(input)) XOR input)) XOR input;
        RETURN output;
    END FUNCTION calc_11s;

    -- Calculate 13s:
    FUNCTION calc_13s (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR IS
        VARIABLE output : STD_LOGIC_VECTOR(7 DOWNTO 0);
    BEGIN
        output := calc_02s(calc_02s(calc_02s(input) XOR input)) XOR input;
        RETURN output;
    END FUNCTION calc_13s;

    -- Calculate 14s:
    FUNCTION calc_14s (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR IS
        VARIABLE output : STD_LOGIC_VECTOR(7 DOWNTO 0);
    BEGIN
        output := calc_02s(calc_02s(calc_02s(input) XOR input) XOR input);
        RETURN output;
    END FUNCTION calc_14s;
    
END PACKAGE BODY aes_pkg;