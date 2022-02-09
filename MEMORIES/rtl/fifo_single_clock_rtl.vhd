-- ====================================================================
-- File Name     : fifo_single_clock_rtl.vhd
-- Author        : Philip Davey
-- Design Folder : MEMORIES
-- Date          : February 2022
-- Rtl/Sim/Pkg   : RTL
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
USE ieee.numeric_std.ALL;

ENTITY fifo_single_clock IS
    GENERIC(
        WIDTH_g : INTEGER := 32;
        DEPTH_g : INTEGER := 128
    );
    PORT(
        -- Clock and Active Low reset:
        CLK     : IN  STD_LOGIC;
        RST_N   : IN  STD_LOGIC;
        -- FIFO Write Interface:
        WR_EN   : IN  STD_LOGIC;
        FULL    : OUT STD_LOGIC;
        WR_DATA : IN  STD_LOGIC_VECTOR(WIDTH_g -1 DOWNTO 0);
        -- FIFO Read Interface:
        RD_EN   : IN  STD_LOGIC;
        EMPTY   : OUT STD_LOGIC;
        RD_DATA : OUT STD_LOGIC_VECTOR(WIDTH_g -1 DOWNTO 0)
    );
END ENTITY fifo_single_clock;

ARCHITECTURE arch OF fifo_single_clock IS

    TYPE FIFO_DATA_ARRAY IS ARRAY (0 to DEPTH_g-1) OF STD_LOGIC_VECTOR(WIDTH_g-1 DOWNTO 0);
    SIGNAL fifo_data     : FIFO_DATA_ARRAY;

    SIGNAL fifo_count    : INTEGER RANGE 0 TO DEPTH_g;

    SIGNAL fifo_wr_index : INTEGER RANGE 0 TO DEPTH_g -1;
    SIGNAL fifo_rd_index : INTEGER RANGE 0 TO DEPTH_g -1;

    SIGNAL int_full      : STD_LOGIC;
    SIGNAL int_empty     : STD_LOGIC;

BEGIN

    PROCESS(CLK, RST_N)
    BEGIN
        IF (RST_N = '0') THEN
         fifo_data     <= (OTHERS => (OTHERS => '0'));
         fifo_count    <= 0;
         fifo_wr_index <= 0;
         fifo_rd_index <= 0;
        ELSIF RISING_EDGE(CLK) THEN

            -- Keep track of total number of words in the FIFO:
            IF (WR_EN = '1' AND RD_EN = '0') THEN
                fifo_count <= fifo_count + 1;
            ELSIF(WR_EN = '0' AND RD_EN = '1') THEN
            fifo_count <= fifo_count - 1;
            END IF;

            -- Keep track of FIFO write index:
            IF (WR_EN = '1' AND int_full = '0') THEN
                IF (fifo_wr_index = DEPTH_g -1) THEN
                    fifo_wr_index <= 0;
                ELSE
                    fifo_wr_index <= fifo_wr_index + 1;
                END IF;
            END IF;

            -- Keep track of FIFO read index:
            IF (RD_EN = '1' AND int_empty = '0') THEN
                IF (fifo_rd_index = DEPTH_g -1) THEN
                    fifo_rd_index <= 0;
                ELSE
                    fifo_rd_index <= fifo_rd_index + 1;
                END IF;
            END IF;

            -- Store wr data when wr en is asserted:
            IF (WR_EN = '1') THEN
                fifo_data(fifo_wr_index) <= WR_DATA;
            END IF;
        END IF;
    END PROCESS;

    RD_DATA <= fifo_data(fifo_rd_index);
    
    int_full  <= '1' WHEN fifo_count = DEPTH_g ELSE '0';
    int_empty <= '1' WHEN fifo_count = 0       ELSE '0';

    FULL  <= int_full;
    EMPTY <= int_empty;

END arch;