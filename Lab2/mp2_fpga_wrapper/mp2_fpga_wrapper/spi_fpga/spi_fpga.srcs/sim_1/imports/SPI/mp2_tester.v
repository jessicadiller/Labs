//Test Bench to examine MP2 Behavior before flashing to FPGA.
//Tests a single read and write cycle. Corresponding do file
//probes multiple waveforms.

module test_mp2();
reg[2:0] gpioBank2; //Allow control over input values.

//je[0] is MOSI
//je[1] is SCLK
//je[2] is CS
//je[3] is FAULT (UNUSED)
//je[4] is MISO

reg clk;
wire[3:0] led;
wire miso;

always #10 clk=!clk;    // 50MHz Clock
always #1000 gpioBank2[1]=!gpioBank2[1]; //500KHz clock which corresponds to a clock divider of 32.

mp2 spi(led, miso, gpioBank2, clk);

initial begin
gpioBank2=4'b000; clk=0;
#2000 gpioBank2[2]=0; gpioBank2[1]=0;//CS asserted low, and sclk must be low when we started, now let's write to 1111111!
      gpioBank2[0]=0;
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=0;
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=0;
#2000 gpioBank2[0]=0;
#2000 gpioBank2[0]=0;
//Now shift in some data.
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=0;
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=0;

#2000 gpioBank2[2]=1; //Wait for FSM completion,CS asserted HIGH to stop data comms.

#10000 gpioBank2[2]=0; gpioBank2[1]=0;//Wait for write completion, now assert CS low.
//Now try to read the address.
      gpioBank2[0]=0;
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=0;
#2000 gpioBank2[0]=1;
#2000 gpioBank2[0]=0;
#2000 gpioBank2[0]=0;
#2000 gpioBank2[0]=1;
#16000 gpioBank2[2]=1; //Wait for completion, then pull up chip select.
 $stop;
end

endmodule
