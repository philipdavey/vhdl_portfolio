# ############
#  RTL Files
# ############
vcom -work work ../../rtl/aes_pkg.vhd
vcom -work work ../../rtl/sbox_lut_rtl.vhd
vcom -work work ../../rtl/sub_bytes_rtl.vhd
vcom -work work ../../rtl/shift_rows_rtl.vhd
# vcom -work work ../../rtl/mix_columns_rtl.vhd
vcom -work work ../../rtl/add_roundkey_rtl.vhd
vcom -work work ../../rtl/round_rtl.vhd

# ############
#  Testbench
# ############

#vcom -work work ../src/round_tb.vhd

# ############
#  Start sim
# ############

#vsim -voptargs=+acc work.round_tb

 
# ############
# Load wave file
# ############

# Insert wave here to run

 

#run -all