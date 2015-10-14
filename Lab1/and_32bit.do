vlog -reportprogress 300 -work work and_32bit.v
vsim -voptargs="+acc" testAnd32bit
add wave -position insertpoint \
sim:/testAnd32bit/a \
sim:/testAnd32bit/b \
sim:/testAnd32bit/out
run -all
wave zoom full