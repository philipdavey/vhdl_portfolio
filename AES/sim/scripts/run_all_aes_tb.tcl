# ====================================================================
# File Name     : run_all_aes_tb.tcl
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

# Run Round tb:
do run_round_tb.tcl
quit -sim

# Run Inverse Round tb:
do run_inv_round_tb.tcl
quit -sim

# Run Encryption tb:
do run_encryption_tb.tcl
quit -sim

# Run Decryption tb:
do run_decryption_tb.tcl
quit -sim