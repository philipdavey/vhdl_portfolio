LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE aes_pkg IS

    FUNCTION gf_8_mult (
        v1 : IN STD_LOGIC_VECTOR;
        v2 : IN STD_LOGIC_VECTOR)
    RETURN STD_LOGIC_VECTOR;

    FUNCTION rows_2_cols (
        input_rows  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;

    FUNCTION cols_2_rows (
        input_cols  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0))
    RETURN STD_LOGIC_VECTOR;

END PACKAGE aes_pkg;

PACKAGE BODY aes_pkg IS

    FUNCTION gf_8_mult (
        v1 : IN STD_LOGIC_VECTOR;
        v2 : IN STD_LOGIC_VECTOR)
    RETURN STD_LOGIC_VECTOR IS
        CONSTANT m      : INTEGER := 8;
        VARIABLE dummy  : STD_LOGIC;
        VARIABLE v_temp : STD_LOGIC_VECTOR(m-1 DOWNTO 0);
        VARIABLE v_out  : STD_LOGIC_VECTOR(m-1 DOWNTO 0);
    BEGIN
        v_temp := (OTHERS => '0');
        FOR i IN 0 TO m-1 LOOP
            dummy     := v_temp(7);
            v_temp(7 ) := v_temp(6 );
            v_temp(6 ) := v_temp(5 );
            v_temp(5 ) := v_temp(4 );
            v_temp(4 ) := v_temp(3 ) xor dummy;
            v_temp(3 ) := v_temp(2 ) xor dummy;
            v_temp(2 ) := v_temp(1 ) xor dummy;
            v_temp(1 ) := v_temp(0 );
            v_temp(0 ) := dummy;

            FOR j IN 0 TO m-1 LOOP
                v_temp(j) := v_temp(j) XOR (v1(j) AND v2(m-i-1));
            END LOOP;
        END LOOP;
        
        v_out := v_temp;
        RETURN v_out;
    END gf_8_mult;

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
    
END PACKAGE BODY aes_pkg;