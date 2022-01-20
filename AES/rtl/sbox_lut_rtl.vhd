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
            WHEN "00000000" => OUTPUT <= X"63";
			WHEN "00000001" => OUTPUT <= X"7C";
			WHEN "00000010" => OUTPUT <= X"77";
			WHEN "00000011" => OUTPUT <= X"7B";
			WHEN "00000100" => OUTPUT <= X"F2";
			WHEN "00000101" => OUTPUT <= X"6B";
			WHEN "00000110" => OUTPUT <= X"6F";
			WHEN "00000111" => OUTPUT <= X"C5";
			WHEN "00001000" => OUTPUT <= X"30";
			WHEN "00001001" => OUTPUT <= X"01";
			WHEN "00001010" => OUTPUT <= X"67";
			WHEN "00001011" => OUTPUT <= X"2B";
			WHEN "00001100" => OUTPUT <= X"FE";
			WHEN "00001101" => OUTPUT <= X"D7";
			WHEN "00001110" => OUTPUT <= X"AB";
			WHEN "00001111" => OUTPUT <= X"76";
			WHEN "00010000" => OUTPUT <= X"CA";
			WHEN "00010001" => OUTPUT <= X"82";
			WHEN "00010010" => OUTPUT <= X"C9";
			WHEN "00010011" => OUTPUT <= X"7D";
			WHEN "00010100" => OUTPUT <= X"FA";
			WHEN "00010101" => OUTPUT <= X"59";
			WHEN "00010110" => OUTPUT <= X"47";
			WHEN "00010111" => OUTPUT <= X"F0";
			WHEN "00011000" => OUTPUT <= X"AD";
			WHEN "00011001" => OUTPUT <= X"D4";
			WHEN "00011010" => OUTPUT <= X"A2";
			WHEN "00011011" => OUTPUT <= X"AF";
			WHEN "00011100" => OUTPUT <= X"9C";
			WHEN "00011101" => OUTPUT <= X"A4";
			WHEN "00011110" => OUTPUT <= X"72";
			WHEN "00011111" => OUTPUT <= X"C0";
			WHEN "00100000" => OUTPUT <= X"B7";
			WHEN "00100001" => OUTPUT <= X"FD";
			WHEN "00100010" => OUTPUT <= X"93";
			WHEN "00100011" => OUTPUT <= X"26";
			WHEN "00100100" => OUTPUT <= X"36";
			WHEN "00100101" => OUTPUT <= X"3F";
			WHEN "00100110" => OUTPUT <= X"F7";
			WHEN "00100111" => OUTPUT <= X"CC";
			WHEN "00101000" => OUTPUT <= X"34";
			WHEN "00101001" => OUTPUT <= X"A5";
			WHEN "00101010" => OUTPUT <= X"E5";
			WHEN "00101011" => OUTPUT <= X"F1";
			WHEN "00101100" => OUTPUT <= X"71";
			WHEN "00101101" => OUTPUT <= X"D8";
			WHEN "00101110" => OUTPUT <= X"31";
			WHEN "00101111" => OUTPUT <= X"15";
			WHEN "00110000" => OUTPUT <= X"04";
			WHEN "00110001" => OUTPUT <= X"C7";
			WHEN "00110010" => OUTPUT <= X"23";
			WHEN "00110011" => OUTPUT <= X"C3";
			WHEN "00110100" => OUTPUT <= X"18";
			WHEN "00110101" => OUTPUT <= X"96";				
			WHEN "00110110" => OUTPUT <= X"05";
			WHEN "00110111" => OUTPUT <= X"9A";
			WHEN "00111000" => OUTPUT <= X"07";
			WHEN "00111001" => OUTPUT <= X"12";
			WHEN "00111010" => OUTPUT <= X"80";
			WHEN "00111011" => OUTPUT <= X"E2";
			WHEN "00111100" => OUTPUT <= X"EB";
			WHEN "00111101" => OUTPUT <= X"27";
			WHEN "00111110" => OUTPUT <= X"B2";
			WHEN "00111111" => OUTPUT <= X"75";
			WHEN "01000000" => OUTPUT <= X"09";
			WHEN "01000001" => OUTPUT <= X"83";
			WHEN "01000010" => OUTPUT <= X"2C";
			WHEN "01000011" => OUTPUT <= X"1A";
			WHEN "01000100" => OUTPUT <= X"1B";
			WHEN "01000101" => OUTPUT <= X"6E";
			WHEN "01000110" => OUTPUT <= X"5A";
            WHEN "01000111" => OUTPUT <= X"A0";
			WHEN "01001000" => OUTPUT <= X"52";
			WHEN "01001001" => OUTPUT <= X"3B";
			WHEN "01001010" => OUTPUT <= X"D6";
			WHEN "01001011" => OUTPUT <= X"B3";
			WHEN "01001100" => OUTPUT <= X"29";
			WHEN "01001101" => OUTPUT <= X"E3";
			WHEN "01001110" => OUTPUT <= X"2F";
		    WHEN "01001111" => OUTPUT <= X"84";
			WHEN "01010000" => OUTPUT <= X"53";
			WHEN "01010001" => OUTPUT <= X"D1";
			WHEN "01010010" => OUTPUT <= X"00";
			WHEN "01010011" => OUTPUT <= X"ED";
			WHEN "01010100" => OUTPUT <= X"20";
			WHEN "01010101" => OUTPUT <= X"FC";
			WHEN "01010110" => OUTPUT <= X"B1";
			WHEN "01010111" => OUTPUT <= X"5B";
			WHEN "01011000" => OUTPUT <= X"6A";
			WHEN "01011001" => OUTPUT <= X"CB";
			WHEN "01011010" => OUTPUT <= X"BE";
			WHEN "01011011" => OUTPUT <= X"39";
			WHEN "01011100" => OUTPUT <= X"4A";
			WHEN "01011101" => OUTPUT <= X"4C";
			WHEN "01011110" => OUTPUT <= X"58";
			WHEN "01011111" => OUTPUT <= X"CF";
			WHEN "01100000" => OUTPUT <= X"D0";
			WHEN "01100001" => OUTPUT <= X"EF";
			WHEN "01100010" => OUTPUT <= X"AA";
			WHEN "01100011" => OUTPUT <= X"FB";
			WHEN "01100100" => OUTPUT <= X"43";
			WHEN "01100101" => OUTPUT <= X"4D";
			WHEN "01100110" => OUTPUT <= X"33";
			WHEN "01100111" => OUTPUT <= X"85";
			WHEN "01101000" => OUTPUT <= X"45";
			WHEN "01101001" => OUTPUT <= X"F9";
		    WHEN "01101010" => OUTPUT <= X"02";
			WHEN "01101011" => OUTPUT <= X"7F";
			WHEN "01101100" => OUTPUT <= X"50";
			WHEN "01101101" => OUTPUT <= X"3C";
			WHEN "01101110" => OUTPUT <= X"9F";
			WHEN "01101111" => OUTPUT <= X"A8";
			WHEN "01110000" => OUTPUT <= X"51";
			WHEN "01110001" => OUTPUT <= X"A3";
			WHEN "01110010" => OUTPUT <= X"40";
			WHEN "01110011" => OUTPUT <= X"8F";
			WHEN "01110100" => OUTPUT <= X"92";
			WHEN "01110101" => OUTPUT <= X"9D";
			WHEN "01110110" => OUTPUT <= X"38";
		    WHEN "01110111" => OUTPUT <= X"F5";
			WHEN "01111000" => OUTPUT <= X"BC";
			WHEN "01111001" => OUTPUT <= X"B6";
			WHEN "01111010" => OUTPUT <= X"DA";
			WHEN "01111011" => OUTPUT <= X"21";
			WHEN "01111100" => OUTPUT <= X"10";
			WHEN "01111101" => OUTPUT <= X"FF";
			WHEN "01111110" => OUTPUT <= X"F3";
			WHEN "01111111" => OUTPUT <= X"D2";
			WHEN "10000000" => OUTPUT <= X"CD";
			WHEN "10000001" => OUTPUT <= X"0C";
			WHEN "10000010" => OUTPUT <= X"13";
			WHEN "10000011" => OUTPUT <= X"EC";
			WHEN "10000100" => OUTPUT <= X"5F";
			WHEN "10000101" => OUTPUT <= X"97";
			WHEN "10000110" => OUTPUT <= X"44";
			WHEN "10000111" => OUTPUT <= X"17";
			WHEN "10001000" => OUTPUT <= X"C4";
			WHEN "10001001" => OUTPUT <= X"A7";
			WHEN "10001010" => OUTPUT <= X"7E";
			WHEN "10001011" => OUTPUT <= X"3D";
			WHEN "10001100" => OUTPUT <= X"64";
			WHEN "10001101" => OUTPUT <= X"5D";
			WHEN "10001110" => OUTPUT <= X"19";
			WHEN "10001111" => OUTPUT <= X"73";
			WHEN "10010000" => OUTPUT <= X"60";
			WHEN "10010001" => OUTPUT <= X"81";
			WHEN "10010010" => OUTPUT <= X"4F";
			WHEN "10010011" => OUTPUT <= X"DC";
			WHEN "10010100" => OUTPUT <= X"22";
			WHEN "10010101" => OUTPUT <= X"2A";
			WHEN "10010110" => OUTPUT <= X"90";
			WHEN "10010111" => OUTPUT <= X"88";
			WHEN "10011000" => OUTPUT <= X"46";
			WHEN "10011001" => OUTPUT <= X"EE";
			WHEN "10011010" => OUTPUT <= X"B8";
			WHEN "10011011" => OUTPUT <= X"14";
			WHEN "10011100" => OUTPUT <= X"DE";
			WHEN "10011101" => OUTPUT <= X"5E";
			WHEN "10011110" => OUTPUT <= X"0B";
			WHEN "10011111" => OUTPUT <= X"DB";
			WHEN "10100000" => OUTPUT <= X"E0";
			WHEN "10100001" => OUTPUT <= X"32";
			WHEN "10100010" => OUTPUT <= X"3A";
			WHEN "10100011" => OUTPUT <= X"0A";
			WHEN "10100100" => OUTPUT <= X"49";
			WHEN "10100101" => OUTPUT <= X"06";
			WHEN "10100110" => OUTPUT <= X"24";
			WHEN "10100111" => OUTPUT <= X"5C";
			WHEN "10101000" => OUTPUT <= X"C2";
			WHEN "10101001" => OUTPUT <= X"D3";
			WHEN "10101010" => OUTPUT <= X"AC";
			WHEN "10101011" => OUTPUT <= X"62";
			WHEN "10101100" => OUTPUT <= X"91";
			WHEN "10101101" => OUTPUT <= X"95";
			WHEN "10101110" => OUTPUT <= X"E4";
			WHEN "10101111" => OUTPUT <= X"79";
			WHEN "10110000" => OUTPUT <= X"E7";
			WHEN "10110001" => OUTPUT <= X"C8";
			WHEN "10110010" => OUTPUT <= X"37";
			WHEN "10110011" => OUTPUT <= X"6D";
			WHEN "10110100" => OUTPUT <= X"8D";
			WHEN "10110101" => OUTPUT <= X"D5";
			WHEN "10110110" => OUTPUT <= X"4E";
			WHEN "10110111" => OUTPUT <= X"A9";
			WHEN "10111000" => OUTPUT <= X"6C";
			WHEN "10111001" => OUTPUT <= X"56";
			WHEN "10111010" => OUTPUT <= X"F4";
			WHEN "10111011" => OUTPUT <= X"EA";
			WHEN "10111100" => OUTPUT <= X"65";
			WHEN "10111101" => OUTPUT <= X"7A";
			WHEN "10111110" => OUTPUT <= X"AE";
			WHEN "10111111" => OUTPUT <= X"08";
			WHEN "11000000" => OUTPUT <= X"BA";
			WHEN "11000001" => OUTPUT <= X"78";
			WHEN "11000010" => OUTPUT <= X"25";
			WHEN "11000011" => OUTPUT <= X"2E";
			WHEN "11000100" => OUTPUT <= X"1C";
			WHEN "11000101" => OUTPUT <= X"A6";
			WHEN "11000110" => OUTPUT <= X"B4";
			WHEN "11000111" => OUTPUT <= X"C6";
			WHEN "11001000" => OUTPUT <= X"E8";
			WHEN "11001001" => OUTPUT <= X"DD";
			WHEN "11001010" => OUTPUT <= X"74";
			WHEN "11001011" => OUTPUT <= X"1F";
			WHEN "11001100" => OUTPUT <= X"4B";
			WHEN "11001101" => OUTPUT <= X"BD";
			WHEN "11001110" => OUTPUT <= X"8B";
			WHEN "11001111" => OUTPUT <= X"8A";
			WHEN "11010000" => OUTPUT <= X"70";
			WHEN "11010001" => OUTPUT <= X"3E";
			WHEN "11010010" => OUTPUT <= X"B5";
			WHEN "11010011" => OUTPUT <= X"66";
			WHEN "11010100" => OUTPUT <= X"48";
			WHEN "11010101" => OUTPUT <= X"03";
			WHEN "11010110" => OUTPUT <= X"F6";
		    WHEN "11010111" => OUTPUT <= X"0E";
			WHEN "11011000" => OUTPUT <= X"61";
			WHEN "11011001" => OUTPUT <= X"35";
			WHEN "11011010" => OUTPUT <= X"57";
			WHEN "11011011" => OUTPUT <= X"B9";
			WHEN "11011100" => OUTPUT <= X"86";
			WHEN "11011101" => OUTPUT <= X"C1";
			WHEN "11011110" => OUTPUT <= X"1D";
			WHEN "11011111" => OUTPUT <= X"9E";
			WHEN "11100000" => OUTPUT <= X"E1";
			WHEN "11100001" => OUTPUT <= X"F8";
			WHEN "11100010" => OUTPUT <= X"98";
			WHEN "11100011" => OUTPUT <= X"11";
			WHEN "11100100" => OUTPUT <= X"69";
			WHEN "11100101" => OUTPUT <= X"D9";
			WHEN "11100110" => OUTPUT <= X"8E";
			WHEN "11100111" => OUTPUT <= X"94";
			WHEN "11101000" => OUTPUT <= X"9B";
			WHEN "11101001" => OUTPUT <= X"1E";
			WHEN "11101010" => OUTPUT <= X"87";
			WHEN "11101011" => OUTPUT <= X"E9";
			WHEN "11101100" => OUTPUT <= X"CE";
			WHEN "11101101" => OUTPUT <= X"55";
			WHEN "11101110" => OUTPUT <= X"28";
			WHEN "11101111" => OUTPUT <= X"DF";
			WHEN "11110000" => OUTPUT <= X"8C";
			WHEN "11110001" => OUTPUT <= X"A1";
			WHEN "11110010" => OUTPUT <= X"89";
			WHEN "11110011" => OUTPUT <= X"0D";
			WHEN "11110100" => OUTPUT <= X"BF";
			WHEN "11110101" => OUTPUT <= X"E6";
			WHEN "11110110" => OUTPUT <= X"42";
			WHEN "11110111" => OUTPUT <= X"68";
			WHEN "11111000" => OUTPUT <= X"41";
			WHEN "11111001" => OUTPUT <= X"99";
			WHEN "11111010" => OUTPUT <= X"2D";
			WHEN "11111011" => OUTPUT <= X"0F";
			WHEN "11111100" => OUTPUT <= X"B0";
			WHEN "11111101" => OUTPUT <= X"54";
			WHEN "11111110" => OUTPUT <= X"BB";
			WHEN "11111111" => OUTPUT <= X"16";
			WHEN OTHERS     => OUTPUT <= X"00";
        END CASE;
    END PROCESS;
end Behavioral;