//------------------------------------------------------------------------
// Input Conditioner test bench
//------------------------------------------------------------------------

module testConditioner();

    reg clk;
    reg pin;
    wire conditioned;
    wire rising;
    wire falling;
    
    inputconditioner dut(.clk(clk),
    			 .noisysignal(pin),
			 .conditioned(conditioned),
			 .positiveedge(rising),
			 .negativeedge(falling))


    // Generate clock (50MHz)
    initial clk=0;
    always #10 clk=!clk;    // 50MHz Clock
    
    initial begin
    // Your Test Code
    // Be sure to test each of the three conditioner functions:
    // Synchronize, Clean, Preprocess (edge finding)
   // if counter == 0,1,or2 
	// if pin == 1
		//conditioned == previous
		// rising = 0
		// falling = 0
	//if pin == 0
		//condition = pre
   // if counter

  // Example test case
  //   Write '15' to register 2, verify with Read Ports 1 and 2
  //   (Fails with example register file, but should pass with yours)
  WriteRegister = 5'd2;
  WriteData = 32'd15;
  RegWrite = 1;
  ReadRegister1 = 5'd2;
  ReadRegister2 = 5'd2;
  #5 Clk=1; #5 Clk=0; //Use this to force more than 1 clock cycle!

  if((ReadData1 != 15) || (ReadData2 != 15)) begin
    dutpassed = 0;
    $display("Test Case 2 Failed");
  end


endmodule
