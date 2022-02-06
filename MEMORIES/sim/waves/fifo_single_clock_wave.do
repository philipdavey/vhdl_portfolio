onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fifo_single_clock_tb/UUT/CLK
add wave -noupdate /fifo_single_clock_tb/UUT/RST_N
add wave -noupdate /fifo_single_clock_tb/UUT/WR_EN
add wave -noupdate /fifo_single_clock_tb/UUT/FULL
add wave -noupdate /fifo_single_clock_tb/UUT/WR_DATA
add wave -noupdate /fifo_single_clock_tb/UUT/RD_EN
add wave -noupdate /fifo_single_clock_tb/UUT/EMPTY
add wave -noupdate /fifo_single_clock_tb/UUT/RD_DATA
add wave -noupdate /fifo_single_clock_tb/UUT/fifo_data
add wave -noupdate /fifo_single_clock_tb/UUT/fifo_count
add wave -noupdate /fifo_single_clock_tb/UUT/fifo_wr_index
add wave -noupdate /fifo_single_clock_tb/UUT/fifo_rd_index
add wave -noupdate /fifo_single_clock_tb/UUT/int_full
add wave -noupdate /fifo_single_clock_tb/UUT/int_empty
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49105504 ns} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ns} {2089 ns}
