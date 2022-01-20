# ############
#  RTL FILES
# ############

vcom -work work ../../../ip/house_ip/AXI4_rtl/axi_pkg.vhd

# My version

vcom -work work ../../../rtl/phil_axi_stream_rx.vhd

# Gemmas version

#vcom -work work ../../../ip/house_ip/AXI4_rtl/axi4_stream_rx_if_rtl.vhd

 

# ############
#  Testbench
# ############

vcom -work work axi_stream_rx_tb.vhd

 

# ############
#  Start sim
# ############

vsim -voptargs=+acc work.axi_stream_rx_tb

 
# ############
# Load wave file
# ############

do axi_str_wave.do

 

run -all