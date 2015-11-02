vlog -reportprogress 300 -work work inputconditioner.t.v 
vsim -voptargs="+acc" inputconditionerTestBench

add wave -position insertpoint \
sim:/inputconditionerTestBench/clk \
sim:/inputconditionerTestBench/noisysignal \
sim:/inputconditionerTestBench/conditioned \
sim:/inputconditionerTestBench/positiveedge \
sim:/inputconditionerTestBench/negativeedge 
run -all

wave zoom full