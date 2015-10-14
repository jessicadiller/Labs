vlog -reportprogress 300 -work work xor_32bit.v
vsim -voptargs="+acc" testXor32bit
add wave -position insertpoint \
sim:/testXor32bit/a \
sim:/testXor32bit/b \
sim:/testXor32bit/out
run -all
wave zoom full