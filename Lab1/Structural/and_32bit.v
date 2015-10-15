// define gates with delays
`define AND and #20
//`define OR or #20
//`define NOT not #20
//`define XOR xor #20

module and32bit //32 bit and
(
//initializing inputs and outputs, sum, a and b are combined into busses
output[31:0] out,
input[31:0] a,
input[31:0] b
);

`AND and00(out[0], a[0], b[0]);
`AND and01(out[1], a[1], b[1]);
`AND and02(out[2], a[2], b[2]);
`AND and03(out[3], a[3], b[3]);
`AND and04(out[4], a[4], b[4]);
`AND and05(out[5], a[5], b[5]);
`AND and06(out[6], a[6], b[6]);
`AND and07(out[7], a[7], b[7]);
`AND and08(out[8], a[8], b[8]);
`AND and09(out[9], a[9], b[9]);
`AND and10(out[10], a[10], b[10]);
`AND and11(out[11], a[11], b[11]);
`AND and12(out[12], a[12], b[12]);
`AND and13(out[13], a[13], b[13]);
`AND and14(out[14], a[14], b[14]);
`AND and15(out[15], a[15], b[15]);
`AND and16(out[16], a[16], b[16]);
`AND and17(out[17], a[17], b[17]);
`AND and18(out[18], a[18], b[18]);
`AND and19(out[19], a[19], b[19]);
`AND and20(out[20], a[20], b[20]);
`AND and21(out[21], a[21], b[21]);
`AND and22(out[22], a[22], b[22]);
`AND and23(out[23], a[23], b[23]);
`AND and24(out[24], a[24], b[24]);
`AND and25(out[25], a[25], b[25]);
`AND and26(out[26], a[26], b[26]);
`AND and27(out[27], a[27], b[27]);
`AND and28(out[28], a[28], b[28]);
`AND and29(out[29], a[29], b[29]);
`AND and30(out[30], a[30], b[30]);
`AND and31(out[31], a[31], b[31]);

endmodule


module testAnd32bit; //module to test the 32bit and
reg[31:0] a; 
reg[31:0] b;
wire[31:0] out; 
and32bit and_32bit (out[31:0], a[31:0], b[31:0]);
//truth table test cases display
initial begin
$display("                A                                 B                 |                Out                 |          Expected Output ");
//All ones
a='hffffffff;b='hffffffff; #1000 
$display(" %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b  %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b |  %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b  | 11111111111111111111111111111111 ", a[31], a[30], a[29], a[28], a[27], a[26], a[25], a[24], a[23], a[22], a[21], a[20], a[19], a[18], a[17], a[16], a[15],a[14],a[13],a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4], a[3], a[2], a[1], a[0], b[31], b[30], b[29], b[28], b[27], b[26], b[25], b[24], b[23], b[22], b[21], b[20], b[19], b[18], b[17], b[16], b[15], b[14],b[13],b[12],b[11],b[10],b[9],b[8],b[7],b[6],b[5],b[4], b[3], b[2], b[1], b[0], out[31], out[30], out[29], out[28], out[27], out[26], out[25], out[24], out[23], out[22], out[21], out[20], out[19], out[18], out[17], out[16], out[15],out[14],out[13],out[12],out[11],out[10],out[9],out[8],out[7],out[6],out[5],out[4], out[3], out[2], out[1], out[0], );
//all zeros
a=16'h0;b=16'h0; #1000
$display(" %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b  %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b |  %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b  | 00000000000000000000000000000000 ",  a[31], a[30], a[29], a[28], a[27], a[26], a[25], a[24], a[23], a[22], a[21], a[20], a[19], a[18], a[17], a[16], a[15],a[14],a[13],a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4], a[3], a[2], a[1], a[0], b[31], b[30], b[29], b[28], b[27], b[26], b[25], b[24], b[23], b[22], b[21], b[20], b[19], b[18], b[17], b[16], b[15], b[14],b[13],b[12],b[11],b[10],b[9],b[8],b[7],b[6],b[5],b[4], b[3], b[2], b[1], b[0], out[31], out[30], out[29], out[28], out[27], out[26], out[25], out[24], out[23], out[22], out[21], out[20], out[19], out[18], out[17], out[16], out[15],out[14],out[13],out[12],out[11],out[10],out[9],out[8],out[7],out[6],out[5],out[4], out[3], out[2], out[1], out[0], );
//a is all zeros, b is all ones
a=16'h0;b='hffffffff; #1000
$display(" %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b  %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b |  %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b  | 00000000000000000000000000000000 ",  a[31], a[30], a[29], a[28], a[27], a[26], a[25], a[24], a[23], a[22], a[21], a[20], a[19], a[18], a[17], a[16], a[15],a[14],a[13],a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4], a[3], a[2], a[1], a[0], b[31], b[30], b[29], b[28], b[27], b[26], b[25], b[24], b[23], b[22], b[21], b[20], b[19], b[18], b[17], b[16], b[15], b[14],b[13],b[12],b[11],b[10],b[9],b[8],b[7],b[6],b[5],b[4], b[3], b[2], b[1], b[0], out[31], out[30], out[29], out[28], out[27], out[26], out[25], out[24], out[23], out[22], out[21], out[20], out[19], out[18], out[17], out[16], out[15],out[14],out[13],out[12],out[11],out[10],out[9],out[8],out[7],out[6],out[5],out[4], out[3], out[2], out[1], out[0], );
//a is all ones, b is all zeros
a='hffffffff;b=16'h0; #1000
$display(" %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b  %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b |  %b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b  | 00000000000000000000000000000000 ",  a[31], a[30], a[29], a[28], a[27], a[26], a[25], a[24], a[23], a[22], a[21], a[20], a[19], a[18], a[17], a[16], a[15],a[14],a[13],a[12],a[11],a[10],a[9],a[8],a[7],a[6],a[5],a[4], a[3], a[2], a[1], a[0], b[31], b[30], b[29], b[28], b[27], b[26], b[25], b[24], b[23], b[22], b[21], b[20], b[19], b[18], b[17], b[16], b[15], b[14],b[13],b[12],b[11],b[10],b[9],b[8],b[7],b[6],b[5],b[4], b[3], b[2], b[1], b[0], out[31], out[30], out[29], out[28], out[27], out[26], out[25], out[24], out[23], out[22], out[21], out[20], out[19], out[18], out[17], out[16], out[15],out[14],out[13],out[12],out[11],out[10],out[9],out[8],out[7],out[6],out[5],out[4], out[3], out[2], out[1], out[0], );

end
endmodule

