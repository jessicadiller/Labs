//------------------------------------------------------------------------
// Shift Register
//   Parameterized width (in bits)
//   Shift register can operate in two modes:
//      - serial in, parallel out
//      - parallel in, serial out
//------------------------------------------------------------------------

module shiftregister
#(parameter width = 8)
(
input               clk,                // FPGA Clock
input               peripheralClkEdge,  // Edge indicator - when this goes high, load whatever serial data is
input               parallelLoad,       // 1 = Load shift reg with parallelDataIn
input  [width-1:0]  parallelDataIn,     // Load shift reg in parallel
input               serialDataIn,       // Load shift reg serially
output reg[width-1:0]  parallelDataOut,    // Shift reg data contents
output reg             serialDataOut       // Positive edge synchronized
);

    reg [width-1:0]      shiftregistermem;
    always @(posedge clk) begin
        // Your Code Here
	// this is basically 8 flip flops in a row

	if (peripheralClkEdge == 1) begin //when the peripheralClkEdge goes high
	//serial load to LSB  here
	shiftregistermem <= {shiftregistermem[width-2:0], serialDataIn};
	end

	if (parallelLoad == 1) begin
	//load it in parallel
	shiftregistermem <= parallelDataIn;
	end

	//assign the right numbers to the outputs every clock cycle
	parallelDataOut <= shiftregistermem[7:0];
	serialDataOut <= shiftregistermem[width-1];
    end
endmodule
