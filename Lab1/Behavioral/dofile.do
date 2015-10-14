vlog -reportprogress 300 -work work adder.v
vsim -voptargs="+acc" testFullAdder
add wave -position insertpoint  \
sim:/testFullAdder/sum \
sim:/testFullAdder/carryout \
sim:/testFullAdder/a \
sim:/testFullAdder/b \
sim:/testFullAdder/carryin 
run -all
wave zoom full