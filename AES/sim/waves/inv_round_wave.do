onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {Inv Sub Bytes} /inv_round_tb/UUT/inv_sub_bytes_i/CLK
add wave -noupdate -group {Inv Sub Bytes} /inv_round_tb/UUT/inv_sub_bytes_i/RST_N
add wave -noupdate -group {Inv Sub Bytes} /inv_round_tb/UUT/inv_sub_bytes_i/INPUT_EN
add wave -noupdate -group {Inv Sub Bytes} /inv_round_tb/UUT/inv_sub_bytes_i/INPUT_DATA
add wave -noupdate -group {Inv Sub Bytes} /inv_round_tb/UUT/inv_sub_bytes_i/OUTPUT_EN
add wave -noupdate -group {Inv Sub Bytes} /inv_round_tb/UUT/inv_sub_bytes_i/OUTPUT_DATA
add wave -noupdate -group {Inv Shift Rows} /inv_round_tb/UUT/inv_shift_rows_i/CLK
add wave -noupdate -group {Inv Shift Rows} /inv_round_tb/UUT/inv_shift_rows_i/RST_N
add wave -noupdate -group {Inv Shift Rows} /inv_round_tb/UUT/inv_shift_rows_i/INPUT_EN
add wave -noupdate -group {Inv Shift Rows} /inv_round_tb/UUT/inv_shift_rows_i/INPUT_DATA
add wave -noupdate -group {Inv Shift Rows} /inv_round_tb/UUT/inv_shift_rows_i/OUTPUT_EN
add wave -noupdate -group {Inv Shift Rows} /inv_round_tb/UUT/inv_shift_rows_i/OUTPUT_DATA
add wave -noupdate -group {Inv Mix Columns} /inv_round_tb/UUT/inv_mix_columns_i/CLK
add wave -noupdate -group {Inv Mix Columns} /inv_round_tb/UUT/inv_mix_columns_i/RST_N
add wave -noupdate -group {Inv Mix Columns} /inv_round_tb/UUT/inv_mix_columns_i/INPUT_EN
add wave -noupdate -group {Inv Mix Columns} /inv_round_tb/UUT/inv_mix_columns_i/INPUT_DATA
add wave -noupdate -group {Inv Mix Columns} /inv_round_tb/UUT/inv_mix_columns_i/OUTPUT_EN
add wave -noupdate -group {Inv Mix Columns} /inv_round_tb/UUT/inv_mix_columns_i/OUTPUT_DATA
add wave -noupdate -group {Add Round Key} /inv_round_tb/UUT/add_roundkey_i/CLK
add wave -noupdate -group {Add Round Key} /inv_round_tb/UUT/add_roundkey_i/RST_N
add wave -noupdate -group {Add Round Key} /inv_round_tb/UUT/add_roundkey_i/INPUT_EN
add wave -noupdate -group {Add Round Key} /inv_round_tb/UUT/add_roundkey_i/INPUT_DATA
add wave -noupdate -group {Add Round Key} /inv_round_tb/UUT/add_roundkey_i/ROUND_KEY
add wave -noupdate -group {Add Round Key} /inv_round_tb/UUT/add_roundkey_i/OUTPUT_EN
add wave -noupdate -group {Add Round Key} /inv_round_tb/UUT/add_roundkey_i/OUTPUT_DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {138531790 ns} {138532790 ns}
