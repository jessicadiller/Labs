module misodff(
input serialout,
input negativeedge,
input clk,
input MISO_BUFF,
output reg miso_out
);
always @(posedge clk) begin
	if(negativeedge == 1) begin
	 	if (MISO_BUFF == 1) begin
			miso_out <= serialout;
		end
	end
end

endmodule
