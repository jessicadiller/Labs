//------------------------------------------------------------------------
// Shift Register test bench
//------------------------------------------------------------------------

module testshiftregister();

    wire             clk;
    wire            peripheralClkEdge;
    wire             parallelLoad;
    wire[7:0]       parallelDataOut;
    wire            serialDataOut;
    wire[7:0]        parallelDataIn;
    wire             serialDataIn; 
    
  reg		begintest;	// Set High to begin testing register file
  wire		dutpassed;	// Indicates whether register file passed tests
  wire 		endtest;
    // Instantiate with parameter width = 8
    shiftregister #(8) dut(.clk(clk), 
    		           .peripheralClkEdge(peripheralClkEdge),
    		           .parallelLoad(parallelLoad), 
    		           .parallelDataIn(parallelDataIn), 
    		           .serialDataIn(serialDataIn), 
    		           .parallelDataOut(parallelDataOut), 
    		           .serialDataOut(serialDataOut)
	);
    
shiftregisterTestBench tester
  (
    .begintest(begintest),
    .endtest(endtest), 
    .dutpassed(dutpassed),
    .clk(clk), 
    .peripheralClkEdge(peripheralClkEdge),
    .parallelLoad(parallelLoad), 
    .parallelDataIn(parallelDataIn), 
    .serialDataIn(serialDataIn), 
    .parallelDataOut(parallelDataOut), 
    .serialDataOut(serialDataOut)
);
 
// Test harness asserts 'begintest' for 1000 time steps, starting at time 10
  initial begin
    begintest=0;
    #10;
    begintest=1;
    #1000;
  end

  // Display test results ('dutpassed' signal) once 'endtest' goes high
  always @(posedge endtest) begin
    $display("DUT passed?: %b", dutpassed);
  end
    

endmodule

module shiftregisterTestBench(
		// Test bench driver signal connections
input	   		begintest,	// Triggers start of testing
output reg 		endtest,	// Raise once test completes
output reg 		dutpassed,	// Signal test result

//shift register dut connections
output reg		clk,
output reg		peripheralClkEdge,
output reg		parallelLoad, 
output reg[7:0]		parallelDataIn,
output reg		serialDataIn,
input			serialDataOut,
input[7:0]		parallelDataOut
);

integer i = 0;

//set initial conditions of all register signals
initial begin
	clk = 0;
	peripheralClkEdge = 0; //this triggers serial load of serialDataIn
	parallelLoad = 0;
	parallelDataIn = 8'h00;
	serialDataIn = 0;

end

always @(posedge begintest) begin
    endtest = 0;
    dutpassed = 1;
    #10

//test case 1
//serial in 8 0's and parallel read it
#5
serialDataIn = 0;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 1;
peripheralClkEdge = 0; //check to make sure it won't load stuff in when this is 0
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 0;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 0;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 0;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 0;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 0;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 0;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 0;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
#5 clk = 1; #5 clk = 0; //generate clock pulse
//now parallel read it
if((parallelDataOut != 8'h00)) begin
	dutpassed = 0;
	$display("Test case 0 failed");
end

//test case 1
//serial in 8 1's and parallel read it
#5 clk = 0;
$display("test case 1 is : %b", parallelDataOut);
serialDataIn = 1;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
$display("test case 1 is : %b", parallelDataOut);
serialDataIn = 0;
peripheralClkEdge = 0; //check to make sure it won't load stuff in when this is 0
#5 clk = 1; #5 clk = 0; //generate clock pulse
$display("test case 1 is : %b", parallelDataOut);
serialDataIn = 1;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
$display("test case 1 is : %b", parallelDataOut);
serialDataIn = 1;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 1;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 1;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 1;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 1;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
serialDataIn = 1;
peripheralClkEdge = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
#5 clk = 1; #5 clk = 0; //generate clock pulse
//now parallel read it
if((parallelDataOut != 8'hff)) begin
	dutpassed = 0;
	$display("Test case 1` failed");
	$display("paralledl data out is %h", parallelDataOut);
end


//test case 2
//parallel in, serial out
//read a parallel in, then read each out as we push garbage in
#5
parallelDataIn = 8'haa;
parallelLoad = 1;
#5 clk = 1; #5 clk = 0; //generate clock pulse
#5 clk = 1; #5 clk = 0; //generate clock pulse
parallelLoad = 0;
//now we need to read serial, then push garbage in
//we'll need to check an if statement for each serial out

 for (i = 0; i < 8; i = i + 1) begin
	$display("modulo of i is %d", (i%2));
	$display("parallelDataIn = %b", parallelDataIn);
	$display("parallelDataOut = %b", parallelDataOut);
	if(serialDataOut == (i%2)) begin
	dutpassed = 0;
		$display("Test case 2` failed");
		$display("MSB that failed is : %b", serialDataOut);
	end
	//now load a garbage thing in 
	$display("doing serialIn stuff");
	serialDataIn = 0;
	peripheralClkEdge = 1;
	#5 clk = 1; #5 clk = 0; //generate clock pulse
	peripheralClkEdge = 0;
	#5 clk = 1; #5 clk = 0; //generate clock pulse
end



  // All done!  Wait a moment and signal test completion.
  #5
  endtest = 1;

end

endmodule
