module FSM
( input clk,
 input RorW,
 input CSReset,
 input SCLK,
 input fault_pin,
 output reg addressLatch_WE,
 output reg shiftReg_WE,
 output reg MISO_enable,
 output reg dataMem_WE
);
    parameter counterwidth = 3; // Counter size, in bits, >= log2(waittime) used to count clock cycles of debounce period
    parameter waittime = 3;     // Debounce delay, in clock cycles
    
    reg[counterwidth-1:0] counter = 0; //3 bit bus

    //setting state values
    parameter state_GETTING_ADDRESS     = 3'd0;
    parameter state_GOT_ADDRESS         = 3'd1;
    parameter state_READ_1              = 3'd2;
    parameter state_READ_2              = 3'd3;
    parameter state_READ_3		= 3'd4;
    parameter state_WRITE_1		= 3'd5;
    parameter state_WRITE_2		= 3'd6;
    parameter state_DONE		= 3'd7;
    parameter statewidth = 8;
    //keeping track of states
    reg [statewidth-1:0] currentState;
    reg [statewidth-1:0] nextState;

//OPTION ONE INCLUDE CLK AND SCLK	
  always @(posedge clk) begin
	if (CSReset == 1) begin
		if (fault_pin == 1) begin
			currentState <= nextState;
		end
		else begin
			counter <= 0;
			currentState <= state_GETTING_ADDRESS;
		end
	end
	else begin
		currentState <= nextState;
	end
  end
  always @(posedge SCLK) begin 	//whenever SCLK has a risign edge this loop starts
//ADDITIONALLY: you'd take out the CSRest if and elses down below
//OPTION TWO ONLY INCLUDE SCLK - SEEN BELOW
//    always @(posedge SCLK) begin //whenever SClk has a rising edge
//        if (CSreset == 0) begin 
//		counter <= 0;
//		currentState <= state_GETTING_ADDRESS
//	end
//	else begin
//		currentState <= nextState
	case(currentState)
		state_GETTING_ADDRESS: begin
			counter <= counter+1;
			if (counter == counterwidth) begin
				nextState <= state_GOT_ADDRESS;
				counter <= 0;
				addressLatch_WE <= 1;
			end
		    end
		    state_GOT_ADDRESS: begin
			addressLatch_WE <= 0;
			if (RorW == 1) begin
				nextState <= state_READ_1;
			end
			else begin
				nextState <= state_WRITE_1;
			end
		    end
		    state_READ_1: begin
			shiftReg_WE <= 1;
			nextState <= state_READ_2;
		    end
		    state_READ_2: begin 
			shiftReg_WE <= 0;
			MISO_enable <= 1;
		 	nextState <= state_READ_3;
		    end
		    state_READ_3: begin
			counter <= counter+1;
			if (counter == counterwidth) begin
				counter <= 0;
				nextState <= state_DONE;
			end
		    end
		    state_WRITE_1: begin
			counter <= counter+1;
			if (counter == counterwidth) begin
				addressLatch_WE <= 0;
				dataMem_WE <= 1;
				nextState <= state_WRITE_2;
			end
		    end
		    state_WRITE_2: begin
			counter <= 0;
			nextState <= state_DONE;
		    end
		    state_DONE: begin
			nextState <= state_GETTING_ADDRESS;
		    end		
	endcase
end
endmodule
