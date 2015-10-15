vlog -reportprogress 600 -work work slt.v
vsim -voptargs="+acc" testSLT32bit
add wave -position insertpoint  \
sim:/testSLT32bit/out \
sim:/testSLT32bit/a \
sim:/testSLT32bit/b 
run -all
wave zoom full