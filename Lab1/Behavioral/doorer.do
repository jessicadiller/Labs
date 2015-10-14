vlog -reportprogress 300 -work work ander.v
vsim -voptargs="+acc" testFullAdder
add wave -position insertpoint  \
sim:/testFullAdder/andres \
sim:/testFullAdder/a \
sim:/testFullAdder/b 
run -all
wave zoom full