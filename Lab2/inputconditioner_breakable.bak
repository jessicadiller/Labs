//------------------------------------------------------------------------
// Input Conditioner
//    1) Synchronizes input to clock domain
//    2) Debounces input
//    3) Creates pulses at edge transitions
//------------------------------------------------------------------------

module inputconditioner
(
input 	    clk,            // Clock domain to synchronize input to
input	    noisysignal,    // (Potentially) noisy input signal
output reg  conditioned,    // Conditioned output signal
output reg  positiveedge,   // 1 clk pulse at rising edge of conditioned
output reg  negativeedge    // 1 clk pulse at falling edge of conditioned
);

    parameter counterwidth = 3; // Counter size, in bits, >= log2(waittime) used to count clock cycles of debounce period
    parameter waittime = 3;     // Debounce delay, in clock cycles
    
    reg[counterwidth-1:0] counter = 0; //3 bit bus
    reg synchronizer0 = 0;
    reg synchronizer1 = 0;
    
    always @(posedge clk ) begin //whenever clock has a rising edge

	positiveedge <= 0;
	negativeedge <= 0;
		
        if(conditioned == synchronizer1) begin //at start, both will be low
            counter <= 0; //assign counter to 0 at the end of the time cycle
	end
        else begin //if the conditioned is different from synch1
	
            if( counter == waittime) begin //if counter =3, we've waited enough cycles
                counter <= 0; //set counter to 0 at end of time cycle
                conditioned <= synchronizer1; // set output to synchronizer 1
		if(synchronizer1 == 1) begin
			positiveedge <= 1;
		end
		else if(synchronizer1 == 0) begin
			negativeedge <= 1;
		end
            end
            else begin//if we're not done counting yet, increase counter
                counter <= counter+1; 
	    end
        end
	//is there a cycle delay here?
        synchronizer0 = noisysignal; //when input goes high, set synch0 to high
        synchronizer1 <= synchronizer0; //set synchronizer1 to synchronizer0
    end
endmodule