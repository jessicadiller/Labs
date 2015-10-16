vlog -reportprogress 300 -work work for_loop_test_jdilleredit.v
vsim -voptargs="+acc" test_looping
add wave -position insertpoint \
sim:/test_looping/operandA \
sim:/test_looping/operandB \
sim:/test_looping/result
run -all
wave zoom full