// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50
`define NOR nor #330

module ZerosFlag32bit //4 bit adder
(
//initializing inputs and outputs, sum, a and b are combined into busses
output zerosflag,
input[31:0] ALU
);
//NOR everything, if result is 1 all inputs where 0
`NOR norzero(zerosflag, ALU[0], ALU[1], ALU[2], ALU[3], ALU[4], ALU[5], ALU[6], ALU[7], ALU[8], ALU[9], ALU[10], ALU[11], ALU[12], ALU[13], ALU[14], ALU[15], ALU[16], ALU[17], ALU[18], ALU[19], ALU[20], ALU[21], ALU[22], ALU[23], ALU[24], ALU[25], ALU[26], ALU[27], ALU[28], ALU[29], ALU[30], ALU[31]);
endmodule

module testZerosFlag; //module to test the 4bit adder
reg[31:0] ALU; 
wire zerosflag;
ZerosFlag32bit flager (zerosflag, ALU[31:0]);

//truth table test cases display
initial begin
$display("   ALU |  zeroflag expected");
ALU=32'b00111000000000001000001100000000; #1000 
$display(" %b | %b 0 ", ALU, zerosflag);
ALU=32'b00000000000000000000000000000000; #1000 
$display(" %b | %b 1 ", ALU, zerosflag);
ALU=32'b00000000000000001000001100000000; #1000 
$display(" %b | %b 0 ", ALU, zerosflag);
ALU=32'b00000000000000001000001100000001; #1000 
$display(" %b | %b 0 ", ALU, zerosflag);
ALU=32'b10000000000000001000001100000000; #1000 
$display(" %b | %b 0 ", ALU, zerosflag);
ALU=32'b10000000000000000000000000000000; #1000 
$display(" %b | %b 0 ", ALU, zerosflag);



end

endmodule
