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
)

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
wire dataMemOut[7:0];
wire address[6:0];
//shiftregister
wire shiftRegOutP[7:0];
wire shiftRegOutS;
//fsm
wire SR_WE_breakable = 1;
wire SR_WE;
wire ADDR_WE;
wire MISO_BUFF;
wire DM_WE;
//wire DFF inputs and outputs
wire DFF_out;

//instatiate
inputconditioner conditioner1(clk, mosi_pin, c1conditioned, c1posedge c1negedge);
inputconditioner conditioner2(clk, sclk_pin, c2conditioned, c2posedge c2negedge);
inputconditioner conditioner3(clk, cs_pin, c3conditioned, c3posedge c32negedge);
shiftregister shiftregister(clk, c2poosedge, SR_WE, dataMemOut, c1conditioned, shiftregOutP, shiftregOutS);
if (fault_pin == 1) begin
	FSM_breakable fsm_breakable(clk, shiftRegOutP[0], c3conditioned, c2posedge, ADDR_WE, SR_WE, MISO_BUFF, DM_WE);
end
else begin
	FSM fsm(clk, shiftRegOutP[0], c3conditioned, c2posedge, ADDR_WE, SR_WE, MISO_BUFF, DM_WE);
end
datamemory datamemory(clk, dataMemOut, address, DM_WE, shiftRegOutP);
//insatiate address latch
addressLatch addressLatch(clk, shiftRegOutP[7:0], ADDR_WE, address[6:0]);
//instatiante DFF
misodff DFF(shiftregOutS, c3negedge, clk, MISO_BUFF, DFF_out);


endmodule

