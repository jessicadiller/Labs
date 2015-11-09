module addresslatch(clk, din, qout, wrenable);

input clk;
input[7:0] din;
input wrenable;
output reg[6:0] qout;

always @(posedge clk) begin
	if(wrenable) begin
		//$display("address captured");
		qout[0]<=din[1];
		qout[1]<=din[2];
		qout[2]<=din[3];
		qout[3]<=din[4];
		qout[4]<=din[5];
		qout[5]<=din[6];
		qout[6]<=din[7];
	end
end

endmodule
