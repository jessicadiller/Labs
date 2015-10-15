vlog -reportprogress 600 -work work ZerosFlag.v
vsim -voptargs="+acc" testZerosFlag
add wave -position insertpoint  \
sim:/testZerosFlag/ALU \
sim:/testZerosFlag/zerosflag 
run -all
wave zoom full