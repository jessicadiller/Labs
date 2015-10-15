// define gates with delays
`define AND and #20
`define OR or #20
`define NOT not #10
`define XOR xor #50


module SLT32bit 
(
//initializing inputs and outputs, sum, a and b are combined into busses
output[31:0] out,
input[31:0] a,
input[31:0] b
);

//general format for gates: [gatename][bit#][gate# of that type]

assign control = 1;

//adding first bit (bit 0)
`XOR xor0c(b0XORcontrol, b[0], control);
`XOR xor0a(a0XORb0, a[0], b0XORcontrol);
`AND and0a(a0ANDb0, a[0], b0XORcontrol);
`AND and0b(a0XORb0ANDcarryin0, a0XORb0, control);
`OR or0(carryin1, a0XORb0ANDcarryin0, a0ANDb0);


//adding second bit (bit 1)
`XOR xor1c(b1XORcontrol, b[1], control);
`XOR xor1a(a1XORb1, a[1], b1XORcontrol);
`AND and1a(a1ANDb1, a[1], b1XORcontrol);
`AND and1b(a1XORb1ANDcarryin1, a1XORb1, carryin1);
`OR or1(carryin2, a1XORb1ANDcarryin1, a1ANDb1);

//adding third bit (bit 2)
`XOR xor2c(b2XORcontrol, b[2], control);
`XOR xor2a(a2XORb2, a[2], b2XORcontrol);
`AND and2a(a2ANDb2, a[2], b2XORcontrol);
`AND and2b(a2XORb2ANDcarryin2, a2XORb2, carryin2);
`OR or2(carryin3, a2XORb2ANDcarryin2, a2ANDb2);

//(bit 3)
`XOR xor3c(b3XORcontrol, b[3], control);
`XOR xor3a(a3XORb3, a[3], b3XORcontrol);
`AND and3a(a3ANDb3, a[3], b3XORcontrol);
`AND and3b(a3XORb3ANDcarryin3, a3XORb3, carryin3);
`OR or3(carryin4, a3XORb3ANDcarryin3, a3ANDb3);


//(bit 4)
`XOR xor4c(b4XORcontrol, b[4], control);
`XOR xor4a(a4XORb4, a[4], b4XORcontrol);
`AND and4a(a4ANDb4, a[4], b4XORcontrol);
`AND and4b(a4XORb4ANDcarryin4, a4XORb4, carryin4);
`OR or4(carryin5, a4XORb4ANDcarryin4, a4ANDb4);


//(bit 5)
`XOR xor5c(b5XORcontrol, b[5], control);
`XOR xor5a(a5XORb5, a[5], b5XORcontrol);
`AND and5a(a5ANDb5, a[5], b5XORcontrol);
`AND and5b(a5XORb5ANDcarryin5, a5XORb5, carryin5);
`OR or5(carryin6, a5XORb5ANDcarryin5, a5ANDb5);

//(bit 6)
`XOR xor6c(b6XORcontrol, b[6], control);
`XOR xor6a(a6XORb6, a[6], b6XORcontrol);
`AND and6a(a6ANDb6, a[6], b6XORcontrol);
`AND and6b(a6XORb6ANDcarryin6, a6XORb6, carryin6);
`OR or6(carryin7, a6XORb6ANDcarryin6, a6ANDb6);

//(bit 7)
`XOR xor7c(b7XORcontrol, b[7], control);
`XOR xor7a(a7XORb7, a[7], b7XORcontrol);
`AND and7a(a7ANDb7, a[7], b7XORcontrol);
`AND and7b(a7XORb7ANDcarryin7, a7XORb7, carryin7);
`OR or7(carryin8, a7XORb7ANDcarryin7, a7ANDb7);

//(bit 8)
`XOR xor8c(b8XORcontrol, b[8], control);
`XOR xor8a(a8XORb8, a[8], b8XORcontrol);
`AND and8a(a8ANDb8, a[8], b8XORcontrol);
`AND and8b(a8XORb8ANDcarryin8, a8XORb8, carryin8);
`OR or8(carryin9, a8XORb8ANDcarryin8, a8ANDb8);

//(bit 9)
`XOR xor9c(b9XORcontrol, b[9], control);
`XOR xor9a(a9XORb9, a[9], b9XORcontrol);
`AND and9a(a9ANDb9, a[9], b9XORcontrol);
`AND and9b(a9XORb9ANDcarryin9, a9XORb9, carryin9);
`OR or9(carryin10, a9XORb9ANDcarryin9, a9ANDb9);

