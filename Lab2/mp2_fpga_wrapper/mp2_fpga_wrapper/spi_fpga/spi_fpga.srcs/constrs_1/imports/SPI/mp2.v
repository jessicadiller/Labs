// This is the top-level module for the project!
// Set this as the top module in Xilinx, and place all your modules within this one.
module mp2(led, gpioBank1, gpioBank2, clk, sw, btn);
output reg [7:0] led;
output reg [3:0] gpioBank1;
input[3:0] gpioBank2;
input clk;
input[7:0] sw;
input[3:0] btn;

//gpioBank2[0] is MOSI
//gpioBank2[1] is SCLK
//gpioBank2[2] is CS
//gpioBank2[3] is FAULT
//gpioBank1[0] is MISO

wire[7:0] led_wire;
wire miso_out;
reg[2:0] gpio1Dummy=3'b0;


always @(posedge clk)begin
	led=led_wire;
	gpioBank1[0]=miso_out;
	gpioBank1[1]=gpio1Dummy[0];
	gpioBank1[2]=gpio1Dummy[1];
	gpioBank1[3]=gpio1Dummy[2];
end

spiMemory mem(clk, gpioBank2[1], gpioBank2[2], miso_out, gpioBank2[0], gpioBank2[3], led_wire);

endmodule
