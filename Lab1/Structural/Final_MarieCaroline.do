vlog -reportprogress 300 -work work Final_Final.v
vsim -voptargs="+acc" test_looping
add wave -position insertpoint \
sim:/test_looping/operandA \
sim:/test_looping/operandB \
sim:/test_looping/overflow \
sim:/test_looping/carryout \
sim:/test_looping/zero \
sim:/test_looping/result
run -all
wave zoom full