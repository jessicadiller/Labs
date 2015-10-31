vlog -reportprogress 300 -work work inputconditioner.v
vsim -voptargs="+acc" inputconditioner

add wave -position insertpoint \
sim:/inputconditioner/clk \
sim:/inputconditioner/noisysignal \
sim:/inputconditioner/conditioned \
sim:/inputconditioner/positiveedge \
sim:/inputconditioner/negativeedge 
run -all

wave zoom full