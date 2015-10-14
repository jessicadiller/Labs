vlog -reportprogress 600 -work work addersubtractor.v
vsim -voptargs="+acc" testFullAddsubtract
add wave -position insertpoint  \
sim:/testFullAddsubtract/sum \
sim:/testFullAddsubtract/carryout \
sim:/testFullAddsubtract/overflow \
sim:/testFullAddsubtract/a \
sim:/testFullAddsubtract/b \
sim:/testFullAddsubtract/control 
run -all
wave zoom full