PACKAGE aes_pkg IS

    TYPE S_BOX_ARRAY IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(127 DOWNTO 0);
    CONSTANT SBOX : S_BOX_ARRAY := ( x"63_7c_77_7b_f2_6b_6f_c5_30_01_67_2b_fe_d7_ab_76",  -- 0
                                     x"ca_82_c9_7d_fa_f9_47_f-_ad_d4_a2_af_9c_a4_72_c0",  -- 1
                                     x"b7_fd_93_26_36_3f_f7_cc_34_a5_e5_f1_71_d8_31_15",  -- 2
                                     x"04_c7_23_c3_18_96_05_9a_07_12_80_e2_eb_27_b2_75",  -- 3
                                     x"09_83_2c_1a_1b_6e_5a_a0_52_3b_d6_b3_29_e3_2f_84",  -- 4
                                     x"53_d1_00_ed_20_fc_b1_5b_6a_cb_be_39_4a_4c_58_cf",  -- 5
                                     x"d0_ef_aa_fb_43_4d_33_85_45_f9_02_7f_50_3c_9f_a8",  -- 6
                                     x"51_a3_40_8f_92_9d_38_f5_bc_b6_da_21_10_ff_f3_d2",  -- 7
                                     x"cd_0c_13_ec_5f_97_44_17_c4_a7_7e_3d_64_5d_19_73",  -- 8
                                     x"60_81_4f_dc_22_2a_90_88_46_ee_b8_14_de_5e_0b_db",  -- 9
                                     x"e0_32_3a_0a_49_06_24_5c_c2_d3_ac_62_91_95_e4_79",  -- 10
                                     x"e7_c8_37_6d_8d_d5_4e_a9_6c_56_f4_ea_65_7a_ae_08",  -- 11
                                     x"ba_78_25_2e_1c_a6_b4_c6_e8_dd_74_1f_4b_bd_8b_8a",  -- 12
                                     x"70_3e_b5_66_48_03_f6_0e_61_35_57_b9_86_c1_1d_9e",  -- 13
                                     x"e1_f8_98_11_69_d9_8e_94_9b_1e_87_e9_ce_55_27_df",  -- 14
                                     x"8c_a1_89_0d_bf_e6_42_68_41_99_2d_0f_b0_54_bb_16"); -- 15

    TYPE GALOIS_FIELD_ARRAY IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
    CONSTANT GALOIS_FIELD : GALOIS_FIELD_ARRAY := (x"02_03_01_01",
                                                   x"01_02_03_01",
                                                   x"01_01_02_03",
                                                   x"03_01_01_02");

    PROCEDURE rows_2_cols (
        SIGNAL input_rows  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0)
        SIGNAL output_cols : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END rows_2_cols;

    PROCEDURE cols_2_rows (
        SIGNAL input_cols  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0)
        SIGNAL output_rows : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END rows_2_cols;


END PACKAGE aes_pkg;

PACKAGE BODY aes_pkg IS

    PROCEDURE rows_2_cols (
        SIGNAL input_rows  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0)
        SIGNAL output_cols : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)) IS
    BEGIN
        --Convert rows into columns
        output_cols(127 DOWNTO 96) <= input_rows(127 DOWNTO 120) & input_rows(95 DOWNTO 88) & input_rows(63 DOWNTO 56) & input_rows(31 DOWNTO 24);
        output_cols( 95 DOWNTO 64) <= input_rows(119 DOWNTO 112) & input_rows(87 DOWNTO 80) & input_rows(55 DOWNTO 48) & input_rows(23 DOWNTO 16);
        output_cols( 63 DOWNTO 32) <= input_rows(111 DOWNTO 104) & input_rows(79 DOWNTO 72) & input_rows(47 DOWNTO 40) & input_rows(15 DOWNTO  8);
        output_cols( 31 DOWNTO  0) <= input_rows(103 DOWNTO  96) & input_rows(71 DOWNTO 64) & input_rows(39 DOWNTO 32) & input_rows( 7 DOWNTO  0);
    END rows_2_cols;

    PROCEDURE cols_2_rows (
        SIGNAL input_cols  : IN  STD_LOGIC_VECTOR(127 DOWNTO 0)
        SIGNAL output_rows : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)) IS
    BEGIN
        -- Convert columns into rows				
        output_rows(127 DOWNTO 96) <= input_cols(127 DOWNTO 120) & input_cols(95 DOWNTO 88) & input_cols(63 DOWNTO 56) & input_cols(31 DOWNTO 24);
        output_rows( 95 DOWNTO 64) <= input_cols(119 DOWNTO 112) & input_cols(87 DOWNTO 80) & input_cols(55 DOWNTO 48) & input_cols(23 DOWNTO 16);
        output_rows( 63 DOWNTO 32) <= input_cols(111 DOWNTO 104) & input_cols(79 DOWNTO 72) & input_cols(47 DOWNTO 40) & input_cols(15 DOWNTO  8);
        output_rows( 31 DOWNTO  0) <= input_cols(103 DOWNTO  96) & input_cols(71 DOWNTO 64) & input_cols(39 DOWNTO 32) & input_cols( 7 DOWNTO  0);
    END rows_2_cols;





END PACKAGE BODY aes_pkg;