//(bit 10)
`XOR xor10c(b10XORcontrol, b[10], control);
`XOR xor10a(a10XORb10, a[10], b10XORcontrol);
`AND and10a(a10ANDb10, a[10], b10XORcontrol);
`AND and10b(a10XORb10ANDcarryin10, a10XORb10, carryin10);
`OR or10(carryin11, a10XORb10ANDcarryin10, a10ANDb10);

//(bit 11)
`XOR xor11c(b11XORcontrol, b[11], control);
`XOR xor11a(a11XORb11, a[11], b11XORcontrol);
`AND and11a(a11ANDb11, a[11], b11XORcontrol);
`AND and11b(a11XORb11ANDcarryin11, a11XORb11, carryin11);
`OR or11(carryin12, a11XORb11ANDcarryin11, a11ANDb11);

//(bit 12)
`XOR xor12c(b12XORcontrol, b[12], control);
`XOR xor12a(a12XORb12, a[12], b12XORcontrol);
`AND and12a(a12ANDb12, a[12], b12XORcontrol);
`AND and12b(a12XORb12ANDcarryin12, a12XORb12, carryin12);
`OR or12(carryin13, a12XORb12ANDcarryin12, a12ANDb12);

//(bit 13)
`XOR xor13c(b13XORcontrol, b[13], control);
`XOR xor13a(a13XORb13, a[13], b13XORcontrol);
`AND and13a(a13ANDb13, a[13], b13XORcontrol);
`AND and13b(a13XORb13ANDcarryin13, a13XORb13, carryin13);
`OR or13(carryin14, a13XORb13ANDcarryin13, a13ANDb13);

//(bit 14)
`XOR xor14c(b14XORcontrol, b[14], control);
`XOR xor14a(a14XORb14, a[14], b14XORcontrol);
`AND and14a(a14ANDb14, a[14], b14XORcontrol);
`AND and14b(a14XORb14ANDcarryin14, a14XORb14, carryin14);
`OR or14(carryin15, a14XORb14ANDcarryin14, a14ANDb14);

//(bit 15)
`XOR xor15c(b15XORcontrol, b[15], control);
`XOR xor15a(a15XORb15, a[15], b15XORcontrol);
`AND and15a(a15ANDb15, a[15], b15XORcontrol);
`AND and15b(a15XORb15ANDcarryin15, a15XORb15, carryin15);
`OR or15(carryin16, a15XORb15ANDcarryin15, a15ANDb15);

//(bit 16)
`XOR xor16c(b16XORcontrol, b[16], control);
`XOR xor16a(a16XORb16, a[16], b16XORcontrol);
`AND and16a(a16ANDb16, a[16], b16XORcontrol);
`AND and16b(a16XORb16ANDcarryin16, a16XORb16, carryin16);
`OR or16(carryin17, a16XORb16ANDcarryin16, a16ANDb16);

//(bit 17)
`XOR xor17c(b17XORcontrol, b[17], control);
`XOR xor17a(a17XORb17, a[17], b17XORcontrol);
`AND and17a(a17ANDb17, a[17], b17XORcontrol);
`AND and17b(a17XORb17ANDcarryin17, a17XORb17, carryin17);
`OR or17(carryin18, a17XORb17ANDcarryin17, a17ANDb17);

//(bit 18)
`XOR xor18c(b18XORcontrol, b[18], control);
`XOR xor18a(a18XORb18, a[18], b18XORcontrol);
`AND and18a(a18ANDb18, a[18], b18XORcontrol);
`AND and18b(a18XORb18ANDcarryin18, a18XORb18, carryin18);
`OR or18(carryin19, a18XORb18ANDcarryin18, a18ANDb18);

//(bit 19)
`XOR xor19c(b19XORcontrol, b[19], control);
`XOR xor19a(a19XORb19, a[19], b19XORcontrol);
`AND and19a(a19ANDb19, a[19], b19XORcontrol);
`AND and19b(a19XORb19ANDcarryin19, a19XORb19, carryin19);
`OR or19(carryin20, a19XORb19ANDcarryin19, a19ANDb19);

//(bit 20)
`XOR xor20c(b20XORcontrol, b[20], control);
`XOR xor20a(a20XORb20, a[20], b20XORcontrol);
`AND and20a(a20ANDb20, a[20], b20XORcontrol);
`AND and20b(a20XORb20ANDcarryin20, a20XORb20, carryin20);
`OR or20(carryin21, a20XORb20ANDcarryin20, a20ANDb20);

//(bit 21)
`XOR xor21c(b21XORcontrol, b[21], control);
`XOR xor21a(a21XORb21, a[21], b21XORcontrol);
`AND and21a(a21ANDb21, a[21], b21XORcontrol);
`AND and21b(a21XORb21ANDcarryin21, a21XORb21, carryin21);
`OR or21(carryin22, a21XORb21ANDcarryin21, a21ANDb21);

