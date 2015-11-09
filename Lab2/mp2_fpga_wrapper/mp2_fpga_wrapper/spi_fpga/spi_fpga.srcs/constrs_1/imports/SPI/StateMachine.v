module StateMachine(clk, miso_bufe, dm_we, addr_we, sr_we, sclk, cs, rw);
	input clk, sclk, cs, rw;
	output reg miso_bufe, dm_we, addr_we, sr_we;
	reg[2:0] state;
	reg[4:0] counter;
	initial begin
		counter = 0; 
		state = 0; miso_bufe = 0; dm_we = 0; addr_we = 0; sr_we = 0;
	end
	always @(posedge clk) begin
		if (cs == 1) begin //Reset
			counter = 0; 
			miso_bufe = 0; dm_we = 0; addr_we = 0; sr_we = 0; 
			state = 0; //jump to Get
		end
		else if (state == 0) begin //Get
			miso_bufe = 0; dm_we = 0; addr_we = 0; sr_we = 0; 
			counter = counter + sclk;
			if (counter == 8) begin
				state = 1; //Jump to Got
			end
		end
		else if (state == 1) begin //Got
			counter = 0;
			miso_bufe = 0; dm_we = 0; addr_we = 1; sr_we = 0; 
			if(rw == 1) begin
				state = 2; //Jump to Read
			end
			else if(rw == 0) begin
				state = 5; //Jump to Write
			end
		end
		else if (state == 2) begin //Read
			miso_bufe = 0; dm_we = 0; addr_we = 0; sr_we = 0; //Jump to Read
			state = 3; //Jump to Read2
		end
		else if (state == 3) begin //Read2
			miso_bufe = 0; dm_we = 0; addr_we = 0; sr_we = 1; 
			state = 4; //Jump to Read3
		end
		else if (state == 4) begin //Read3
			miso_bufe = 1; dm_we = 0; addr_we = 0; sr_we = 0; 
			counter = counter + sclk;
			if (counter == 8) begin 
				state = 7; //Jump to Done
			end	
		end
		else if (state == 5) begin //Write
			miso_bufe = 0; dm_we = 0; addr_we = 0; sr_we = 0;
			counter = counter + sclk;
			if (counter == 8) begin
				state = 6; //Jump to Write2
			end
		end
		else if (state == 6) begin //Write2
			miso_bufe = 0; dm_we = 1; addr_we = 0; sr_we = 0; 
			state = 7; //Jump to Done
		end
		else if (state == 7) begin //Done
			counter = 0;
			miso_bufe = 0; dm_we = 0; addr_we = 0; sr_we = 0;
			if (cs == 0) begin
				state = 0; //Jump to Get
			end
		end
	end
endmodule