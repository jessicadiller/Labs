// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module structural4bitFullAdder(sum0, sum1, sum2, sum3, carryout3, a[3:0], b[3:0], overflow, carryin1);
output sum0, sum1, sum2, sum3, carryout3, overflow, carryin1;
input[3:0] a;
input[3:0] b;

assign carryin0 = 0;

`XOR xor01(a0XORb0, a[0], b[0]);
`AND and01(a0ANDb0, a[0], b[0]);
`AND and02(a0XORb0ANDcarryin0, a0XORb0, carryin0);
`OR or0(carryin1, a0XORb0ANDcarryin0, a0ANDb0);
`XOR xor02(sum0, a0XORb0, carryin0);
wire sum0;
wire carryin1;

`XOR xor11(a1XORb1, a[1], b[1]);
`AND and11(a1ANDb1, a[1], b[1]);
`AND and12(a1XORb1ANDcarryin1, a1XORb1, carryin1);
`OR or1(carryin2, a1XORb1ANDcarryin1, a1ANDb1);
`XOR xor12(sum1, a1XORb1, carryin1);
wire sum1;

`XOR xor21(a2XORb2, a[2], b[2]);
`AND and21(a2ANDb2, a[2], b[2]);
`AND and22(a2XORb2ANDcarryin2, a2XORb2, carryin2);
`OR or2(carryin3, a2XORb2ANDcarryin2, a2ANDb2);
`XOR xor22(sum2, a2XORb2, carryin2);
wire sum2;

`XOR xor31(a3XORb3, a[3], b[3]);
`AND and31(a3ANDb3, a[3], b[3]);
`AND and32(a3XORb3ANDcarryin3, a3XORb3, carryin3);
`OR or3(carryout3, a3XORb3ANDcarryin3, a3ANDb3);
wire carryout3;
`XOR xor32(sum3, a3XORb3, carryin3);
wire sum3;

`XOR xoroverflow(overflow, carryin3, carryout3);
wire overflow;

endmodule

module testFullAdder;
reg[3:0] a;
reg[3:0] b;
wire sum0, sum1, sum2, sum3, carryout3, overflow, carryin1;
structural4bitFullAdder adder (sum0, sum1, sum2, sum3, carryout3, a[3:0], b[3:0], overflow, carryin1);

initial begin
$display("   A     B  |  Sum  Cout| Overflow | Expected Output (carryout) | Expected overflow");
a[0]=0;a[1]=0;a[2]=0;a[3]=0;b[0]=0;b[1]=0;b[2]=0;b[3]=0; #1000 
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0000 (0) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum3, sum2, sum1, sum0, carryout3, overflow);
//this line should produce overflow
a[0]=1;a[1]=0;a[2]=1;a[3]=0;b[0]=1;b[1]=1;b[2]=0;b[3]=0; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1000 (0) | 1 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum3, sum2, sum1, sum0, carryout3, overflow);
//this one should also produce overflow
a[0]=1;a[1]=0;a[2]=0;a[3]=1;b[0]=0;b[1]=1;b[2]=1;b[3]=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0111 (1) | 1 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum3, sum2, sum1, sum0, carryout3, overflow);
//this one should make a carryout
a[0]=0;a[1]=1;a[2]=1;a[3]=1;b[0]=0;b[1]=0;b[2]=1;b[3]=1; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 1010 (1) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum3, sum2, sum1, sum0, carryout3, overflow);
a[0]=0;a[1]=1;a[2]=1;a[3]=1;b[0]=0;b[1]=1;b[2]=0;b[3]=0; #1000
$display(" %b%b%b%b  %b%b%b%b |  %b%b%b%b  %b  |    %b     | 0000 (1) | 0 ", a[3], a[2], a[1], a[0], b[3], b[2], b[1], b[0], sum3, sum2, sum1, sum0, carryout3, overflow);

end

endmodule
