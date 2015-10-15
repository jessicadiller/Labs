// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module FullAdder32bit //4 bit adder
(
//initializing inputs and outputs, sum, a and b are combined into busses
output[31:0] sum,
output carryout, 
output overflow,
input[31:0] a,
input[31:0] b
);

assign carryin0 = 1; //assigning carryin for the least siginificant bit to 0
//general format for gates: [gatename][bit#][gate# of that type]

//adding first bit (bit 0)
`NOT 
`XOR xor0a(a0XORb0, a[0], b[0]);
`AND and0a(a0ANDb0, a[0], b[0]);
`AND and0b(a0XORb0ANDcarryin0, a0XORb0, carryin0);
`OR or0(carryin1, a0XORb0ANDcarryin0, a0ANDb0);
`XOR xor0b(sum[0], a0XORb0, carryin0);

//adding second bit (bit 1)
`XOR xor1a(a1XORb1, a[1], b[1]);
`AND and1a(a1ANDb1, a[1], b[1]);
`AND and1b(a1XORb1ANDcarryin1, a1XORb1, carryin1);
`OR or1(carryin2, a1XORb1ANDcarryin1, a1ANDb1);
`XOR xor1b(sum[1], a1XORb1, carryin1);

//adding third bit (bit 2)
`XOR xor2a(a2XORb2, a[2], b[2]);
`AND and2a(a2ANDb2, a[2], b[2]);
`AND and2b(a2XORb2ANDcarryin2, a2XORb2, carryin2);
`OR or2(carryin3, a2XORb2ANDcarryin2, a2ANDb2);
`XOR xor2b(sum[2], a2XORb2, carryin2);

//(bit 3)
`XOR xor3a(a3XORb3, a[3], b[3]);
`AND and3a(a3ANDb3, a[3], b[3]);
`AND and3b(a3XORb3ANDcarryin3, a3XORb3, carryin3);
`OR or3(carryin4, a3XORb3ANDcarryin3, a3ANDb3);
`XOR xor3b(sum[3], a3XORb3, carryin3);

//(bit 4)
`XOR xor4a(a4XORb4, a[4], b[4]);
`AND and4a(a4ANDb4, a[4], b[4]);
`AND and4b(a4XORb4ANDcarryin4, a4XORb4, carryin4);
`OR or4(carryin5, a4XORb4ANDcarryin4, a4ANDb4);
`XOR xor4b(sum[4], a4XORb4, carryin4);

//(bit 5)
`XOR xor5a(a5XORb5, a[5], b[5]);
`AND and5a(a5ANDb5, a[5], b[5]);
`AND and5b(a5XORb5ANDcarryin5, a5XORb5, carryin5);
`OR or5(carryin6, a5XORb5ANDcarryin5, a5ANDb5);
`XOR xor5b(sum[5], a5XORb5, carryin5);

//(bit 6)
`XOR xor6a(a6XORb6, a[6], b[6]);
`AND and6a(a6ANDb6, a[6], b[6]);
`AND and6b(a6XORb6ANDcarryin6, a6XORb6, carryin6);
`OR or6(carryin7, a6XORb6ANDcarryin6, a6ANDb6);
`XOR xor6b(sum[6], a6XORb6, carryin6);

//(bit 7)
`XOR xor7a(a7XORb7, a[7], b[7]);
`AND and7a(a7ANDb7, a[7], b[7]);
`AND and7b(a7XORb7ANDcarryin7, a7XORb7, carryin7);
`OR or7(carryin8, a7XORb7ANDcarryin7, a7ANDb7);
`XOR xor7b(sum[7], a7XORb7, carryin7);

//(bit 8)
`XOR xor8a(a8XORb8, a[8], b[8]);
`AND and8a(a8ANDb8, a[8], b[8]);
`AND and8b(a8XORb8ANDcarryin8, a8XORb8, carryin8);
`OR or8(carryin9, a8XORb8ANDcarryin8, a8ANDb8);
`XOR xor8b(sum[8], a8XORb8, carryin8);

//(bit 9)
`XOR xor9a(a9XORb9, a[9], b[9]);
`AND and9a(a9ANDb9, a[9], b[9]);
`AND and9b(a9XORb9ANDcarryin9, a9XORb9, carryin9);
`OR or9(carryin10, a9XORb9ANDcarryin9, a9ANDb9);
`XOR xor9b(sum[9], a9XORb9, carryin9);

//(bit 10)
`XOR xor10a(a10XORb10, a[10], b[10]);
`AND and10a(a10ANDb10, a[10], b[10]);
`AND and10b(a10XORb10ANDcarryin10, a10XORb10, carryin10);
`OR or10(carryin11, a10XORb10ANDcarryin10, a10ANDb10);
`XOR xor10b(sum[10], a10XORb10, carryin10);

