onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /round_tb/UUT/CLK
add wave -noupdate /round_tb/UUT/RST_N
add wave -noupdate -radix hexadecimal /round_tb/UUT/INPUT_DATA
add wave -noupdate /round_tb/UUT/ROUND_KEY
add wave -noupdate /round_tb/UUT/INPUT_EN
add wave -noupdate -expand -group {Sub Bytes} /round_tb/UUT/sub_bytes_i/INPUT_EN
add wave -noupdate -expand -group {Sub Bytes} /round_tb/UUT/sub_bytes_i/INPUT_DATA
add wave -noupdate -expand -group {Sub Bytes} /round_tb/UUT/sub_bytes_i/OUTPUT_EN
add wave -noupdate -expand -group {Sub Bytes} /round_tb/UUT/sub_bytes_i/OUTPUT_DATA
add wave -noupdate -expand -group {Shift Rows} /round_tb/UUT/shift_rows_i/INPUT_EN
add wave -noupdate -expand -group {Shift Rows} /round_tb/UUT/shift_rows_i/INPUT_DATA
add wave -noupdate -expand -group {Shift Rows} /round_tb/UUT/shift_rows_i/OUTPUT_EN
add wave -noupdate -expand -group {Shift Rows} /round_tb/UUT/shift_rows_i/OUTPUT_DATA
add wave -noupdate -expand -group {Mix Columns} /round_tb/UUT/mix_columns_i/INPUT_EN
add wave -noupdate -expand -group {Mix Columns} /round_tb/UUT/mix_columns_i/INPUT_DATA
add wave -noupdate -expand -group {Mix Columns} /round_tb/UUT/mix_columns_i/OUTPUT_EN
add wave -noupdate -expand -group {Mix Columns} /round_tb/UUT/mix_columns_i/OUTPUT_DATA
add wave -noupdate -expand -group {Add Round Key} /round_tb/UUT/add_roundkey_i/INPUT_EN
add wave -noupdate -expand -group {Add Round Key} /round_tb/UUT/add_roundkey_i/INPUT_DATA
add wave -noupdate -expand -group {Add Round Key} /round_tb/UUT/add_roundkey_i/ROUND_KEY
add wave -noupdate -expand -group {Add Round Key} /round_tb/UUT/add_roundkey_i/OUTPUT_EN
add wave -noupdate -expand -group {Add Round Key} /round_tb/UUT/add_roundkey_i/OUTPUT_DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {74 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 198
configure wave -valuecolwidth 220
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
WaveRestoreZoom {73 ns} {126 ns}
