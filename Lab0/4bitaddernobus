// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50


module structural4bitFullAdder(sum0, sum1, sum2, sum3, carryout3, a0, a1, a2, a3, b0, b1, b2, b3, overflow, carryin1);
output sum0, sum1, sum2, sum3, carryout3, overflow, carryin1;
input a0, a1, a2, a3, b0, b1, b2, b3;

assign carryin0 = 0;

`XOR xor01(a0XORb0, a0, b0);
`AND and01(a0ANDb0, a0, b0);
`AND and02(a0XORb0ANDcarryin0, a0XORb0, carryin0);
`OR or0(carryin1, a0XORb0ANDcarryin0, a0ANDb0);
`XOR xor02(sum0, a0XORb0, carryin0);
wire sum0;
wire carryin1;

`XOR xor11(a1XORb1, a1, b1);
`AND and11(a1ANDb1, a1, b1);
`AND and12(a1XORb1ANDcarryin1, a1XORb1, carryin1);
`OR or1(carryin2, a1XORb1ANDcarryin1, a1ANDb1);
`XOR xor12(sum1, a1XORb1, carryin1);
wire sum1;

`XOR xor21(a2XORb2, a2, b2);
`AND and21(a2ANDb2, a2, b2);
`AND and22(a2XORb2ANDcarryin2, a2XORb2, carryin2);
`OR or2(carryin3, a2XORb2ANDcarryin2, a2ANDb2);
`XOR xor22(sum2, a2XORb2, carryin2);
wire sum2;

`XOR xor31(a3XORb3, a3, b3);
`AND and31(a3ANDb3, a3, b3);
`AND and32(a3XORb3ANDcarryin3, a3XORb3, carryin3);
`OR or3(carryout3, a3XORb3ANDcarryin3, a3ANDb3);
wire carryout3;
`XOR xor32(sum3, a3XORb3, carryin3);
wire sum3;

`XOR xoroverflow(overflow, carryin3, carryout3);
wire overflow;

endmodule

module testFullAdder;
reg a0, a1, a2, a3, b0, b1, b2, b3;
wire sum0, sum1, sum2, sum3, carryout3, overflow, carryin1;
structural4bitFullAdder adder (sum0, sum1, sum2, sum3, carryout3, a0, a1, a2, a3, b0, b1, b2, b3, overflow, carryin1);

initial begin
$display("   A     B  |  Sum  Cout| Overflow | Expected Output (carryout) | Expected overflow");
a0=0;a1=0;a2=0;a3=0;b0=0;b1=0;b2=0;b3=0; #1000 
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0000 (0) | 0 ", a3, a2, a1, a0, b3, b2, b1, b0, sum3, sum2, sum1, sum0, carryout3, overflow);
//this line should produce overflow
a0=1;a1=0;a2=1;a3=0;b0=1;b1=1;b2=0;b3=0; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1000 (0) | 1 ", a3, a2, a1, a0, b3, b2, b1, b0, sum3, sum2, sum1, sum0, carryout3, overflow);
//this one should also produce overflow
a0=1;a1=0;a2=0;a3=1;b0=0;b1=1;b2=1;b3=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0111 (1) | 1 ", a3, a2, a1, a0, b3, b2, b1, b0, sum3, sum2, sum1, sum0, carryout3, overflow);
//this one should make a carryout
a0=0;a1=1;a2=1;a3=1;b0=0;b1=0;b2=1;b3=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1010 (1) | 0 ", a3, a2, a1, a0, b3, b2, b1, b0, sum3, sum2, sum1, sum0, carryout3, overflow);
a0=0;a1=1;a2=1;a3=1;b0=0;b1=1;b2=0;b3=0; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0000 (1) | 0 ", a3, a2, a1, a0, b3, b2, b1, b0, sum3, sum2, sum1, sum0, carryout3, overflow);

end

endmodule
