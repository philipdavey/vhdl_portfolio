# ====================================================================
# File Name     : run_decryption_tb.tcl
# Author        : Philip Davey
# Design Folder : AES
# Date          : February 2022
# --------------------------------------------------------------------
# Description   : Script used to compile all files required for
#               : decryption_tb.vhd. Runs simulation and imports decryption
#               : wave.do file.
#               :
#               :
# ====================================================================

# ############
#  RTL Files
# ############
vcom -2008 -work ../output/work ../../rtl/aes_pkg.vhd
vcom -2008 -work ../output/work ../../rtl/sbox_lut_rtl.vhd
vcom -2008 -work ../output/work ../../rtl/inv_sbox_lut_rtl.vhd
vcom -2008 +cover=bs -coverexcludedefault -work ../output/work ../../rtl/inv_sub_bytes_rtl.vhd
vcom -2008 +cover=bs -coverexcludedefault -work ../output/work ../../rtl/inv_shift_rows_rtl.vhd
vcom -2008 +cover=bs -coverexcludedefault -work ../output/work ../../rtl/inv_mix_columns_rtl.vhd
vcom -2008 +cover=bs -coverexcludedefault -work ../output/work ../../rtl/add_roundkey_rtl.vhd
vcom -2008 +cover=bs -coverexcludedefault -work ../output/work ../../rtl/inv_round_rtl.vhd
vcom -2008 +cover=bs -coverexcludedefault -work ../output/work ../../rtl/inv_final_round_rtl.vhd
vcom -2008 +cover=bs -coverexcludedefault -work ../output/work ../../rtl/key_schedule_rtl.vhd
vcom -2008 +cover=bs -coverexcludedefault -work ../output/work ../../rtl/decryption_rtl.vhd

# ############
#  Testbench
# ############

vcom -2008 -work ../output/work ../../../common/tb_pkg.vhd
vcom -2008 -work ../output/work ../src/decryption_tb.vhd

# ############
#  Start sim
# ############

vsim -voptargs=+acc ../output/work.decryption_tb
 
# ############
# Load wave file
# ############

do ../waves/decryption_tb_wave.do

# ############
# Save Transcript:
# ############

transcript file ../output/decryption_tb_transcript.txt

# ############
# Run:
# ############

log -r /*; run -all;

# ############
# Save Coverage:
# ############

coverage save -assert -directive -cvg -codeAll ../output/cov_decryption_tb.ucdb