//(bit 22)
`XOR xor22c(b22XORcontrol, b[22], control);
`XOR xor22a(a22XORb22, a[22], b22XORcontrol);
`AND and22a(a22ANDb22, a[22], b22XORcontrol);
`AND and22b(a22XORb22ANDcarryin22, a22XORb22, carryin22);
`OR or22(carryin23, a22XORb22ANDcarryin22, a22ANDb22);

//(bit 23)
`XOR xor23c(b23XORcontrol, b[23], control);
`XOR xor23a(a23XORb23, a[23], b23XORcontrol);
`AND and23a(a23ANDb23, a[23], b23XORcontrol);
`AND and23b(a23XORb23ANDcarryin23, a23XORb23, carryin23);
`OR or23(carryin24, a23XORb23ANDcarryin23, a23ANDb23);

//(bit 24)
`XOR xor24c(b24XORcontrol, b[24], control);
`XOR xor24a(a24XORb24, a[24], b24XORcontrol);
`AND and24a(a24ANDb24, a[24], b24XORcontrol);
`AND and24b(a24XORb24ANDcarryin24, a24XORb24, carryin24);
`OR or24(carryin25, a24XORb24ANDcarryin24, a24ANDb24);

//(bit 25)
`XOR xor25c(b25XORcontrol, b[25], control);
`XOR xor25a(a25XORb25, a[25], b25XORcontrol);
`AND and25a(a25ANDb25, a[25], b25XORcontrol);
`AND and25b(a25XORb25ANDcarryin25, a25XORb25, carryin25);
`OR or25(carryin26, a25XORb25ANDcarryin25, a25ANDb25);

//(bit 26)
`XOR xor26c(b26XORcontrol, b[26], control);
`XOR xor26a(a26XORb26, a[26], b26XORcontrol);
`AND and26a(a26ANDb26, a[26], b26XORcontrol);
`AND and26b(a26XORb26ANDcarryin26, a26XORb26, carryin26);
`OR or26(carryin27, a26XORb26ANDcarryin26, a26ANDb26);

//(bit 27)
`XOR xor27c(b27XORcontrol, b[27], control);
`XOR xor27a(a27XORb27, a[27], b27XORcontrol);
`AND and27a(a27ANDb27, a[27], b27XORcontrol);
`AND and27b(a27XORb27ANDcarryin27, a27XORb27, carryin27);
`OR or27(carryin28, a27XORb27ANDcarryin27, a27ANDb27);

//(bit 28)
`XOR xor28c(b28XORcontrol, b[28], control);
`XOR xor28a(a28XORb28, a[28], b28XORcontrol);
`AND and28a(a28ANDb28, a[28], b28XORcontrol);
`AND and28b(a28XORb28ANDcarryin28, a28XORb28, carryin28);
`OR or28(carryin29, a28XORb28ANDcarryin28, a28ANDb28);

//(bit 29)
`XOR xor29c(b29XORcontrol, b[29], control);
`XOR xor29a(a29XORb29, a[29], b29XORcontrol);
`AND and29a(a29ANDb29, a[29], b29XORcontrol);
`AND and29b(a29XORb29ANDcarryin29, a29XORb29, carryin29);
`OR or29(carryin30, a29XORb29ANDcarryin29, a29ANDb29);

//(bit 30)
`XOR xor30c(b30XORcontrol, b[30], control);
`XOR xor30a(a30XORb30, a[30], b30XORcontrol);
`AND and30a(a30ANDb30, a[30], b30XORcontrol);
`AND and30b(a30XORb30ANDcarryin30, a30XORb30, carryin30);
`OR or30(carryin31, a30XORb30ANDcarryin30, a30ANDb30);

//adding most significant bit (bit 31)
`XOR xor31c(b31XORcontrol, b[31], control);
`XOR xor31a(a31XORb31, a[31], b31XORcontrol);
`AND and31a(a31ANDb31, a[31], b31XORcontrol);
`AND and31b(a31XORb31ANDcarryin31, a31XORb31, carryin31);
`OR or31(carryout, a31XORb31ANDcarryin31, a31ANDb31);
`XOR xor31b(sum31, a31XORb31, carryin31);

//calculating whether overflow occured by looking at the carryin and carryout for the most significant bit. Returns 1 if overflow occured
`XOR xoroverflow(overflow, carryin31, carryout);

assign out[31:1]=0;

//calculate the SLT result
`XOR xorslt(out[0], overflow, sum31);


endmodule

module testSLT32bit; //module to test the 4bit adder
reg[31:0] a; 
reg[31:0] b;
wire[31:0] out; 
SLT32bit slt (out[31:0], a[31:0], b[31:0]);

//truth table test cases display
initial begin
$display("   A     B   Control|  Sum  |  Cout   Overflow | Expected Output (carryout) | Expected overflow");
//All 0000
a=00000000000000000000000000000000; b=00000000000000000000000000000000; #2000 
$display(" %b %b |  %b  ", a, b, out);
a=32'b11111110000101110000111000010111; b=32'b00001110000101110000110000100011;  #20000  //236391959-236391459=500
$display(" %b %b |  %b  ", a, b, out);
a=32'b00001110000101110000110000100011; b=32'b11111110000101110000111000010111; #2000
$display(" %b %b |  %b  ", a, b, out);
end

endmodule
