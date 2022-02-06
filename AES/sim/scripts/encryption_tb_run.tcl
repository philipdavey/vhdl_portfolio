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

# vsim -coverage -vopt ../output/work.encryption_tb -c -do "coverage save -onexit -directive -codeAll encryption_cov; run -all;"

# vsim -coverage ../output/work.encryption_tb

 
# ############
# Load wave file
# ############

do ../waves/encryption_tb_wave.do

run -all

# vcover report -html ../output/coverage encryption_cov

# coverage report -output ../output/coverage report.txt -srcfile=* -assert -directive -cvg -codeAll

# coverage report -html -output ../output encryption_cov -assert -directive