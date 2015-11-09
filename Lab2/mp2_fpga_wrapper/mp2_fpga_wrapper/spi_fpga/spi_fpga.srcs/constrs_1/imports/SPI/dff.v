module d_flipflop(clk, sclk_neg_ed, d, q);

input clk;
input d;
input sclk_neg_ed;
output reg q;

always @ ( posedge clk ) begin
	if (sclk_neg_ed) begin
		q <= d;
	end
end
	
endmodule
