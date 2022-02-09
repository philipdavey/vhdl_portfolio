# ====================================================================
# File Name     : fifo_single_clock_tb_run.tcl
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
vcom -2008 -work ../output/work ../../rtl/fifo_single_clock_rtl.vhd

# ############
#  Testbench
# ############

vcom -2008 -work ../output/work ../../../common/tb_pkg.vhd
vcom -2008 -work ../output/work ../src/fifo_single_clock_tb.vhd

# ############
#  Start sim
# ############

vsim -voptargs=+acc ../output/work.fifo_single_clock_tb
 
# ############
# Load wave file
# ############

do ../waves/fifo_single_clock_wave.do

run -all