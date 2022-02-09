# ====================================================================
# File Name     : round_tb_run.tcl
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

# ############
#  RTL Files
# ############
vcom -2008 -work ../output/work ../../rtl/aes_pkg.vhd
vcom -2008 -work ../output/work ../../rtl/sbox_lut_rtl.vhd
vcom -2008 -work ../output/work ../../rtl/sub_bytes_rtl.vhd
vcom -2008 -work ../output/work ../../rtl/shift_rows_rtl.vhd
vcom -2008 -work ../output/work ../../rtl/mix_columns_rtl.vhd
vcom -2008 -work ../output/work ../../rtl/add_roundkey_rtl.vhd
vcom -2008 -work ../output/work ../../rtl/round_rtl.vhd

# ############
#  Testbench
# ############

vcom -2008 -work ../output/work ../../../common/tb_pkg.vhd
vcom -2008 -work ../output/work ../src/round_tb.vhd

# ############
#  Start sim
# ############

vsim -voptargs=+acc ../output/work.round_tb
 
# ############
# Load wave file
# ############

do ../waves/round_wave.do

run -all