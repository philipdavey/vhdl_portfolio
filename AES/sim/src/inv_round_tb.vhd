-- ====================================================================
-- File Name     : inv_round_tb.vhd
-- Author        : Philip Davey
-- Design Folder : AES
-- Date          : February 2022
-- Rtl/Sim/Pkg   : Sim
-- --------------------------------------------------------------------
-- HDL           : VHDL 2008
-- --------------------------------------------------------------------
-- Description   : Testbench for inv_round_rtl.vhd.
--               :
--               : Inputs Data and Round Key, checks the output of
--               : each operation.
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

CONSTANT data_in             : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"7A892B3DD5EFCA9FFD4E10F5A7270B9F");

CONSTANT round_key_in        : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"54F010BE9985932C3257ED97D1689C4E");

CONSTANT inv_shift_rows_out  : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"7A892B3D9FD5EFCA10F5FD4E270B9FA7");

CONSTANT inv_sub_bytes_out   : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"BDF20B8B6EB561107C7721B63D9E6E89");

CONSTANT add_rk_out          : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"E9021B35F730F23C4E20CC21ECF6F2C7");

CONSTANT exp_output_data     : STD_LOGIC_VECTOR(127 DOWNTO 0) := (x"546B96A1D9A0BB11909AF470A1B50E2F");

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
        -- Inverse Shift Rows:
        ALIAS ext_inv_shift_rows_out_en  IS << SIGNAL .inv_round_tb.UUT.inv_shift_rows_out_en  : STD_LOGIC >>;
        ALIAS ext_inv_shift_rows_dout    IS << SIGNAL .inv_round_tb.UUT.inv_shift_rows_dout    : STD_LOGIC_VECTOR(127 DOWNTO 0) >>;        

        -- Inverse Sub Bytes:
        ALIAS ext_inv_sub_bytes_out_en   IS << SIGNAL .inv_round_tb.UUT.inv_sub_bytes_out_en   : STD_LOGIC >>;
        ALIAS ext_inv_sub_bytes_dout     IS << SIGNAL .inv_round_tb.UUT.inv_sub_bytes_dout     : STD_LOGIC_VECTOR(127 DOWNTO 0) >>;

        -- Add RK
        ALIAS ext_add_rk_out_en          IS << SIGNAL .inv_round_tb.UUT.add_rk_out_en          : STD_LOGIC >>;
        ALIAS ext_add_rk_dout            IS << SIGNAL .inv_round_tb.UUT.add_rk_dout            : STD_LOGIC_VECTOR(127 DOWNTO 0) >>;

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

            WAIT UNTIL ext_inv_shift_rows_out_en = '1';

            self_check_vector("Inverse Shift Rows OUTPUT", ext_inv_shift_rows_dout, inv_shift_rows_out); -- Check Inverse Shift Rows.

            WAIT UNTIL ext_inv_sub_bytes_out_en = '1';

            self_check_vector("Inverse Sub Bytes OUTPUT", ext_inv_sub_bytes_dout, inv_sub_bytes_out); -- Check Inverse Sub Bytes.

            WAIT UNTIL ext_add_rk_out_en = '1';

            self_check_vector("Add Round Key OUTPUT", ext_add_rk_dout, add_rk_out); -- Check Add Round Key.

            WAIT UNTIL output_en = '1';

            self_check_vector("ROUND OUTPUT", output_data, exp_output_data); -- Check Inverse Round output.

            WAIT FOR 50 ns;

            REPORT "Calling 'stop'";
            STOP;
        END IF;
        WAIT;
    END PROCESS stim_i;
END arch ;