# ====================================================================
# File Name     : aes_file_list.tcl
# Author        : Philip Davey
# Design Folder : AES
# Date          : February 2022
# --------------------------------------------------------------------
# Description   :
#               :
#               :
#               :
#               :
# ====================================================================

cd [get_property DIRECTORY [current_project]]

# ###################################
# Adding files:
# ###################################

# Packages:
add_files ../../../rtl/aes_pkg.vhd

# Look Up tables:
add_files ../../../rtl/sbox_lut_rtl.vhd
add_files ../../../rtl/inv_sbox_lut_rtl.vhd

# Key Schedule:
add_files ../../../rtl/key_schedule_rtl.vhd

# What is in the Round:
add_files ../../../rtl/sub_bytes_rtl.vhd
add_files ../../../rtl/shift_rows_rtl.vhd
add_files ../../../rtl/mix_columns_rtl.vhd
add_files ../../../rtl/add_roundkey_rtl.vhd

# What is in the Inverse Round:
add_files ../../../rtl/inv_sub_bytes_rtl.vhd
add_files ../../../rtl/inv_shift_rows_rtl.vhd
add_files ../../../rtl/inv_mix_columns_rtl.vhd

# Rounds and Final Rounds:

add_files ../../../rtl/round_rtl.vhd
add_files ../../../rtl/final_round_rtl.vhd
add_files ../../../rtl/inv_round_rtl.vhd
add_files ../../../rtl/inv_final_round_rtl.vhd

# Top level Encryption/Decryption:
add_files ../../../rtl/encryption_rtl.vhd
add_files ../../../rtl/decryption_rtl.vhd

# ###################################
# Set Property of files to VHDL 2008:
# ###################################

set_property file_type {VHDL 2008} [get_files  ../../../rtl/aes_pkg.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/sbox_lut_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/inv_sbox_lut_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/key_schedule_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/sub_bytes_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/shift_rows_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/mix_columns_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/add_roundkey_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/inv_sub_bytes_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/inv_shift_rows_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/inv_mix_columns_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/round_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/final_round_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/inv_round_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/inv_final_round_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/encryption_rtl.vhd]
set_property file_type {VHDL 2008} [get_files  ../../../rtl/decryption_rtl.vhd]