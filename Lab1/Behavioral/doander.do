vlog -reportprogress 300 -work work ander.v
vsim -voptargs="+acc" testAnder
add wave -position insertpoint  \
sim:/testAnder/andres \
sim:/testAnder/a \
sim:/testAnder/b 
run -all
wave zoom full