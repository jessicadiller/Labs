vlog -reportprogress 300 -work work nand_32bit.v
vsim -voptargs="+acc" testNand32bit
add wave -position insertpoint \
sim:/testNand32bit/a \
sim:/testNand32bit/b \
sim:/testNand32bit/out
run -all
wave zoom full