//(bit 11)
`XOR xor11a(a11XORb11, a[11], b[11]);
`AND and11a(a11ANDb11, a[11], b[11]);
`AND and11b(a11XORb11ANDcarryin11, a11XORb11, carryin11);
`OR or11(carryin12, a11XORb11ANDcarryin11, a11ANDb11);
`XOR xor11b(sum[11], a11XORb11, carryin11);

//(bit 12)
`XOR xor12a(a12XORb12, a[12], b[12]);
`AND and12a(a12ANDb12, a[12], b[12]);
`AND and12b(a12XORb12ANDcarryin12, a12XORb12, carryin12);
`OR or12(carryin13, a12XORb12ANDcarryin12, a12ANDb12);
`XOR xor12b(sum[12], a12XORb12, carryin12);

//(bit 13)
`XOR xor13a(a13XORb13, a[13], b[13]);
`AND and13a(a13ANDb13, a[13], b[13]);
`AND and13b(a13XORb13ANDcarryin13, a13XORb13, carryin13);
`OR or13(carryin14, a13XORb13ANDcarryin13, a13ANDb13);
`XOR xor13b(sum[13], a13XORb13, carryin13);

//(bit 14)
`XOR xor14a(a14XORb14, a[14], b[14]);
`AND and14a(a14ANDb14, a[14], b[14]);
`AND and14b(a14XORb14ANDcarryin14, a14XORb14, carryin14);
`OR or14(carryin15, a14XORb14ANDcarryin14, a14ANDb14);
`XOR xor14b(sum[14], a14XORb14, carryin14);

//(bit 15)
`XOR xor15a(a15XORb15, a[15], b[15]);
`AND and15a(a15ANDb15, a[15], b[15]);
`AND and15b(a15XORb15ANDcarryin15, a15XORb15, carryin15);
`OR or15(carryin16, a15XORb15ANDcarryin15, a15ANDb15);
`XOR xor15b(sum[15], a15XORb15, carryin15);

//(bit 16)
`XOR xor16a(a16XORb16, a[16], b[16]);
`AND and16a(a16ANDb16, a[16], b[16]);
`AND and16b(a16XORb16ANDcarryin16, a16XORb16, carryin16);
`OR or16(carryin17, a16XORb16ANDcarryin16, a16ANDb16);
`XOR xor16b(sum[16], a16XORb16, carryin16);

//(bit 17)
`XOR xor17a(a17XORb17, a[17], b[17]);
`AND and17a(a17ANDb17, a[17], b[17]);
`AND and17b(a17XORb17ANDcarryin17, a17XORb17, carryin17);
`OR or17(carryin18, a17XORb17ANDcarryin17, a17ANDb17);
`XOR xor17b(sum[17], a17XORb17, carryin17);

//(bit 18)
`XOR xor18a(a18XORb18, a[18], b[18]);
`AND and18a(a18ANDb18, a[18], b[18]);
`AND and18b(a18XORb18ANDcarryin18, a18XORb18, carryin18);
`OR or18(carryin19, a18XORb18ANDcarryin18, a18ANDb18);
`XOR xor18b(sum[18], a18XORb18, carryin18);

//(bit 19)
`XOR xor19a(a19XORb19, a[19], b[19]);
`AND and19a(a19ANDb19, a[19], b[19]);
`AND and19b(a19XORb19ANDcarryin19, a19XORb19, carryin19);
`OR or19(carryin20, a19XORb19ANDcarryin19, a19ANDb19);
`XOR xor19b(sum[19], a19XORb19, carryin19);

//(bit 20)
`XOR xor20a(a20XORb20, a[20], b[20]);
`AND and20a(a20ANDb20, a[20], b[20]);
`AND and20b(a20XORb20ANDcarryin20, a20XORb20, carryin20);
`OR or20(carryin21, a20XORb20ANDcarryin20, a20ANDb20);
`XOR xor20b(sum[20], a20XORb20, carryin20);

