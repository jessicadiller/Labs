module addressLatch(
input clk,
input[7:0] d,
input ce,
output reg[6:0] q
);
always @(posedge clk) begin
	if(ce == 1) begin
		q <= d[7:1]; // I don't think this needs to be made into a bus but I may be wrong
	end
end

endmodule
