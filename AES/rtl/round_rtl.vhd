LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY round IS
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
        ROUND_KEY   : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        INPUT_EN    : IN  STD_LOGIC;
        --------------------------------------------------
        -- Output Data and Enable:
        --------------------------------------------------
        OUTPUT_DATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
        OUTPUT_EN   : OUT STD_LOGIC
    );
END round;

ARCHITECTURE arch OF round IS

----------------------------------
-- Signals Defined:
----------------------------------
-- Sub Bytes:
SIGNAL sub_bytes_dout     : STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL sub_bytes_out_en   : STD_LOGIC;

-- Shift Rows:
SIGNAL shift_rows_dout    : STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL shift_rows_out_en  : STD_LOGIC;

-- Mixed Columns:
SIGNAL mix_columns_dout   : STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL mix_columns_out_en : STD_LOGIC;

BEGIN

----------------------------------
-- Sub Bytes:
----------------------------------
sub_bytes_i: ENTITY work.sub_bytes
    PORT MAP(
        CLK         => CLK,
        RST_N       => RST_N,
        INPUT_DATA  => INPUT_DATA,
        INPUT_EN    => INPUT_EN,
        OUTPUT_DATA => sub_bytes_dout,
        OUTPUT_EN   => sub_bytes_out_en
    );

----------------------------------
-- Shift Rows:
----------------------------------
shift_rows_i: ENTITY work.shift_rows
    PORT MAP(
        CLK         => CLK,
        RST_N       => RST_N,
        INPUT_DATA  => sub_bytes_dout,
        INPUT_EN    => sub_bytes_out_en,
        OUTPUT_DATA => shift_rows_dout,
        OUTPUT_EN   => shift_rows_out_en
    );

 ----------------------------------
 -- Mixed Columns:
 ----------------------------------
 mix_columns_i: ENTITY work.mix_columns
     PORT MAP(
         CLK         => CLK,
         RST_N       => RST_N,
         INPUT_DATA  => shift_rows_dout,
         INPUT_EN    => shift_rows_out_en,
         OUTPUT_DATA => mix_columns_dout,
         OUTPUT_EN   => mix_columns_out_en
     );

----------------------------------
-- Add Roundkey:
----------------------------------
add_roundkey_i: ENTITY work.add_roundkey
    PORT MAP(
        CLK         => CLK,
        RST_N       => RST_N,
        INPUT_DATA  => mix_columns_dout,
        ROUND_KEY   => ROUND_KEY,
        INPUT_EN    => mix_columns_out_en,
        OUTPUT_DATA => OUTPUT_DATA,
        OUTPUT_EN   => OUTPUT_EN
    );    
END arch ;