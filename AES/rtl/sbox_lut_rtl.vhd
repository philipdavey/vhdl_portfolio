

-- Sbox Table:
-- x"63_7C_77_7B_F2_6B_6F_C5_30_01_67_2B_FE_D7_AB_76",  -- 0
-- x"CA_82_C9_7D_FA_F9_47_F-_AD_D4_A2_AF_9C_A4_72_C0",  -- 1
-- x"B7_FD_93_26_36_3F_F7_CC_34_A5_E5_F1_71_D8_31_15",  -- 2
-- x"04_C7_23_C3_18_96_05_9A_07_12_80_E2_EB_27_B2_75",  -- 3
-- x"09_83_2C_1A_1B_6E_5A_A0_52_3B_D6_B3_29_E3_2F_84",  -- 4
-- x"53_D1_00_ED_20_FC_B1_5B_6A_CB_BE_39_4A_4C_58_CF",  -- 5
-- x"D0_EF_AA_FB_43_4D_33_85_45_F9_02_7F_50_3C_9F_A8",  -- 6
-- x"51_A3_40_8F_92_9D_38_F5_BC_B6_DA_21_10_FF_F3_D2",  -- 7
-- x"CD_0C_13_EC_5F_97_44_17_C4_A7_7E_3D_64_5D_19_73",  -- 8
-- x"60_81_4F_DC_22_2A_90_88_46_EE_B8_14_DE_5E_0B_DB",  -- 9
-- x"E0_32_3A_0A_49_06_24_5C_C2_D3_AC_62_91_95_E4_79",  -- 10
-- x"E7_C8_37_6D_8D_D5_4E_A9_6C_56_F4_EA_65_7A_AE_08",  -- 11
-- x"BA_78_25_2E_1C_A6_B4_C6_E8_DD_74_1F_4B_BD_8B_8A",  -- 12
-- x"70_3E_B5_66_48_03_F6_0E_61_35_57_B9_86_C1_1D_9E",  -- 13
-- x"E1_F8_98_11_69_D9_8E_94_9B_1E_87_E9_CE_55_27_DF",  -- 14
-- x"8C_A1_89_0D_BF_E6_42_68_41_99_2D_0F_B0_54_BB_16"   -- 15


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sbox_lut IS
    PORT(
        INPUT  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        OUTPUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END sbox_lut;

ARCHITECTURE arch of sbox_lut IS

BEGIN
    PROCESS(INPUT)	
    BEGIN
        CASE INPUT IS
            WHEN x"00"  => OUTPUT <= x"63";
			WHEN x"01"  => OUTPUT <= x"7C";
			WHEN x"02"  => OUTPUT <= x"77";
			WHEN x"03"  => OUTPUT <= x"7B";
			WHEN x"04"  => OUTPUT <= x"F2";
			WHEN x"05"  => OUTPUT <= x"6B";
			WHEN x"06"  => OUTPUT <= x"6F";
			WHEN x"07"  => OUTPUT <= x"C5";
			WHEN x"08"  => OUTPUT <= x"30";
			WHEN x"09"  => OUTPUT <= x"01";
			WHEN x"0A"  => OUTPUT <= x"67";
			WHEN x"0B"  => OUTPUT <= x"2B";
			WHEN x"0C"  => OUTPUT <= x"FE";
			WHEN x"0D"  => OUTPUT <= x"D7";
			WHEN x"0E"  => OUTPUT <= x"AB";
			WHEN x"0F"  => OUTPUT <= x"76";
			WHEN x"10"  => OUTPUT <= x"CA";
			WHEN x"11"  => OUTPUT <= x"82";
			WHEN x"12"  => OUTPUT <= x"C9";
			WHEN x"13"  => OUTPUT <= x"7D";
			WHEN x"14"  => OUTPUT <= x"FA";
			WHEN x"15"  => OUTPUT <= x"59";
			WHEN x"16"  => OUTPUT <= x"47";
			WHEN x"17"  => OUTPUT <= x"F0";
			WHEN x"18"  => OUTPUT <= x"AD";
			WHEN x"19"  => OUTPUT <= x"D4";
			WHEN x"1A"  => OUTPUT <= x"A2";
			WHEN x"1B"  => OUTPUT <= x"AF";
			WHEN x"1C"  => OUTPUT <= x"9C";
			WHEN x"1D"  => OUTPUT <= x"A4";
			WHEN x"1E"  => OUTPUT <= x"72";
			WHEN x"1F"  => OUTPUT <= x"C0";
			WHEN x"20"  => OUTPUT <= x"B7";
			WHEN x"21"  => OUTPUT <= x"FD";
			WHEN x"22"  => OUTPUT <= x"93";
			WHEN x"23"  => OUTPUT <= x"26";
			WHEN x"24"  => OUTPUT <= x"36";
			WHEN x"25"  => OUTPUT <= x"3F";
			WHEN x"26"  => OUTPUT <= x"F7";
			WHEN x"27"  => OUTPUT <= x"CC";
			WHEN x"28"  => OUTPUT <= x"34";
			WHEN x"29"  => OUTPUT <= x"A5";
			WHEN x"2A"  => OUTPUT <= x"E5";
			WHEN x"2B"  => OUTPUT <= x"F1";
			WHEN x"2C"  => OUTPUT <= x"71";
			WHEN x"2D"  => OUTPUT <= x"D8";
			WHEN x"2E"  => OUTPUT <= x"31";
			WHEN x"2F"  => OUTPUT <= x"15";
			WHEN x"30"  => OUTPUT <= x"04";
			WHEN x"31"  => OUTPUT <= x"C7";
			WHEN x"32"  => OUTPUT <= x"23";
			WHEN x"33"  => OUTPUT <= x"C3";
			WHEN x"34"  => OUTPUT <= x"18";
			WHEN x"35"  => OUTPUT <= x"96";				
			WHEN x"36"  => OUTPUT <= x"05";
			WHEN x"37"  => OUTPUT <= x"9A";
			WHEN x"38"  => OUTPUT <= x"07";
			WHEN x"39"  => OUTPUT <= x"12";
			WHEN x"3A"  => OUTPUT <= x"80";
			WHEN x"3B"  => OUTPUT <= x"E2";
			WHEN x"3C"  => OUTPUT <= x"EB";
			WHEN x"3D"  => OUTPUT <= x"27";
			WHEN x"3E"  => OUTPUT <= x"B2";
			WHEN x"3F"  => OUTPUT <= x"75";
			WHEN x"40"  => OUTPUT <= x"09";
			WHEN x"41"  => OUTPUT <= x"83";
			WHEN x"42"  => OUTPUT <= x"2C";
			WHEN x"43"  => OUTPUT <= x"1A";
			WHEN x"44"  => OUTPUT <= x"1B";
			WHEN x"45"  => OUTPUT <= x"6E";
			WHEN x"46"  => OUTPUT <= x"5A";
            WHEN x"47"  => OUTPUT <= x"A0";
			WHEN x"48"  => OUTPUT <= x"52";
			WHEN x"49"  => OUTPUT <= x"3B";
			WHEN x"4A"  => OUTPUT <= x"D6";
			WHEN x"4B"  => OUTPUT <= x"B3";
			WHEN x"4C"  => OUTPUT <= x"29";
			WHEN x"4D"  => OUTPUT <= x"E3";
			WHEN x"4E"  => OUTPUT <= x"2F";
		    WHEN x"4F"  => OUTPUT <= x"84";
			WHEN x"50"  => OUTPUT <= x"53";
			WHEN x"51"  => OUTPUT <= x"D1";
			WHEN x"52"  => OUTPUT <= x"00";
			WHEN x"53"  => OUTPUT <= x"ED";
			WHEN x"54"  => OUTPUT <= x"20";
			WHEN x"55"  => OUTPUT <= x"FC";
			WHEN x"56"  => OUTPUT <= x"B1";
			WHEN x"57"  => OUTPUT <= x"5B";
			WHEN x"58"  => OUTPUT <= x"6A";
			WHEN x"59"  => OUTPUT <= x"CB";
			WHEN x"5A"  => OUTPUT <= x"BE";
			WHEN x"5B"  => OUTPUT <= x"39";
			WHEN x"5C"  => OUTPUT <= x"4A";
			WHEN x"5D"  => OUTPUT <= x"4C";
			WHEN x"5E"  => OUTPUT <= x"58";
			WHEN x"5F"  => OUTPUT <= x"CF";
			WHEN x"60"  => OUTPUT <= x"D0";
			WHEN x"61"  => OUTPUT <= x"EF";
			WHEN x"62"  => OUTPUT <= x"AA";
			WHEN x"63"  => OUTPUT <= x"FB";
			WHEN x"64"  => OUTPUT <= x"43";
			WHEN x"65"  => OUTPUT <= x"4D";
			WHEN x"66"  => OUTPUT <= x"33";
			WHEN x"67"  => OUTPUT <= x"85";
			WHEN x"68"  => OUTPUT <= x"45";
			WHEN x"69"  => OUTPUT <= x"F9";
		    WHEN x"6A"  => OUTPUT <= x"02";
			WHEN x"6B"  => OUTPUT <= x"7F";
			WHEN x"6C"  => OUTPUT <= x"50";
			WHEN x"6D"  => OUTPUT <= x"3C";
			WHEN x"6E"  => OUTPUT <= x"9F";
			WHEN x"6F"  => OUTPUT <= x"A8";
			WHEN x"70"  => OUTPUT <= x"51";
			WHEN x"71"  => OUTPUT <= x"A3";
			WHEN x"72"  => OUTPUT <= x"40";
			WHEN x"73"  => OUTPUT <= x"8F";
			WHEN x"74"  => OUTPUT <= x"92";
			WHEN x"75"  => OUTPUT <= x"9D";
			WHEN x"76"  => OUTPUT <= x"38";
		    WHEN x"77"  => OUTPUT <= x"F5";
			WHEN x"78"  => OUTPUT <= x"BC";
			WHEN x"79"  => OUTPUT <= x"B6";
			WHEN x"7A"  => OUTPUT <= x"DA";
			WHEN x"7B"  => OUTPUT <= x"21";
			WHEN x"7C"  => OUTPUT <= x"10";
			WHEN x"7D"  => OUTPUT <= x"FF";
			WHEN x"7E"  => OUTPUT <= x"F3";
			WHEN x"7F"  => OUTPUT <= x"D2";
			WHEN x"80"  => OUTPUT <= x"CD";
			WHEN x"81"  => OUTPUT <= x"0C";
			WHEN x"82"  => OUTPUT <= x"13";
			WHEN x"83"  => OUTPUT <= x"EC";
			WHEN x"84"  => OUTPUT <= x"5F";
			WHEN x"85"  => OUTPUT <= x"97";
			WHEN x"86"  => OUTPUT <= x"44";
			WHEN x"87"  => OUTPUT <= x"17";
			WHEN x"88"  => OUTPUT <= x"C4";
			WHEN x"89"  => OUTPUT <= x"A7";
			WHEN x"8A"  => OUTPUT <= x"7E";
			WHEN x"8B"  => OUTPUT <= x"3D";
			WHEN x"8C"  => OUTPUT <= x"64";
			WHEN x"8D"  => OUTPUT <= x"5D";
			WHEN x"8E"  => OUTPUT <= x"19";
			WHEN x"8F"  => OUTPUT <= x"73";
			WHEN x"90"  => OUTPUT <= x"60";
			WHEN x"91"  => OUTPUT <= x"81";
			WHEN x"92"  => OUTPUT <= x"4F";
			WHEN x"93"  => OUTPUT <= x"DC";
			WHEN x"94"  => OUTPUT <= x"22";
			WHEN x"95"  => OUTPUT <= x"2A";
			WHEN x"96"  => OUTPUT <= x"90";
			WHEN x"97"  => OUTPUT <= x"88";
			WHEN x"98"  => OUTPUT <= x"46";
			WHEN x"99"  => OUTPUT <= x"EE";
			WHEN x"9A"  => OUTPUT <= x"B8";
			WHEN x"9B"  => OUTPUT <= x"14";
			WHEN x"9C"  => OUTPUT <= x"DE";
			WHEN x"9D"  => OUTPUT <= x"5E";
			WHEN x"9E"  => OUTPUT <= x"0B";
			WHEN x"9F"  => OUTPUT <= x"DB";
			WHEN x"A0"  => OUTPUT <= x"E0";
			WHEN x"A1"  => OUTPUT <= x"32";
			WHEN x"A2"  => OUTPUT <= x"3A";
			WHEN x"A3"  => OUTPUT <= x"0A";
			WHEN x"A4"  => OUTPUT <= x"49";
			WHEN x"A5"  => OUTPUT <= x"06";
			WHEN x"A6"  => OUTPUT <= x"24";
			WHEN x"A7"  => OUTPUT <= x"5C";
			WHEN x"A8"  => OUTPUT <= x"C2";
			WHEN x"A9"  => OUTPUT <= x"D3";
			WHEN x"AA"  => OUTPUT <= x"AC";
			WHEN x"AB"  => OUTPUT <= x"62";
			WHEN x"AC"  => OUTPUT <= x"91";
			WHEN x"AD"  => OUTPUT <= x"95";
			WHEN x"AE"  => OUTPUT <= x"E4";
			WHEN x"AF"  => OUTPUT <= x"79";
			WHEN x"B0"  => OUTPUT <= x"E7";
			WHEN x"B1"  => OUTPUT <= x"C8";
			WHEN x"B2"  => OUTPUT <= x"37";
			WHEN x"B3"  => OUTPUT <= x"6D";
			WHEN x"B4"  => OUTPUT <= x"8D";
			WHEN x"B5"  => OUTPUT <= x"D5";
			WHEN x"B6"  => OUTPUT <= x"4E";
			WHEN x"B7"  => OUTPUT <= x"A9";
			WHEN x"B8"  => OUTPUT <= x"6C";
			WHEN x"B9"  => OUTPUT <= x"56";
			WHEN x"BA"  => OUTPUT <= x"F4";
			WHEN x"BB"  => OUTPUT <= x"EA";
			WHEN x"BC"  => OUTPUT <= x"65";
			WHEN x"BD"  => OUTPUT <= x"7A";
			WHEN x"BE"  => OUTPUT <= x"AE";
			WHEN x"BF"  => OUTPUT <= x"08";
			WHEN x"C0"  => OUTPUT <= x"BA";
			WHEN x"C1"  => OUTPUT <= x"78";
			WHEN x"C2"  => OUTPUT <= x"25";
			WHEN x"C3"  => OUTPUT <= x"2E";
			WHEN x"C4"  => OUTPUT <= x"1C";
			WHEN x"C5"  => OUTPUT <= x"A6";
			WHEN x"C6"  => OUTPUT <= x"B4";
			WHEN x"C7"  => OUTPUT <= x"C6";
			WHEN x"C8"  => OUTPUT <= x"E8";
			WHEN x"C9"  => OUTPUT <= x"DD";
			WHEN x"CA"  => OUTPUT <= x"74";
			WHEN x"CB"  => OUTPUT <= x"1F";
			WHEN x"CC"  => OUTPUT <= x"4B";
			WHEN x"CD"  => OUTPUT <= x"BD";
			WHEN x"CE"  => OUTPUT <= x"8B";
			WHEN x"CF"  => OUTPUT <= x"8A";
			WHEN x"D0"  => OUTPUT <= x"70";
			WHEN x"D1"  => OUTPUT <= x"3E";
			WHEN x"D2"  => OUTPUT <= x"B5";
			WHEN x"D3"  => OUTPUT <= x"66";
			WHEN x"D4"  => OUTPUT <= x"48";
			WHEN x"D5"  => OUTPUT <= x"03";
			WHEN x"D6"  => OUTPUT <= x"F6";
		    WHEN x"D7"  => OUTPUT <= x"0E";
			WHEN x"D8"  => OUTPUT <= x"61";
			WHEN x"D9"  => OUTPUT <= x"35";
			WHEN x"DA"  => OUTPUT <= x"57";
			WHEN x"DB"  => OUTPUT <= x"B9";
			WHEN x"DC"  => OUTPUT <= x"86";
			WHEN x"DD"  => OUTPUT <= x"C1";
			WHEN x"DE"  => OUTPUT <= x"1D";
			WHEN x"DF"  => OUTPUT <= x"9E";
			WHEN x"E0"  => OUTPUT <= x"E1";
			WHEN x"E1"  => OUTPUT <= x"F8";
			WHEN x"E2"  => OUTPUT <= x"98";
			WHEN x"E3"  => OUTPUT <= x"11";
			WHEN x"E4"  => OUTPUT <= x"69";
			WHEN x"E5"  => OUTPUT <= x"D9";
			WHEN x"E6"  => OUTPUT <= x"8E";
			WHEN x"E7"  => OUTPUT <= x"94";
			WHEN x"E8"  => OUTPUT <= x"9B";
			WHEN x"E9"  => OUTPUT <= x"1E";
			WHEN x"EA"  => OUTPUT <= x"87";
			WHEN x"EB"  => OUTPUT <= x"E9";
			WHEN x"EC"  => OUTPUT <= x"CE";
			WHEN x"ED"  => OUTPUT <= x"55";
			WHEN x"EE"  => OUTPUT <= x"28";
			WHEN x"EF"  => OUTPUT <= x"DF";
			WHEN x"F0"  => OUTPUT <= x"8C";
			WHEN x"F1"  => OUTPUT <= x"A1";
			WHEN x"F2"  => OUTPUT <= x"89";
			WHEN x"F3"  => OUTPUT <= x"0D";
			WHEN x"F4"  => OUTPUT <= x"BF";
			WHEN x"F5"  => OUTPUT <= x"E6";
			WHEN x"F6"  => OUTPUT <= x"42";
			WHEN x"F7"  => OUTPUT <= x"68";
			WHEN x"F8"  => OUTPUT <= x"41";
			WHEN x"F9"  => OUTPUT <= x"99";
			WHEN x"FA"  => OUTPUT <= x"2D";
			WHEN x"FB"  => OUTPUT <= x"0F";
			WHEN x"FC"  => OUTPUT <= x"B0";
			WHEN x"FD"  => OUTPUT <= x"54";
			WHEN x"FE"  => OUTPUT <= x"BB";
			WHEN x"FF"  => OUTPUT <= x"16";
			WHEN OTHERS => OUTPUT <= x"00";
        END CASE;
    END PROCESS;
end arch;