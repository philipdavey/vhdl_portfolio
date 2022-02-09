-- ====================================================================
-- File Name     : inv_round_tb.vhd
-- Author        : Philip Davey
-- Design Folder : AES
-- Date          : February 2022
-- Rtl/Sim/Pkg   : Sim
-- --------------------------------------------------------------------
-- HDL           : VHDL 2008
-- --------------------------------------------------------------------
-- Description   :
--               :
--               :
--               :
--               :
-- ====================================================================

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE work.tb_pkg.ALL;
USE std.env.STOP;

ENTITY inv_round_tb IS
END ENTITY inv_round_tb;

ARCHITECTURE arch OF inv_round_tb IS
----------------------------------
-- Testbench Parameters:
----------------------------------
CONSTANT TIME_PERIOD_c : time := 10 ns;

CONSTANT TC_01         : STD_LOGIC := '1';
CONSTANT TC_02         : STD_LOGIC := '0';

----------------------------------
-- UUT Signals Defined:
----------------------------------
-- Clock and Reset:
SIGNAL clk         : STD_LOGIC;
SIGNAL rst_n       : STD_LOGIC;
-- Input data/en:
SIGNAL input_data  : STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL input_en    : STD_LOGIC;
-- Roundkey:
SIGNAL round_key   : STD_LOGIC_VECTOR(127 DOWNTO 0);
-- Output data/en:
SIGNAL output_data : STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL output_en   : STD_LOGIC;

----------------------------------
-- Inputs:
----------------------------------

CONSTANT data_in             : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"799CAA0F3E34B7A97603B26C97E9D1CC");

CONSTANT round_key_in        : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"D6C24D3EBE09B002BDEA731B0D4980B9");

CONSTANT inv_sub_bytes_out   : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"AF1C62FBD12820B70FD53EB885EB5127");

CONSTANT inv_shift_rows_out  : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"AF1C62FBB7D128203EB80FD5EB512785");

CONSTANT inv_mix_columns_out : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"122406512A2A05CC02C8AF72F7E2CE64");

CONSTANT exp_output_data     : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"C4E64B6F9423B5CEBF22DC69FAAB4EDD");

BEGIN

    -- UUT Declaration:
    UUT: ENTITY work.inv_round
    PORT MAP(
        -- Clock and Active Low Reset:
        CLK         => clk,
        RST_N       => rst_n,
        -- Input Data/Enable:
        INPUT_DATA  => input_data,
        INPUT_EN    => input_en,
        -- Input Roundkey:
        ROUND_KEY   => round_key,
        -- Output Data/Enable:
        OUTPUT_EN   => output_en,
        OUTPUT_DATA => output_data
    );

    -- Clock Process:
    clk_gen_i: PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR TIME_PERIOD_C/2;
        clk <= '1';
        WAIT FOR TIME_PERIOD_c/2;
    END PROCESS;

    -- Stimulus Process:
    stim_i: PROCESS
        ----------------------------------
        -- -- Externals:
        ----------------------------------
        -- Sub Bytes:
        ALIAS ext_inv_sub_bytes_out_en   IS << SIGNAL .inv_round_tb.UUT.inv_sub_bytes_out_en   : STD_LOGIC >>;
        ALIAS ext_inv_sub_bytes_dout     IS << SIGNAL .inv_round_tb.UUT.inv_sub_bytes_dout     : STD_LOGIC_VECTOR(127 DOWNTO 0) >>;

        -- Shift Rows:
        ALIAS ext_inv_shift_rows_out_en  IS << SIGNAL .inv_round_tb.UUT.inv_shift_rows_out_en  : STD_LOGIC >>;
        ALIAS ext_inv_shift_rows_dout    IS << SIGNAL .inv_round_tb.UUT.inv_shift_rows_dout    : STD_LOGIC_VECTOR(127 DOWNTO 0) >>;

        -- Mixed Columns:
        ALIAS ext_inv_mix_columns_out_en IS << SIGNAL .inv_round_tb.UUT.inv_mix_columns_out_en : STD_LOGIC >>;
        ALIAS ext_inv_mix_columns_dout   IS << SIGNAL .inv_round_tb.UUT.inv_mix_columns_dout   : STD_LOGIC_VECTOR(127 DOWNTO 0) >>;
    BEGIN
        input_en   <= '0';             -- Deassert Input Enable.
        input_data <= (OTHERS => '0'); -- Reset Input Data.
        round_key  <= (OTHERS => '0'); -- Reset Round Key.

        rst_n <= '0';
        WAIT FOR TIME_PERIOD_c*5;
        rst_n <= '1';

        WAIT UNTIL RISING_EDGE(CLK);

        IF (TC_01 = '1') THEN

            WAIT UNTIL RISING_EDGE(CLK);

            input_en   <= '1';          -- Assert Input Enable.
            input_data <= data_in;      -- Insert Input data.
            round_key  <= round_key_in; -- Insert Round Key.

            WAIT UNTIL RISING_EDGE(CLK);

            input_en   <= '0';             -- Deassert Input Enable.
            input_data <= (OTHERS => '0'); -- Reset Input Data.
            round_key  <= (OTHERS => '0'); -- Reset Round Key.

            WAIT UNTIL ext_inv_sub_bytes_out_en = '1';

            self_check_vector("Inverse Sub Bytes OUTPUT", ext_inv_sub_bytes_dout, inv_sub_bytes_out); -- Check Inverse Sub Bytes.

            WAIT UNTIL ext_inv_shift_rows_out_en = '1';

            self_check_vector("Inverse Shift Rows OUTPUT", ext_inv_shift_rows_dout, inv_shift_rows_out); -- Check Inverse Shift Rows.

            WAIT UNTIL ext_inv_mix_columns_out_en = '1';

            self_check_vector("Inverse Mixed Columns OUTPUT", ext_inv_mix_columns_dout, inv_mix_columns_out); -- Check Inverse Mix Columns.

            WAIT UNTIL output_en = '1';

            self_check_vector("ROUND OUTPUT", output_data, exp_output_data); -- Check Inverse Round output.

            WAIT FOR 50 ns;

            REPORT "Calling 'stop'";
            STOP;
        END IF;
        WAIT;
    END PROCESS stim_i;
END arch ;