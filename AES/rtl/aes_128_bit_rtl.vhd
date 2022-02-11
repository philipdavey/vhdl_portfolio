-- ====================================================================
-- File Name     : aes_128_bit_rtl.vhd
-- Author        : Philip Davey
-- Design Folder : AES
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

USE work.aes_pkg.ALL;

ENTITY aes_128_bit IS
    GENERIC(
        ENC_DECRYP_g : STD_LOGIC := '0' -- '0' for Encryption, '1' for Decryption
    )
    PORT(
        --------------------------------------------------
        -- Clock and Active Low Reset:
        --------------------------------------------------
        CLK           : IN  STD_LOGIC;
        RST_N         : IN  STD_LOGIC;
        --------------------------------------------------
        -- Clock and Active Low Reset:
        --------------------------------------------------
        ENCRYPTION_EN : IN STD_LOGIC;
        DECRYPTION_EN : IN STD_LOGIC;
        --------------------------------------------------
        -- Enable, Input Data and Cipher Key:
        --------------------------------------------------
        INPUT_EN      : IN  STD_LOGIC;
        INPUT_DATA    : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        CIPHER_KEY    : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
        --------------------------------------------------
        -- Output Data and Enable:
        --------------------------------------------------
        OUTPUT_EN     : OUT STD_LOGIC;
        OUTPUT_DATA   : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
    );
END aes_128_bit;

ARCHITECTURE arch OF aes_128_bit IS

BEGIN

--     ENTITY encryption IS
--     PORT(
--         --------------------------------------------------
--         -- Clock and Active Low Reset:
--         --------------------------------------------------
--         CLK         : IN  STD_LOGIC;
--         RST_N       : IN  STD_LOGIC;
--         --------------------------------------------------
--         -- Enable, Input Data and Cipher Key:
--         --------------------------------------------------
--         INPUT_EN    : IN  STD_LOGIC;
--         PLAIN_TEXT  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
--         CIPHER_KEY  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
--         --------------------------------------------------
--         -- Output Data and Enable:
--         --------------------------------------------------
--         OUTPUT_EN   : OUT STD_LOGIC;
--         CIPHER_TEXT : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
--     );
-- END encryption;

END arch;