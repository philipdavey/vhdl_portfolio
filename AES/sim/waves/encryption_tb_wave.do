onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /encryption_tb/UUT/CLK
add wave -noupdate /encryption_tb/UUT/RST_N
add wave -noupdate /encryption_tb/UUT/round_key
add wave -noupdate -group {Initial Round} /encryption_tb/UUT/init_round_i/INPUT_EN
add wave -noupdate -group {Initial Round} /encryption_tb/UUT/init_round_i/INPUT_DATA
add wave -noupdate -group {Initial Round} /encryption_tb/UUT/init_round_i/ROUND_KEY
add wave -noupdate -group {Initial Round} /encryption_tb/UUT/init_round_i/OUTPUT_EN
add wave -noupdate -group {Initial Round} /encryption_tb/UUT/init_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/INPUT_EN
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/INPUT_DATA
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/ROUND_KEY
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/OUTPUT_EN
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/INPUT_EN
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/INPUT_DATA
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/ROUND_KEY
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/OUTPUT_EN
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 3} /encryption_tb/UUT/main_round_gen_i(2)/main_round_i/INPUT_EN
add wave -noupdate -group {Round 3} /encryption_tb/UUT/main_round_gen_i(2)/main_round_i/INPUT_DATA
add wave -noupdate -group {Round 3} /encryption_tb/UUT/main_round_gen_i(2)/main_round_i/ROUND_KEY
add wave -noupdate -group {Round 3} /encryption_tb/UUT/main_round_gen_i(2)/main_round_i/OUTPUT_EN
add wave -noupdate -group {Round 3} /encryption_tb/UUT/main_round_gen_i(2)/main_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 4} /encryption_tb/UUT/main_round_gen_i(3)/main_round_i/CLK
add wave -noupdate -group {Round 4} /encryption_tb/UUT/main_round_gen_i(3)/main_round_i/RST_N
add wave -noupdate -group {Round 4} /encryption_tb/UUT/main_round_gen_i(3)/main_round_i/INPUT_EN
add wave -noupdate -group {Round 4} /encryption_tb/UUT/main_round_gen_i(3)/main_round_i/INPUT_DATA
add wave -noupdate -group {Round 4} /encryption_tb/UUT/main_round_gen_i(3)/main_round_i/ROUND_KEY
add wave -noupdate -group {Round 4} /encryption_tb/UUT/main_round_gen_i(3)/main_round_i/OUTPUT_EN
add wave -noupdate -group {Round 4} /encryption_tb/UUT/main_round_gen_i(3)/main_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 5} /encryption_tb/UUT/main_round_gen_i(4)/main_round_i/INPUT_EN
add wave -noupdate -group {Round 5} /encryption_tb/UUT/main_round_gen_i(4)/main_round_i/INPUT_DATA
add wave -noupdate -group {Round 5} /encryption_tb/UUT/main_round_gen_i(4)/main_round_i/ROUND_KEY
add wave -noupdate -group {Round 5} /encryption_tb/UUT/main_round_gen_i(4)/main_round_i/OUTPUT_EN
add wave -noupdate -group {Round 5} /encryption_tb/UUT/main_round_gen_i(4)/main_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 6} /encryption_tb/UUT/main_round_gen_i(5)/main_round_i/INPUT_EN
add wave -noupdate -group {Round 6} /encryption_tb/UUT/main_round_gen_i(5)/main_round_i/INPUT_DATA
add wave -noupdate -group {Round 6} /encryption_tb/UUT/main_round_gen_i(5)/main_round_i/ROUND_KEY
add wave -noupdate -group {Round 6} /encryption_tb/UUT/main_round_gen_i(5)/main_round_i/OUTPUT_EN
add wave -noupdate -group {Round 6} /encryption_tb/UUT/main_round_gen_i(5)/main_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 7} /encryption_tb/UUT/main_round_gen_i(6)/main_round_i/INPUT_EN
add wave -noupdate -group {Round 7} /encryption_tb/UUT/main_round_gen_i(6)/main_round_i/INPUT_DATA
add wave -noupdate -group {Round 7} /encryption_tb/UUT/main_round_gen_i(6)/main_round_i/ROUND_KEY
add wave -noupdate -group {Round 7} /encryption_tb/UUT/main_round_gen_i(6)/main_round_i/OUTPUT_EN
add wave -noupdate -group {Round 7} /encryption_tb/UUT/main_round_gen_i(6)/main_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 8} /encryption_tb/UUT/main_round_gen_i(7)/main_round_i/INPUT_EN
add wave -noupdate -group {Round 8} /encryption_tb/UUT/main_round_gen_i(7)/main_round_i/INPUT_DATA
add wave -noupdate -group {Round 8} /encryption_tb/UUT/main_round_gen_i(7)/main_round_i/ROUND_KEY
add wave -noupdate -group {Round 8} /encryption_tb/UUT/main_round_gen_i(7)/main_round_i/OUTPUT_EN
add wave -noupdate -group {Round 8} /encryption_tb/UUT/main_round_gen_i(7)/main_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 9} /encryption_tb/UUT/main_round_gen_i(8)/main_round_i/INPUT_EN
add wave -noupdate -group {Round 9} /encryption_tb/UUT/main_round_gen_i(8)/main_round_i/INPUT_DATA
add wave -noupdate -group {Round 9} /encryption_tb/UUT/main_round_gen_i(8)/main_round_i/ROUND_KEY
add wave -noupdate -group {Round 9} /encryption_tb/UUT/main_round_gen_i(8)/main_round_i/OUTPUT_EN
add wave -noupdate -group {Round 9} /encryption_tb/UUT/main_round_gen_i(8)/main_round_i/OUTPUT_DATA
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/CLK
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/RST_N
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/INPUT_EN
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/INPUT_DATA
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/ROUND_KEY
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/OUTPUT_EN
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/OUTPUT_DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {18 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
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
WaveRestoreZoom {0 ns} {541 ns}
