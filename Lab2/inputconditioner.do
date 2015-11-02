vlog -reportprogress 300 -work work inputconditioner.t.v inputconditioner.v
vsim -voptargs="+acc" testConditioner

add wave -position insertpoint \
sim:/testConditioner/clk \
sim:/testConditioner/pin \
sim:/testConditioner/conditioned \
sim:/testConditioner/rising \
sim:/testConditioner/falling \
sim:/testConditioner/begintest \
sim:/testConditioner/endtest \
sim:/testConditioner/dutpassed
run 550

wave zoom full