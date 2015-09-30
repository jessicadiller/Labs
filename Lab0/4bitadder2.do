vlog -reportprogress 300 -work work 4bitadder2.v
vsim -voptargs="+acc" testFullAdder
add wave -position insertpoint  \
sim:/testFullAdder/carryout3 \
sim:/testFullAdder/a \
sim:/testFullAdder/b \
sim:/testFullAdder/sum0 \
sim:/testFullAdder/sum1 \
sim:/testFullAdder/sum2 \
sim:/testFullAdder/sum3 \
sim:/testFullAdder/overflow
run -all
wave zoom full
