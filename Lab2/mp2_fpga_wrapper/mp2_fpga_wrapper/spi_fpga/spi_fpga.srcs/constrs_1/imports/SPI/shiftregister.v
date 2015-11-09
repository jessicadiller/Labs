module ShiftRegister(clk, peripheralClkEdge, parallelLoad, parallelDataIn, serialDataIn, parallelDataOut, serialDataOut);
parameter width = 8;
input               clk;
input               peripheralClkEdge;
input               parallelLoad;
output[width-1:0]   parallelDataOut;
output              serialDataOut;
input[width-1:0]    parallelDataIn;
input               serialDataIn;
reg[width-1:0]      shiftregistermem;
always @(posedge clk) begin
 
if (peripheralClkEdge) begin
	shiftregistermem[width-1:0] <= {shiftregistermem[width-2:0],serialDataIn};
end

if (parallelLoad) begin
	shiftregistermem <= parallelDataIn;
end

end

assign serialDataOut = shiftregistermem[width-1];
assign parallelDataOut = shiftregistermem;
endmodule

module TestShiftRegister;
reg             clk;
reg             peripheralClkEdge;
reg             parallelLoad;
wire[7:0]       parallelDataOut;
wire            serialDataOut;
reg[7:0]        parallelDataIn;
reg             serialDataIn; 
// Instantiate with parameter width = 8
ShiftRegister #(8) sr(clk, peripheralClkEdge, parallelLoad, parallelDataIn, serialDataIn, parallelDataOut, serialDataOut);

initial begin
//$display("A                                B                                  com |  res                             cout over zero");
clk = 'b0; #1000
clk = 'b1; peripheralClkEdge = 'b0; parallelLoad = 'b1; parallelDataIn = 'b01000001; serialDataIn = 'b1; #1000
//$display("%b  %b  %b  %b  %b  |  %b  %b  ", clk, peripheralClkEdge, parallelLoad, parallelDataIn, serialDataIn, parallelDataOut, serialDataOut);
//Check parallel load behavior
clk = 'b0; #1000
clk = 'b1; peripheralClkEdge = 'b1; parallelLoad = 'b1; parallelDataIn = 'b01000001; serialDataIn = 'b0; #1000
//$display("%b  %b  %b  %b  %b  |  %b  %b  ", clk, peripheralClkEdge, parallelLoad, parallelDataIn, serialDataIn, parallelDataOut, serialDataOut);
//When you try to shift in a bit and parallelLoad at the same time, parallelLoad takes priority.
repeat (8) begin
#1000 clk = 'b0; #1000
clk = 'b1; peripheralClkEdge = 'b1; parallelLoad = 'b0; parallelDataIn = 'b11111111; serialDataIn = 'b1; 
end
#1000 clk = 'b1;
//Check serial in behavior and make sure that parallelLoad is actually being turned off.
end

endmodule