//(bit 21)
`XOR xor21a(a21XORb21, a[21], b[21]);
`AND and21a(a21ANDb21, a[21], b[21]);
`AND and21b(a21XORb21ANDcarryin21, a21XORb21, carryin21);
`OR or21(carryin22, a21XORb21ANDcarryin21, a21ANDb21);
`XOR xor21b(sum[21], a21XORb21, carryin21);

//(bit 22)
`XOR xor22a(a22XORb22, a[22], b[22]);
`AND and22a(a22ANDb22, a[22], b[22]);
`AND and22b(a22XORb22ANDcarryin22, a22XORb22, carryin22);
`OR or22(carryin23, a22XORb22ANDcarryin22, a22ANDb22);
`XOR xor22b(sum[22], a22XORb22, carryin22);

//(bit 23)
`XOR xor23a(a23XORb23, a[23], b[23]);
`AND and23a(a23ANDb23, a[23], b[23]);
`AND and23b(a23XORb23ANDcarryin23, a23XORb23, carryin23);
`OR or23(carryin24, a23XORb23ANDcarryin23, a23ANDb23);
`XOR xor23b(sum[23], a23XORb23, carryin23);

//(bit 24)
`XOR xor24a(a24XORb24, a[24], b[24]);
`AND and24a(a24ANDb24, a[24], b[24]);
`AND and24b(a24XORb24ANDcarryin24, a24XORb24, carryin24);
`OR or24(carryin25, a24XORb24ANDcarryin24, a24ANDb24);
`XOR xor24b(sum[24], a24XORb24, carryin24);

//(bit 25)
`XOR xor25a(a25XORb25, a[25], b[25]);
`AND and25a(a25ANDb25, a[25], b[25]);
`AND and25b(a25XORb25ANDcarryin25, a25XORb25, carryin25);
`OR or25(carryin26, a25XORb25ANDcarryin25, a25ANDb25);
`XOR xor25b(sum[25], a25XORb25, carryin25);

//(bit 26)
`XOR xor26a(a26XORb26, a[26], b[26]);
`AND and26a(a26ANDb26, a[26], b[26]);
`AND and26b(a26XORb26ANDcarryin26, a26XORb26, carryin26);
`OR or26(carryin27, a26XORb26ANDcarryin26, a26ANDb26);
`XOR xor26b(sum[26], a26XORb26, carryin26);

//(bit 27)
`XOR xor27a(a27XORb27, a[27], b[27]);
`AND and27a(a27ANDb27, a[27], b[27]);
`AND and27b(a27XORb27ANDcarryin27, a27XORb27, carryin27);
`OR or27(carryin28, a27XORb27ANDcarryin27, a27ANDb27);
`XOR xor27b(sum[27], a27XORb27, carryin27);

//(bit 28)
`XOR xor28a(a28XORb28, a[28], b[28]);
`AND and28a(a28ANDb28, a[28], b[28]);
`AND and28b(a28XORb28ANDcarryin28, a28XORb28, carryin28);
`OR or28(carryin29, a28XORb28ANDcarryin28, a28ANDb28);
`XOR xor28b(sum[28], a28XORb28, carryin28);

//(bit 29)
`XOR xor29a(a29XORb29, a[29], b[29]);
`AND and29a(a29ANDb29, a[29], b[29]);
`AND and29b(a29XORb29ANDcarryin29, a29XORb29, carryin29);
`OR or29(carryin30, a29XORb29ANDcarryin29, a29ANDb29);
`XOR xor29b(sum[29], a29XORb29, carryin29);

//(bit 30)
`XOR xor30a(a30XORb30, a[30], b[30]);
`AND and30a(a30ANDb30, a[30], b[30]);
`AND and30b(a30XORb30ANDcarryin30, a30XORb30, carryin30);
`OR or30(carryin31, a30XORb30ANDcarryin30, a30ANDb30);
`XOR xor30b(sum[30], a30XORb30, carryin30);

//adding most significant bit (bit 31)
`XOR xor31a(a31XORb31, a[31], b[31]);
`AND and31a(a31ANDb31, a[31], b[31]);
`AND and31b(a31XORb31ANDcarryin31, a31XORb31, carryin31);
`OR or31(carryout, a31XORb31ANDcarryin31, a31ANDb31);
`XOR xor31b(sum[31], a31XORb31, carryin31);

//calculating whether overflow occured by looking at the carryin and carryout for the most significant bit. Returns 1 if overflow occured
`XOR xoroverflow(overflow, carryin31, carryout);

endmodule

module testFullAdder; //module to test the 4bit adder
reg[31:0] a; 
reg[31:0] b;
wire[31:0] sum; 
wire carryout, overflow;
FullAdder4bit adder (sum[31:0], carryout, overflow, a[31:0], b[31:0]);

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
