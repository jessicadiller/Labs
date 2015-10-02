// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module FullAdder1bit //1 bit full adder module
(
//initializing inputs and outputs
output sum, 
output carryout, 
output overflow,
input a,
input b
);

assign carryin = 0; //set carryin to 0 so as to enable carryin when stacking modules but not needed for a single bit adder
//the components of the adders
`XOR xor1(aXORb, a, b); 
`AND and1(aANDb, a, b);
`AND and2(aXORbANDcarryin, aXORb, carryin);
`OR or1(carryout, aXORbANDcarryin, aANDb);
`XOR xor2(sum, aXORb, carryin);
//determining whether overflow occurs
`XOR xoroverflow(overflow, carryin, carryout);

endmodule

module FullAdder4bit //4 bit adder
(
//initializing inputs and outputs, sum, a and b are combined into busses
output[3:0] sum,
output carryout, 
output overflow,
input[3:0] a,
input[3:0] b
);

assign carryin0 = 0; //assigning carryin for the least siginificant bit to 0
//general format for gates: [gatename][bit#][gate# of that type]

//adding the least significant bit
`XOR xor01(a0XORb0, a[0], b[0]);
`AND and01(a0ANDb0, a[0], b[0]);
`AND and02(a0XORb0ANDcarryin0, a0XORb0, carryin0);
`OR or0(carryin1, a0XORb0ANDcarryin0, a0ANDb0);
`XOR xor02(sum[0], a0XORb0, carryin0);

//adding second bit
`XOR xor11(a1XORb1, a[1], b[1]);
`AND and11(a1ANDb1, a[1], b[1]);
`AND and12(a1XORb1ANDcarryin1, a1XORb1, carryin1);
`OR or1(carryin2, a1XORb1ANDcarryin1, a1ANDb1);
`XOR xor12(sum[1], a1XORb1, carryin1);

//adding third bit
`XOR xor21(a2XORb2, a[2], b[2]);
`AND and21(a2ANDb2, a[2], b[2]);
`AND and22(a2XORb2ANDcarryin2, a2XORb2, carryin2);
`OR or2(carryin3, a2XORb2ANDcarryin2, a2ANDb2);
`XOR xor22(sum[2], a2XORb2, carryin2);

//adding most significant bit
`XOR xor31(a3XORb3, a[3], b[3]);
`AND and31(a3ANDb3, a[3], b[3]);
`AND and32(a3XORb3ANDcarryin3, a3XORb3, carryin3);
`OR or3(carryout, a3XORb3ANDcarryin3, a3ANDb3);
`XOR xor32(sum[3], a3XORb3, carryin3);

//calculating whether overflow occured by looking at the carryin and carryout for the most significant bit. Returns 1 if overflow occured
`XOR xoroverflow(overflow, carryin3, carryout);

endmodule

module testFullAdder; //module to test the 4bit adder
reg[3:0] a; 
reg[3:0] b;
wire[3:0] sum; 
wire carryout, overflow;
FullAdder4bit adder (sum[3:0], carryout, overflow, a[3:0], b[3:0]);

//truth table test cases display
initial begin
$display("   A     B  |  Sum  Cout| Overflow | Expected Output (carryout) | Expected overflow");
//All 0000
a[3]=0;a[2]=0;a[1]=0;a[0]=0;b[3]=0;b[2]=0;b[1]=0;b[0]=0; #1000 
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0000 (0) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
//All 1111
a[3]=1;a[2]=1;a[1]=1;a[0]=1;b[3]=1;b[2]=1;b[1]=1;b[0]=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1111 (1) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
//Positive + Positive, no overflow, no carryout
a[3]=0;a[2]=0;a[1]=0;a[0]=1;b[3]=0;b[2]=0;b[1]=1;b[0]=0; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0011 (0) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
//Positive + Positive, overflow, no carryout
a[3]=0;a[2]=0;a[1]=1;a[0]=1;b[3]=0;b[2]=1;b[1]=0;b[0]=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1000 (0) | 1 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
//Negative + Negative, no overflow, carryout
a[3]=1;a[2]=1;a[1]=1;a[0]=1;b[3]=1;b[2]=1;b[1]=1;b[0]=0; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1101 (1) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
//Negative + Negative, overflow, carryout
a[3]=1;a[2]=0;a[1]=1;a[0]=1;b[3]=1;b[2]=1;b[1]=0;b[0]=0; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0111 (1) | 1 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
//Positive + Negative, no overflow, no carryout
a[3]=1;a[2]=0;a[1]=1;a[0]=1;b[3]=0;b[2]=0;b[1]=1;b[0]=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1110 (0) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
//Positive + Negative, no overflow, carryout
a[3]=1;a[2]=1;a[1]=0;a[0]=1;b[3]=0;b[2]=1;b[1]=1;b[0]=0; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0011 (1) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
//Randoms from here down
a[3]=1;a[2]=1;a[1]=1;a[0]=0;b[3]=0;b[2]=1;b[1]=1;b[0]=0; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0100 (1) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
a[3]=0;a[2]=1;a[1]=0;a[0]=0;b[3]=1;b[2]=1;b[1]=1;b[0]=0; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0010 (1) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
a[3]=1;a[2]=1;a[1]=0;a[0]=0;b[3]=0;b[2]=0;b[1]=1;b[0]=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1111 (0) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
a[3]=1;a[2]=0;a[1]=0;a[0]=0;b[3]=0;b[2]=1;b[1]=0;b[0]=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1101 (0) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
a[3]=0;a[2]=0;a[1]=1;a[0]=1;b[3]=0;b[2]=1;b[1]=0;b[0]=0; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0111 (0) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
a[3]=0;a[2]=1;a[1]=0;a[0]=1;b[3]=0;b[2]=1;b[1]=1;b[0]=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1100 (0) | 1 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
a[3]=1;a[2]=0;a[1]=0;a[0]=0;b[3]=1;b[2]=1;b[1]=1;b[0]=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0111 (1) | 1 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);
a[3]=1;a[2]=1;a[1]=1;a[0]=0;b[3]=1;b[2]=0;b[1]=1;b[0]=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1001 (1) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum[3], sum[2], sum[1], sum[0], carryout, overflow);

end

endmodule
