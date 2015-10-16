vlog -reportprogress 300 -work work multiplexertesting.v
vsim -voptargs="+acc" testMultiplexer
add wave -position insertpoint  \
sim:/testMultiplexer/address0 \
sim:/testMultiplexer/address1 \
sim:/testMultiplexer/address2 \
sim:/testMultiplexer/out \
sim:/testMultiplexer/in0 \
sim:/testMultiplexer/in1 \
sim:/testMultiplexer/in2 \
sim:/testMultiplexer/in3 \
sim:/testMultiplexer/in4 \
sim:/testMultiplexer/in5 \
sim:/testMultiplexer/in6
run -all
wave zoom full