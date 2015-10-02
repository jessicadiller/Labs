vlog -reportprogress 300 -work work 4bitadder2.v
vsim -voptargs="+acc" testFullAdder
add wave -position insertpoint \
sim:/testFullAdder/carryout \
sim:/testFullAdder/a \
sim:/testFullAdder/b \
sim:/testFullAdder/sum \
sim:/testFullAdder/overflow
run -all
wave zoom full
