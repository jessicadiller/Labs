module DataMemory(clk, dataOut, address, writeEnable, dataIn);
parameter addresswidth = 7;
parameter depth = 2**addresswidth;
parameter width = 8;

output reg [width-1:0]  dataOut;

input clk;
input [addresswidth-1:0]    address;
input writeEnable;
input[width-1:0]    dataIn;

reg [width-1:0] memory [depth-1:0];

always @(posedge clk) begin
    if(writeEnable)
        memory[address] <= dataIn;
		dataOut <= memory[address];
    end

endmodule
