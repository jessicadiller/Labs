module behavioralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
assign {carryout, sum}=a+b+carryin;
endmodule


module test_looping();


integer i;
integer iterations;
reg [3:0] test_inputsa[0:3]; //array of 32 bit bus signals, 4 elements in the array
reg [3:0] test_inputsb[0:3];
reg a0, b0, carryin0; 
wire sum0, carryout0;
reg a1, b1, carryin1; 
wire sum1, carryout1;
behavioralFullAdder adder0(sum0, carryout0, a0, b0, carryin0);

behavioralFullAdder adder1(sum1, carryout1, a1, b1, carryin1);

initial begin
iterations = 2;
test_inputsa[0] = 4'h0;
test_inputsb[0] = 4'h0;
test_inputsa[1] = 4'hf;
test_inputsb[1] = 4'hf;

	
	
carryin0 = 0;
carryin1 = 1;
  //main loop here
  for (i = 0; i < iterations; i = i + 1) begin
	
	a0 = test_inputsa[i];
	b0 = test_inputsb[i+1];
	a1 = test_inputsa[i];
	b1 = test_inputsb[i];
	#50
	
	if (sum0==sum1) begin
    		#5 $display("the sums are equal");
	end
	else begin
		#5 $display("the sums are not equal");
	end
  end

end

endmodule