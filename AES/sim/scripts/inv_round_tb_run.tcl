# ====================================================================
# File Name     : inv_round_tb_run.tcl
# Author        : Philip Davey
# Design Folder : AES
# Date          : February 2022
# --------------------------------------------------------------------
# Description   : Script used to compile all files required for
#               : inv_round_tb.vhd. Runs simulation and imports inv_round
#               : wave.do file.
#               :
# ====================================================================

# ############
#  RTL Files
# ############
vcom -2008 -work ../output/work ../../rtl/aes_pkg.vhd
vcom -2008 -work ../output/work ../../rtl/inv_sbox_lut_rtl.vhd
vcom -2008 -work ../output/work ../../rtl/inv_sub_bytes_rtl.vhd
vcom -2008 -work ../output/work ../../rtl/inv_shift_rows_rtl.vhd
vcom -2008 -work ../output/work ../../rtl/inv_mix_columns_rtl.vhd
vcom -2008 -work ../output/work ../../rtl/add_roundkey_rtl.vhd
vcom -2008 -work ../output/work ../../rtl/inv_round_rtl.vhd

# ############
#  Testbench
# ############

vcom -2008 -work ../output/work ../../../common/tb_pkg.vhd
vcom -2008 -work ../output/work ../src/inv_round_tb.vhd

# ############
#  Start sim
# ############

vsim -voptargs=+acc ../output/work.inv_round_tb
 
# ############
# Load wave file
# ############

do ../waves/inv_round_wave.do

run -all