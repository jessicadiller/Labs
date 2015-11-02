//------------------------------------------------------------------------
// Input Conditioner test bench
//------------------------------------------------------------------------

module testConditioner();

    reg clk;
    reg pin;
    wire conditioned;
    wire rising;
    wire falling;
    reg begintest;
    reg endtest;
    wire dutpassed;
    
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
	.WriteNoisy(writenoisy),
	.ReadConditioned(readconditioned),
	.ReadPosEdge(readposedge),
	.ReadNegEdge(readnegedge)
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
		output reg writenoisy,
		input readconditioned,
		input readposedge,
		input readnegedge
	);


    // Generate clock (50MHz)
    initial clk=0;
    always #10 clk=!clk;    // 50MHz Clock
    
    initial begin
	writenoisy=0;
	clk = 0;

//Test Case 1
//Input a blip of 1 clock cycle

writenoisy = 1;
#20
writenoisy = 0;

  // Verify expectations and report test result
if((readconditioned != 0) || (readposedge != 0) || (readnegedge != 0)) begin
    dutpassed = 0;	// Set to 'false' on failure
    $display("Short blip not working");
  end

#20
writenoisy = 1;
#20

if((readconditioned != 0) || (readposedge != 0) || (readnegedge != 0)) begin
    dutpassed = 0;	// Set to 'false' on failure
    $display("Short blip not working");
  end



	
    // Your Test Code
    // Be sure to test each of the three conditioner functions:
    // Synchronize, Clean, Preprocess (edge finding)
   // if counter == 0,1,or2 
	// if pin == 1
		//conditioned = previous
		// rising = 0
		// falling = 0
	//if pin == 0
		//conditioned = previous
	 	// rising = 0
		// falling = 0
   // if counter == 3
	//if pin == 1
		//conditioned = 1
		//rising = 1
		//falling = 0
	//if pin == 0 
		//conditioned = 0
		//rising = 0
		//falling = 1
  // Example test case
  //   Write '15' to register 2, verify with Read Ports 1 and 2
  //   (Fails with example register file, but should pass with yours)
  // WriteRegister = 5'd2;
  // WriteData = 32'd15;
  // RegWrite = 1;
  // ReadRegister1 = 5'd2;
  // ReadRegister2 = 5'd2;
  // #5 Clk=1; #5 Clk=0; //Use this to force more than 1 clock cycle!

  // if((ReadData1 != 15) || (ReadData2 != 15)) begin
  //   dutpassed = 0;
  //   $display("Test Case 2 Failed");
  end

endmodule
