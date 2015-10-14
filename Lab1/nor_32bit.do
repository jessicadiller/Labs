vlog -reportprogress 300 -work work nor_32bit.v
vsim -voptargs="+acc" testNor32bit
add wave -position insertpoint \
sim:/testNor32bit/a \
sim:/testNor32bit/b \
sim:/testNor32bit/out
run -all
wave zoom full