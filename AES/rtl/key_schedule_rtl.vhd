LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

USE work.aes_pkg.ALL;

ENTITY key_schedule IS
    GENERIC(
        KEY_SCH_NUM_g : INTEGER := 0
    );
    PORT(
        --------------------------------------------------
        -- Clock and Active Low Reset:
        --------------------------------------------------
        CLK         : IN  STD_LOGIC;
        RST_N       : IN  STD_LOGIC;
        --------------------------------------------------
        -- Input Data and Enable:
        --------------------------------------------------
        INPUT_EN    : IN  STD_LOGIC;
        CIPHER_KEY  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        --------------------------------------------------
        -- Output Data and Enable:
        --------------------------------------------------
        OUTPUT_EN   : OUT STD_LOGIC;
        OUTPUT_DATA : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
    );
END key_schedule;

ARCHITECTURE arch OF key_schedule IS

    -- Cipher Key converted to columns.
    SIGNAL cipher_key_cols  : STD_LOGIC_VECTOR(127 DOWNTO 0); 

    -- Rotword.
    SIGNAL rotword          : STD_LOGIC_VECTOR( 31 DOWNTO 0);
    SIGNAL rotword_subbytes : STD_LOGIC_VECTOR( 31 DOWNTO 0);

    -- First row of RCON.
    TYPE rcon_array IS ARRAY (0 TO 9) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL rcon             : rcon_array := (x"01", x"02", x"04", x"08", x"10", x"20", x"40", x"80", x"1B", x"36");

    SIGNAL roundkey         : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL roundkey_rows    : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN

    -- Convert rows to columns.
    cipher_key_cols <= rows_2_cols(CIPHER_KEY);

    -- Calculate rotword.
    rotword <= cipher_key_cols(23 DOWNTO 0) & cipher_key_cols(31 DOWNTO 24);

    -- Perform subbytes on rotword.
    rotword_gen_i: FOR i IN 0 TO 3 GENERATE
        sbox_lut_i: ENTITY work.sbox_lut
            PORT MAP(
                INPUT  => rotword((i*8)+7 DOWNTO i*8),
                OUTPUT => rotword_subbytes((i*8)+7 DOWNTO i*8)
            );
    END GENERATE rotword_gen_i;

    -- First row of Roundkey:
    roundkey(127 DOWNTO 96) <= cipher_key_cols(127 DOWNTO 96) XOR rotword_subbytes XOR rcon(KEY_SCH_NUM_g) & x"000000";

    -- Calculate remaining rows of roundkey:
    roundkey(95 DOWNTO 64)  <= cipher_key_cols( 95 DOWNTO 64) XOR roundkey(127 DOWNTO 96);
    roundkey(63 DOWNTO 32)  <= cipher_key_cols( 63 DOWNTO 32) XOR roundkey( 95 DOWNTO 64);
    roundkey(31 DOWNTO  0)  <= cipher_key_cols( 31 DOWNTO  0) XOR roundkey( 63 DOWNTO 32);

    roundkey_rows <= cols_2_rows(roundkey);

    PROCESS(CLK, RST_N)
    BEGIN
        IF (RST_N = '0') THEN
            OUTPUT_EN   <= '0';
            OUTPUT_DATA <= (OTHERS => '0');
        ELSIF RISING_EDGE(CLK) THEN
            OUTPUT_EN  <= '0';
            IF (INPUT_EN = '1') THEN
                OUTPUT_EN   <= '1';
                OUTPUT_DATA <= roundkey_rows;
            END IF;
        END IF;
    END PROCESS;

END arch ;