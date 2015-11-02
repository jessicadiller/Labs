vlog -reportprogress 300 -work work shiftregister.t.v shiftregister.v
vsim -voptargs="+acc" testshiftregister

add wave -position insertpoint \
sim:/testshiftregister/clk \
sim:/testshiftregister/peripheralClkEdge \
sim:/testshiftregister/parallelLoad \
sim:/testshiftregister/parallelDataOut \
sim:/testshiftregister/serialDataOut \
sim:/testshiftregister/parallelDataIn \
sim:/testshiftregister/serialDataIn \
sim:/testshiftregister/begintest \
sim:/testshiftregister/endtest \
sim:/testshiftregister/dutpassed \

run -all

wave zoom full