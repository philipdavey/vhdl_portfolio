# ====================================================================
# File Name     : encryption_tb_run.tcl
# Author        : Philip Davey
# Design Folder : AES
# Date          : February 2022
# --------------------------------------------------------------------
# Description   : Script used to compile all files required for
#               : encryption_tb.vhd. Runs simulation and imports encryption
#               : wave.do file.
#               :
# ====================================================================

# ############
#  RTL Files
# ############
vcom -2008 +cover -work ../output/work ../../rtl/aes_pkg.vhd
vcom -2008 +cover -work ../output/work ../../rtl/sbox_lut_rtl.vhd
vcom -2008 +cover -work ../output/work ../../rtl/sub_bytes_rtl.vhd
vcom -2008 +cover -work ../output/work ../../rtl/shift_rows_rtl.vhd
vcom -2008 +cover -work ../output/work ../../rtl/mix_columns_rtl.vhd
vcom -2008 +cover -work ../output/work ../../rtl/add_roundkey_rtl.vhd
vcom -2008 +cover -work ../output/work ../../rtl/round_rtl.vhd
vcom -2008 +cover -work ../output/work ../../rtl/final_round_rtl.vhd
vcom -2008 +cover -work ../output/work ../../rtl/key_schedule_rtl.vhd
vcom -2008 +cover -work ../output/work ../../rtl/encryption_rtl.vhd

# ############
#  Testbench
# ############

vcom -2008 -work ../output/work ../../../common/tb_pkg.vhd
vcom -2008 +cover -work ../output/work ../src/encryption_tb.vhd

# ############
#  Start sim
# ############

vsim -voptargs=+acc ../output/work.encryption_tb
 
# ############
# Load wave file
# ############

do ../waves/encryption_tb_wave.do

run -all