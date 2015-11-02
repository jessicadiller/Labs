//------------------------------------------------------------------------
// Input Conditioner test bench
//------------------------------------------------------------------------

module testConditioner();

    wire clk;
    wire pin;
    wire conditioned;
    wire rising;
    wire falling;
    reg begintest;
    wire endtest;
    wire dutpassed;
    wire positiveedge;
    wire negativeedge;
    wire noisysignal;
    
    inputconditioner dut(.clk(clk),
    			 .noisysignal(pin),
			 .conditioned(conditioned),
			 .positiveedge(rising),
			 .negativeedge(falling)
    );

    inputconditionerTestBench tester(
	.begintest(begintest),
	.endtest(endtest),
	.dutpassed(dutpassed),
	.clk(clk) ,
	.noisysignal(pin),
	.conditioned(conditioned),
	.positiveedge(rising),
	.negativeedge(falling)
	);


initial begin 
	begintest = 0;
	#10;
	begintest = 1;
	#1000;
end

always @(posedge endtest) begin
	$display("DUT passed?: %b", dutpassed);
end

endmodule

module inputconditionerTestBench(
		input begintest,
		output reg endtest,
		output reg dutpassed,

		output reg clk,
		output reg noisysignal,
		input conditioned,
		input positiveedge,
		input negativeedge
	);

    
// Generate clock (50MHz)
initial clk=0;
always #10 clk=!clk;    // 50MHz Clock


always @(posedge begintest) begin
	endtest = 0;
	dutpassed =1;
	#10
	noisysignal=0;
	#40

	//Test Case 0
	//Input a up blip of 2 clock cycles
	noisysignal = 1;
	#40
	// Verify expectations and report test result
	if((conditioned != 0) || (positiveedge != 0) || (negativeedge != 0)) begin
    	    dutpassed = 0;	// Set to 'false' on failure
    	    $display("Short blip not working");
  	end
	noisysignal = 0;
	#80
	//Test Case 1
	//upward for 3 clock cycles
	noisysignal = 1;
	#110
	// Verify expectations and report test result
	if((conditioned != 1) || (positiveedge != 1) || (negativeedge != 0)) begin
    	    dutpassed = 0;	// Set to 'false' on failure
    	    $display("Upward move with posedge not working");
	end
	//Test Case 2
	//upward move with pos edge rising
	#20
	if((conditioned != 1) || (positiveedge != 0) || (negativeedge != 0)) begin
    	    dutpassed = 0;	// Set to 'false' on failure
    	    $display("Upward move after posedge not working");
	end
	//Test Case 3
	//downward blip
	#30
	noisysignal = 0;
	#20
	noisysignal = 1;
	#20
	//Verify expectations and report test results
	if((conditioned != 1) || (positiveedge != 0) || (negativeedge != 0)) begin
    	    dutpassed = 0;	// Set to 'false' on failure
    	    $display("downward blip not working");
	end
	//Test Case 4
	//downward move
	noisysignal = 0;
	#55
	//Test Case 5
	//downward blip but not on clock rising edge
	noisysignal = 1;
	#5
	noisysignal = 0;
	#50
	//Verify expectations and report test results
	if((conditioned != 0) || (positiveedge != 0) || (negativeedge != 1)) begin
    	    dutpassed = 0;	// Set to 'false' on failure
    	    $display("downward move or tiny blip not working");
	end
	//Test Case 6
	//upward move with neg edge falling
	#20
	//Verify expectations and report test results
	if((conditioned != 0) || (positiveedge != 0) || (negativeedge != 0)) begin
    	    dutpassed = 0;	// Set to 'false' on failure
    	    $display("downward move after posedge not working");
	end
	
   	endtest = 1;
	end
endmodule