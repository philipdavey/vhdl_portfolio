-- ====================================================================
-- File Name     : fifo_single_clock_tb.vhd
-- Author        : Philip Davey
-- Design Folder : MEMORIES
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
USE ieee.numeric_std.ALL;

USE work.tb_pkg.ALL;
USE std.env.STOP;

ENTITY fifo_single_clock_tb IS
END ENTITY fifo_single_clock_tb;

ARCHITECTURE arch OF fifo_single_clock_tb IS
----------------------------------
-- Testbench Parameters:
----------------------------------
CONSTANT TIME_PERIOD_c : time := 10 ns;

CONSTANT TC_01         : STD_LOGIC := '1';
CONSTANT TC_02         : STD_LOGIC := '0';

----------------------------------
-- UUT Signals Defined:
----------------------------------
-- Generics
CONSTANT WIDTH_c    : INTEGER := 32;
CONSTANT DEPTH_c    : INTEGER := 32;
-- Clock and Reset:
SIGNAL clk          : STD_LOGIC;
SIGNAL rst_n        : STD_LOGIC;
-- FIFO Signals:
SIGNAL fifo_wr_en   : STD_LOGIC;
SIGNAL fifo_full    : STD_LOGIC;
SIGNAL fifo_wr_data : STD_LOGIC_VECTOR(WIDTH_c-1 DOWNTO 0);
SIGNAL fifo_rd_en   : STD_LOGIC;
SIGNAL fifo_empty   : STD_LOGIC;
SIGNAL fifo_rd_data : STD_LOGIC_VECTOR(WIDTH_c-1 DOWNTO 0);

----------------------------------
-- Inputs:
----------------------------------

BEGIN

    -- UUT Declaration:
    UUT: ENTITY work.fifo_single_clock
    GENERIC MAP(
        WIDTH_g => WIDTH_c,
        DEPTH_g => DEPTH_c
    )
    PORT MAP(
        -- Clock and Active Low reset:
        CLK     => clk,
        RST_N   => rst_n,
        -- FIFO Write Interface:
        WR_EN   => fifo_wr_en,
        FULL    => fifo_full,
        WR_DATA => fifo_wr_data,
        -- FIFO Read Interface:
        RD_EN   => fifo_rd_en,
        EMPTY   => fifo_empty,
        RD_DATA => fifo_rd_data
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
    BEGIN
        fifo_wr_en   <= '0';
        fifo_rd_en   <= '0';
        fifo_wr_data <= (OTHERS => '0');

        -- Trigger Reset
        rst_n <= '0';
        WAIT FOR TIME_PERIOD_c*5;
        rst_n <= '1';

        WAIT UNTIL RISING_EDGE(CLK);

        IF (TC_01 = '1') THEN
            -- Fill FIFO until full.
            FOR i IN 0 TO DEPTH_c -1 LOOP
                fifo_wr_en   <= '1';
                fifo_wr_data <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, fifo_wr_data'LENGTH));
                WAIT UNTIL RISING_EDGE(CLK);
            END LOOP;

            -- Deassert write enable/reset write data:
            fifo_wr_en   <= '0';
            fifo_wr_data <= (OTHERS => '0');

            WAIT UNTIL RISING_EDGE(CLK);

            -- Read all the values out of the FIFO.
            FOR i IN 0 TO DEPTH_c -1 LOOP
                fifo_rd_en <= '1';
                WAIT UNTIL RISING_EDGE(CLK);
                fifo_rd_en <= '0';
                self_check_vector("Read Data " & to_string(i), fifo_rd_data, STD_LOGIC_VECTOR(TO_UNSIGNED(i, fifo_rd_data'length)));
            END LOOP;

        END IF;

        WAIT;
    END PROCESS stim_i;
END arch ;