# ====================================================================
# File Name     : aes_coverage.do
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
# Open and Combine all coverage files:
# ############

vcover merge ../output/aes_cov_combined.ucdb\
../output/cov_round_tb.ucdb \
../output/cov_encryption_tb.ucdb \
../output/cov_inv_round_tb.ucdb \
../output/cov_decryption_tb.ucdb \

vsim -cvgperinstance -viewcov ../output/aes_cov_combined.ucdb

# ############
# Generate Coverage report for entire system:
# ############

coverage report -output ../output/aes_cov_overall.txt \
-srcfile=../../rtl/sub_bytes_rtl.vhd \
-srcfile=../../rtl/shift_rows_rtl.vhd \
-srcfile=../../rtl/mix_columns_rtl.vhd \
-srcfile=../../rtl/add_roundkey_rtl.vhd \
-srcfile=../../rtl/inv_sub_bytes_rtl.vhd \
-srcfile=../../rtl/inv_shift_rows_rtl.vhd \
-srcfile=../../rtl/inv_mix_columns_rtl.vhd \
-srcfile=../../rtl/round_rtl.vhd \
-srcfile=../../rtl/inv_round_rtl.vhd \
-srcfile=../../rtl/final_round_rtl.vhd \
-srcfile=../../rtl/inv_final_round_rtl.vhd \
-srcfile=../../rtl/encryption_rtl.vhd \
-srcfile=../../rtl/decryption_rtl.vhd \
-srcfile=../../rtl/key_schedule_rtl.vhd \
-assert -directive -cvg -code bcsf

# ############
# Generate Coverage report for individual files:
# ############

# Round:
coverage report -output ../output/cov_round_rtl.txt \
-srcfile=../../rtl/round_rtl.vhd \
-detail -dump -annotate -option -assert -directive -cvg -code bcsf

# Inverse Round:
coverage report -output ../output/cov_inv_round_rtl.txt \
-srcfile=../../rtl/inv_round_rtl.vhd \
-detail -dump -annotate -option -assert -directive -cvg -code bcsf

# Encryption:
coverage report -output ../output/cov_encryption_rtl.txt \
-srcfile=../../rtl/encryption_rtl.vhd \
-detail -dump -annotate -option -assert -directive -cvg -code bcsf

# Decryption:
coverage report -output ../output/cov_decryption_rtl.txt \
-srcfile=../../rtl/decryption_rtl.vhd \
-detail -dump -annotate -option -assert -directive -cvg -code bcsf