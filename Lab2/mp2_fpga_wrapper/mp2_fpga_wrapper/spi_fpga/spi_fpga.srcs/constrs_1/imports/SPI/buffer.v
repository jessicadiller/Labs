module buffer(clk, q,miso_buff,miso_pin);

input clk;
input q;
input miso_buff;
output reg miso_pin;

always @ ( posedge clk ) begin
	if (miso_buff == 1) begin
		miso_pin <= q;
	end
	else begin	
		miso_pin <= 1'bz;
	end
end
	
endmodule