onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {Key Schedule 0} /encryption_tb/UUT/key_schedule_i/CLK
add wave -noupdate -group {Key Schedule 0} /encryption_tb/UUT/key_schedule_i/RST_N
add wave -noupdate -group {Key Schedule 0} /encryption_tb/UUT/key_schedule_i/INPUT_EN
add wave -noupdate -group {Key Schedule 0} /encryption_tb/UUT/key_schedule_i/CIPHER_KEY
add wave -noupdate -group {Key Schedule 0} /encryption_tb/UUT/key_schedule_i/OUTPUT_EN
add wave -noupdate -group {Key Schedule 0} /encryption_tb/UUT/key_schedule_i/OUTPUT_DATA
add wave -noupdate -group {Key Schedule 1} /encryption_tb/UUT/key_schedule_gen_i(1)/key_schedule_i/CLK
add wave -noupdate -group {Key Schedule 1} /encryption_tb/UUT/key_schedule_gen_i(1)/key_schedule_i/RST_N
add wave -noupdate -group {Key Schedule 1} /encryption_tb/UUT/key_schedule_gen_i(1)/key_schedule_i/INPUT_EN
add wave -noupdate -group {Key Schedule 1} /encryption_tb/UUT/key_schedule_gen_i(1)/key_schedule_i/CIPHER_KEY
add wave -noupdate -group {Key Schedule 1} /encryption_tb/UUT/key_schedule_gen_i(1)/key_schedule_i/OUTPUT_EN
add wave -noupdate -group {Key Schedule 1} /encryption_tb/UUT/key_schedule_gen_i(1)/key_schedule_i/OUTPUT_DATA
add wave -noupdate -group {Round 0 (Initial Round)} /encryption_tb/UUT/init_round_i/CLK
add wave -noupdate -group {Round 0 (Initial Round)} /encryption_tb/UUT/init_round_i/RST_N
add wave -noupdate -group {Round 0 (Initial Round)} /encryption_tb/UUT/init_round_i/INPUT_EN
add wave -noupdate -group {Round 0 (Initial Round)} /encryption_tb/UUT/init_round_i/INPUT_DATA
add wave -noupdate -group {Round 0 (Initial Round)} /encryption_tb/UUT/init_round_i/ROUND_KEY
add wave -noupdate -group {Round 0 (Initial Round)} /encryption_tb/UUT/init_round_i/OUTPUT_EN
add wave -noupdate -group {Round 0 (Initial Round)} /encryption_tb/UUT/init_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/CLK
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/RST_N
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/INPUT_EN
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/INPUT_DATA
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/ROUND_KEY
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/OUTPUT_EN
add wave -noupdate -group {Round 1} /encryption_tb/UUT/main_round_gen_i(0)/main_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/CLK
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/RST_N
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/INPUT_EN
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/INPUT_DATA
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/ROUND_KEY
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/OUTPUT_EN
add wave -noupdate -group {Round 2} /encryption_tb/UUT/main_round_gen_i(1)/main_round_i/OUTPUT_DATA
add wave -noupdate -group {Round 3} /encryption_tb/UUT/main_round_gen_i(2)/main_round_i/CLK
add wave -noupdate -group {Round 3} /encryption_tb/UUT/main_round_gen_i(2)/main_round_i/RST_N
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
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/CLK
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/RST_N
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/INPUT_EN
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/INPUT_DATA
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/ROUND_KEY
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/OUTPUT_EN
add wave -noupdate -group {Final Round} /encryption_tb/UUT/final_round_i/OUTPUT_DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {115 ns} 0}
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
WaveRestoreZoom {50984557 ns} {50984740 ns}
