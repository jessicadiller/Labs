vlog -reportprogress 300 -work work for_loop_test.v
vsim -voptargs="+acc" test_looping
run 1000