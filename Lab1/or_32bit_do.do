vlog -reportprogress 300 -work work or_32bit.v
vsim -voptargs="+acc" testOr32bit
add wave -position insertpoint \
sim:/testOr32bit/a \
sim:/testOr32bit/b \
sim:/testOr32bit/out
run -all
wave zoom full