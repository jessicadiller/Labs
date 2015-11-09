//------------------------------------------------------------------------
// SPI Memory
//------------------------------------------------------------------------

module spiMemory
(
    input           clk,        // FPGA clock
    input           sclk_pin,   // SPI clock
    input           cs_pin,     // SPI chip select
    output          miso_pin,   // SPI master in slave out
    input           mosi_pin,   // SPI master out slave in
    input           fault_pin,  // For fault injection testing
    output [3:0]    leds        // LEDs for debugging
);

// instantiate wire outputs to input conditioners
wire c1conditioned;
wire c1posedge;
wire c1negedge;
wire c2conditioned;
wire c2posedge;
wire c2negedge;
wire c3conditioned;
wire c3posedge;
wire c3negedge;
//data mem
wire [7:0] dataMemOut;
wire [6:0] address;
//shiftregister
wire [7:0] shiftRegOutP;
wire shiftRegOutS;
//fsm
reg SR_WE_breakable = 1;
wire SR_WE;
wire MISO_BUFF;
wire DM_WE;

//instatiate
inputconditioner conditioner1(clk, mosi_pin, c1conditioned, c1posedge, c1negedge);
inputconditioner conditioner2(clk, sclk_pin, c2conditioned, c2posedge, c2negedge);
inputconditioner conditioner3(clk, cs_pin, c3conditioned, c3posedge, c32negedge);
datamemory datamemory(clk, dataMemOut, address, DM_WE, shiftRegOutP);
shiftregister shiftregister(clk, c2posedge, SR_WE, dataMemOut, c1conditioned, shiftRegOutP, shiftRegOutS);
FSM fsm(clk, shiftRegOutP[0], c3conditioned, c2posedge, fault_pin, ADDR_WE, SR_WE, MISO_BUFF, DM_WE);
//insatiate address latch
addressLatch addressLatch(clk, shiftRegOutP, ADDR_WE, address);
//instatiante DFF
misodff DFF(shiftRegOutS, c3negedge, clk, MISO_BUFF, miso_pin);


endmodule

