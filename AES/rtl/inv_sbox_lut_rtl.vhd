

-- Inverse Sbox Table:
-- x"52_09_6A_D5_30_36_A5_38_BF_40_A3_9E_81_F3_D7_FB", -- 0
-- x"7C_E3_39_82_9B_2F_FF_87_34_8E_43_44_C4_DE_E9_CB", -- 1
-- x"54_7B_94_32_A6_C2_23_3D_EE_4C_95_0B_42_FA_C3_4E", -- 2
-- x"08_2E_A1_66_28_D9_24_B2_76_5B_A2_49_6D_8B_D1_25", -- 3
-- x"72_F8_F6_64_86_68_98_16_D4_A4_5C_CC_5D_65_B6_92", -- 4
-- x"6C_70_48_50_FD_ED_B9_DA_5E_15_46_57_A7_8D_9D_84", -- 5
-- x"90_D8_AB_00_8C_BC_D3_0A_F7_E4_58_05_B8_B3_45_06", -- 6
-- x"D0_2C_1E_8F_CA_3F_0F_02_C1_AF_BD_03_01_13_8A_6B", -- 7
-- x"3A_91_11_41_4F_67_DC_EA_97_F2_CF_CE_F0_B4_E6_73", -- 8
-- x"96_AC_74_22_E7_AD_35_85_E2_F9_37_E8_1C_75_DF_6E", -- 9
-- x"47_F1_1A_71_1D_29_C5_89_6F_B7_62_0E_AA_18_BE_1B", -- 10
-- x"FC_56_3E_4B_C6_D2_79_20_9A_DB_C0_FE_78_CD_5A_F4", -- 11
-- x"1F_DD_A8_33_88_07_C7_31_B1_12_10_59_27_80_EC_5F", -- 12
-- x"60_51_7F_A9_19_B5_4A_0D_2D_E5_7A_9F_93_C9_9C_EF", -- 13
-- x"A0_E0_3B_4D_AE_2A_F5_B0_C8_EB_BB_3C_83_53_99_61", -- 14
-- x"17_2B_04_7E_BA_77_D6_26_E1_69_14_63_55_21_0C_7D"  -- 15


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY inv_sbox_lut IS
    PORT(
        INPUT  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        OUTPUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END inv_sbox_lut;

ARCHITECTURE arch of inv_sbox_lut IS

BEGIN
    PROCESS(INPUT)
    BEGIN
        CASE INPUT IS
			WHEN x"00"  => OUTPUT <= x"52";
			WHEN x"01"  => OUTPUT <= x"09";
			WHEN x"02"  => OUTPUT <= x"6A";
			WHEN x"03"  => OUTPUT <= x"D5";
			WHEN x"04"  => OUTPUT <= x"30";
			WHEN x"05"  => OUTPUT <= x"36";
			WHEN x"06"  => OUTPUT <= x"A5";
			WHEN x"07"  => OUTPUT <= x"38";
			WHEN x"08"  => OUTPUT <= x"BF";
			WHEN x"09"  => OUTPUT <= x"40";
			WHEN x"0A"  => OUTPUT <= x"A3";
			WHEN x"0B"  => OUTPUT <= x"9E";
			WHEN x"0C"  => OUTPUT <= x"81";
			WHEN x"0D"  => OUTPUT <= x"F3";
			WHEN x"0E"  => OUTPUT <= x"D7";
			WHEN x"0F"  => OUTPUT <= x"FB";
			WHEN x"10"  => OUTPUT <= x"7C";
			WHEN x"11"  => OUTPUT <= x"E3";
			WHEN x"12"  => OUTPUT <= x"39";
			WHEN x"13"  => OUTPUT <= x"82";
			WHEN x"14"  => OUTPUT <= x"9B";
			WHEN x"15"  => OUTPUT <= x"2F";
			WHEN x"16"  => OUTPUT <= x"FF";
			WHEN x"17"  => OUTPUT <= x"87";
			WHEN x"18"  => OUTPUT <= x"34";
			WHEN x"19"  => OUTPUT <= x"8E";
			WHEN x"1A"  => OUTPUT <= x"43";
			WHEN x"1B"  => OUTPUT <= x"44";
			WHEN x"1C"  => OUTPUT <= x"C4";
			WHEN x"1D"  => OUTPUT <= x"DE";
			WHEN x"1E"  => OUTPUT <= x"E9";
			WHEN x"1F"  => OUTPUT <= x"CB";
			WHEN x"20"  => OUTPUT <= x"54";
			WHEN x"21"  => OUTPUT <= x"7B";
			WHEN x"22"  => OUTPUT <= x"94";
			WHEN x"23"  => OUTPUT <= x"32";
			WHEN x"24"  => OUTPUT <= x"A6";
			WHEN x"25"  => OUTPUT <= x"C2";
			WHEN x"26"  => OUTPUT <= x"23";
			WHEN x"27"  => OUTPUT <= x"3D";
			WHEN x"28"  => OUTPUT <= x"EE";
			WHEN x"29"  => OUTPUT <= x"4C";
			WHEN x"2A"  => OUTPUT <= x"95";
			WHEN x"2B"  => OUTPUT <= x"0B";
			WHEN x"2C"  => OUTPUT <= x"42";
			WHEN x"2D"  => OUTPUT <= x"FA";
			WHEN x"2E"  => OUTPUT <= x"C3";
			WHEN x"2F"  => OUTPUT <= x"4E";
			WHEN x"30"  => OUTPUT <= x"08";
			WHEN x"31"  => OUTPUT <= x"2E";
			WHEN x"32"  => OUTPUT <= x"A1";
			WHEN x"33"  => OUTPUT <= x"66";
			WHEN x"34"  => OUTPUT <= x"28";
			WHEN x"35"  => OUTPUT <= x"D9";
			WHEN x"36"  => OUTPUT <= x"24";
			WHEN x"37"  => OUTPUT <= x"B2";
			WHEN x"38"  => OUTPUT <= x"76";
			WHEN x"39"  => OUTPUT <= x"5B";
			WHEN x"3A"  => OUTPUT <= x"A2";
			WHEN x"3B"  => OUTPUT <= x"49";
			WHEN x"3C"  => OUTPUT <= x"6D";
			WHEN x"3D"  => OUTPUT <= x"8B";
			WHEN x"3E"  => OUTPUT <= x"D1";
			WHEN x"3F"  => OUTPUT <= x"25";
			WHEN x"40"  => OUTPUT <= x"72";
			WHEN x"41"  => OUTPUT <= x"F8";
			WHEN x"42"  => OUTPUT <= x"F6";
			WHEN x"43"  => OUTPUT <= x"64";
			WHEN x"44"  => OUTPUT <= x"86";
			WHEN x"45"  => OUTPUT <= x"68";
			WHEN x"46"  => OUTPUT <= x"98";
			WHEN x"47"  => OUTPUT <= x"16";
			WHEN x"48"  => OUTPUT <= x"D4";
			WHEN x"49"  => OUTPUT <= x"A4";
			WHEN x"4A"  => OUTPUT <= x"5C";
			WHEN x"4B"  => OUTPUT <= x"CC";
			WHEN x"4C"  => OUTPUT <= x"5D";
			WHEN x"4D"  => OUTPUT <= x"65";
			WHEN x"4E"  => OUTPUT <= x"B6";
			WHEN x"4F"  => OUTPUT <= x"92";
			WHEN x"50"  => OUTPUT <= x"6C";
			WHEN x"51"  => OUTPUT <= x"70";
			WHEN x"52"  => OUTPUT <= x"48";
			WHEN x"53"  => OUTPUT <= x"50";
			WHEN x"54"  => OUTPUT <= x"FD";
			WHEN x"55"  => OUTPUT <= x"ED";
			WHEN x"56"  => OUTPUT <= x"B9";
			WHEN x"57"  => OUTPUT <= x"DA";
			WHEN x"58"  => OUTPUT <= x"5E";
			WHEN x"59"  => OUTPUT <= x"15";
			WHEN x"5A"  => OUTPUT <= x"46";
			WHEN x"5B"  => OUTPUT <= x"57";
			WHEN x"5C"  => OUTPUT <= x"A7";
			WHEN x"5D"  => OUTPUT <= x"8D";
			WHEN x"5E"  => OUTPUT <= x"9D";
			WHEN x"5F"  => OUTPUT <= x"84";
			WHEN x"60"  => OUTPUT <= x"90";
			WHEN x"61"  => OUTPUT <= x"D8";
			WHEN x"62"  => OUTPUT <= x"AB";
			WHEN x"63"  => OUTPUT <= x"00";
			WHEN x"64"  => OUTPUT <= x"8C";
			WHEN x"65"  => OUTPUT <= x"BC";
			WHEN x"66"  => OUTPUT <= x"D3";
			WHEN x"67"  => OUTPUT <= x"0A";
			WHEN x"68"  => OUTPUT <= x"F7";
			WHEN x"69"  => OUTPUT <= x"E4";
			WHEN x"6A"  => OUTPUT <= x"58";
			WHEN x"6B"  => OUTPUT <= x"05";
			WHEN x"6C"  => OUTPUT <= x"B8";
			WHEN x"6D"  => OUTPUT <= x"B3";
			WHEN x"6E"  => OUTPUT <= x"45";
			WHEN x"6F"  => OUTPUT <= x"06";
			WHEN x"70"  => OUTPUT <= x"D0";
			WHEN x"71"  => OUTPUT <= x"2C";
			WHEN x"72"  => OUTPUT <= x"1E";
			WHEN x"73"  => OUTPUT <= x"8F";
			WHEN x"74"  => OUTPUT <= x"CA";
			WHEN x"75"  => OUTPUT <= x"3F";
			WHEN x"76"  => OUTPUT <= x"0F";
			WHEN x"77"  => OUTPUT <= x"02";
			WHEN x"78"  => OUTPUT <= x"C1";
			WHEN x"79"  => OUTPUT <= x"AF";
			WHEN x"7A"  => OUTPUT <= x"BD";
			WHEN x"7B"  => OUTPUT <= x"03";
			WHEN x"7C"  => OUTPUT <= x"01";
			WHEN x"7D"  => OUTPUT <= x"13";
			WHEN x"7E"  => OUTPUT <= x"8A";
			WHEN x"7F"  => OUTPUT <= x"6B";
			WHEN x"80"  => OUTPUT <= x"3A";
			WHEN x"81"  => OUTPUT <= x"91";
			WHEN x"82"  => OUTPUT <= x"11";
			WHEN x"83"  => OUTPUT <= x"41";
			WHEN x"84"  => OUTPUT <= x"4F";
			WHEN x"85"  => OUTPUT <= x"67";
			WHEN x"86"  => OUTPUT <= x"DC";
			WHEN x"87"  => OUTPUT <= x"EA";
			WHEN x"88"  => OUTPUT <= x"97";
			WHEN x"89"  => OUTPUT <= x"F2";
			WHEN x"8A"  => OUTPUT <= x"CF";
			WHEN x"8B"  => OUTPUT <= x"CE";
			WHEN x"8C"  => OUTPUT <= x"F0";
			WHEN x"8D"  => OUTPUT <= x"B4";
			WHEN x"8E"  => OUTPUT <= x"E6";
			WHEN x"8F"  => OUTPUT <= x"73";
			WHEN x"90"  => OUTPUT <= x"96";
			WHEN x"91"  => OUTPUT <= x"AC";
			WHEN x"92"  => OUTPUT <= x"74";
			WHEN x"93"  => OUTPUT <= x"22";
			WHEN x"94"  => OUTPUT <= x"E7";
			WHEN x"95"  => OUTPUT <= x"AD";
			WHEN x"96"  => OUTPUT <= x"35";
			WHEN x"97"  => OUTPUT <= x"85";
			WHEN x"98"  => OUTPUT <= x"E2";
			WHEN x"99"  => OUTPUT <= x"F9";
			WHEN x"9A"  => OUTPUT <= x"37";
			WHEN x"9B"  => OUTPUT <= x"E8";
			WHEN x"9C"  => OUTPUT <= x"1C";
			WHEN x"9D"  => OUTPUT <= x"75";
			WHEN x"9E"  => OUTPUT <= x"DF";
			WHEN x"9F"  => OUTPUT <= x"6E";
			WHEN x"A0"  => OUTPUT <= x"47";
			WHEN x"A1"  => OUTPUT <= x"F1";
			WHEN x"A2"  => OUTPUT <= x"1A";
			WHEN x"A3"  => OUTPUT <= x"71";
			WHEN x"A4"  => OUTPUT <= x"1D";
			WHEN x"A5"  => OUTPUT <= x"29";
			WHEN x"A6"  => OUTPUT <= x"C5";
			WHEN x"A7"  => OUTPUT <= x"89";
			WHEN x"A8"  => OUTPUT <= x"6F";
			WHEN x"A9"  => OUTPUT <= x"B7";
			WHEN x"AA"  => OUTPUT <= x"62";
			WHEN x"AB"  => OUTPUT <= x"0E";
			WHEN x"AC"  => OUTPUT <= x"AA";
			WHEN x"AD"  => OUTPUT <= x"18";
			WHEN x"AE"  => OUTPUT <= x"BE";
			WHEN x"AF"  => OUTPUT <= x"1B";
			WHEN x"B0"  => OUTPUT <= x"FC";
			WHEN x"B1"  => OUTPUT <= x"56";
			WHEN x"B2"  => OUTPUT <= x"3E";
			WHEN x"B3"  => OUTPUT <= x"4B";
			WHEN x"B4"  => OUTPUT <= x"C6";
			WHEN x"B5"  => OUTPUT <= x"D2";
			WHEN x"B6"  => OUTPUT <= x"79";
			WHEN x"B7"  => OUTPUT <= x"20";
			WHEN x"B8"  => OUTPUT <= x"9A";
			WHEN x"B9"  => OUTPUT <= x"DB";
			WHEN x"BA"  => OUTPUT <= x"C0";
			WHEN x"BB"  => OUTPUT <= x"FE";
			WHEN x"BC"  => OUTPUT <= x"78";
			WHEN x"BD"  => OUTPUT <= x"CD";
			WHEN x"BE"  => OUTPUT <= x"5A";
			WHEN x"BF"  => OUTPUT <= x"F4";
			WHEN x"C0"  => OUTPUT <= x"1F";
			WHEN x"C1"  => OUTPUT <= x"DD";
			WHEN x"C2"  => OUTPUT <= x"A8";
			WHEN x"C3"  => OUTPUT <= x"33";
			WHEN x"C4"  => OUTPUT <= x"88";
			WHEN x"C5"  => OUTPUT <= x"07";
			WHEN x"C6"  => OUTPUT <= x"C7";
			WHEN x"C7"  => OUTPUT <= x"31";
			WHEN x"C8"  => OUTPUT <= x"B1";
			WHEN x"C9"  => OUTPUT <= x"12";
			WHEN x"CA"  => OUTPUT <= x"10";
			WHEN x"CB"  => OUTPUT <= x"59";
			WHEN x"CC"  => OUTPUT <= x"27";
			WHEN x"CD"  => OUTPUT <= x"80";
			WHEN x"CE"  => OUTPUT <= x"EC";
			WHEN x"CF"  => OUTPUT <= x"5F";
			WHEN x"D0"  => OUTPUT <= x"60";
			WHEN x"D1"  => OUTPUT <= x"51";
			WHEN x"D2"  => OUTPUT <= x"7F";
			WHEN x"D3"  => OUTPUT <= x"A9";
			WHEN x"D4"  => OUTPUT <= x"19";
			WHEN x"D5"  => OUTPUT <= x"B5";
			WHEN x"D6"  => OUTPUT <= x"4A";
			WHEN x"D7"  => OUTPUT <= x"0D";
			WHEN x"D8"  => OUTPUT <= x"2D";
			WHEN x"D9"  => OUTPUT <= x"E5";
			WHEN x"DA"  => OUTPUT <= x"7A";
			WHEN x"DB"  => OUTPUT <= x"9F";
			WHEN x"DC"  => OUTPUT <= x"93";
			WHEN x"DD"  => OUTPUT <= x"C9";
			WHEN x"DE"  => OUTPUT <= x"9C";
			WHEN x"DF"  => OUTPUT <= x"EF";
			WHEN x"E0"  => OUTPUT <= x"A0";
			WHEN x"E1"  => OUTPUT <= x"E0";
			WHEN x"E2"  => OUTPUT <= x"3B";
			WHEN x"E3"  => OUTPUT <= x"4D";
			WHEN x"E4"  => OUTPUT <= x"AE";
			WHEN x"E5"  => OUTPUT <= x"2A";
			WHEN x"E6"  => OUTPUT <= x"F5";
			WHEN x"E7"  => OUTPUT <= x"B0";
			WHEN x"E8"  => OUTPUT <= x"C8";
			WHEN x"E9"  => OUTPUT <= x"EB";
			WHEN x"EA"  => OUTPUT <= x"BB";
			WHEN x"EB"  => OUTPUT <= x"3C";
			WHEN x"EC"  => OUTPUT <= x"83";
			WHEN x"ED"  => OUTPUT <= x"53";
			WHEN x"EE"  => OUTPUT <= x"99";
			WHEN x"EF"  => OUTPUT <= x"61";
			WHEN x"F0"  => OUTPUT <= x"17";
			WHEN x"F1"  => OUTPUT <= x"2B";
			WHEN x"F2"  => OUTPUT <= x"04";
			WHEN x"F3"  => OUTPUT <= x"7E";
			WHEN x"F4"  => OUTPUT <= x"BA";
			WHEN x"F5"  => OUTPUT <= x"77";
			WHEN x"F6"  => OUTPUT <= x"D6";
			WHEN x"F7"  => OUTPUT <= x"26";
			WHEN x"F8"  => OUTPUT <= x"E1";
			WHEN x"F9"  => OUTPUT <= x"69";
			WHEN x"FA"  => OUTPUT <= x"14";
			WHEN x"FB"  => OUTPUT <= x"63";
			WHEN x"FC"  => OUTPUT <= x"55";
			WHEN x"FD"  => OUTPUT <= x"21";
			WHEN x"FE"  => OUTPUT <= x"0C";
			WHEN x"FF"  => OUTPUT <= x"7D";
			WHEN OTHERS => OUTPUT <= x"00";
        END CASE;
    END PROCESS;
end arch;