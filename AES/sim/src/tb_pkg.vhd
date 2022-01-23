LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE tb_pkg IS

    PROCEDURE self_check_vector ( CONSTANT signal_name : IN STRING;
                                  CONSTANT input       : IN STD_LOGIC_VECTOR;
                                  CONSTANT exp_output  : IN STD_LOGIC_VECTOR);

END PACKAGE tb_pkg;

PACKAGE BODY tb_pkg IS

PROCEDURE self_check_vector ( CONSTANT signal_name : IN STRING;
                              CONSTANT input       : IN STD_LOGIC_VECTOR;
                              CONSTANT exp_output  : IN STD_LOGIC_VECTOR) IS
BEGIN
    IF (input = exp_output) THEN
        REPORT "PASS : " & signal_name;
    ELSE
        REPORT "FAIL : " & signal_name & ". Expected: " & to_hstring(exp_output) & " Actual was: " & to_hstring(input);
    END IF;
END PROCEDURE self_check_vector;
    
END PACKAGE BODY tb_pkg;