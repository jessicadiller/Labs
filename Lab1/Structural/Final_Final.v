`define ADD_lut  3'd0
`define SUB_lut  3'd1
`define XOR_lut  3'd2
`define SLT_lut  3'd3
`define AND_lut  3'd4
`define NAND_lut 3'd5
`define NOR_lut  3'd6
`define OR_lut   3'd7

// define gates with delays
`define AND and #20
`define OR or #20
`define NOT not #10
`define XOR xor #50
`define NAND nand #30
`define NOR nor #30

module ALU
(
output[31:0]    result,
output          carryout,
output          zero,
output          overflow,
input[31:0]     operandA,
input[31:0]     operandB,
input[2:0]      command,
output[2:0]  	muxindex,
output 		invertB
);

//all of the buses to hold result from individual operations before we put them into the mux
wire[31:0] and_output;
wire[31:0] or_output;
wire[31:0] nand_output;
wire[31:0] nor_output;
wire[31:0] xor_output;
wire[31:0] add_sub_output;
wire[31:0] slt_output;


ALUcontrolLUT lut(muxindex, invertB, command);


//instantiate the structural operations like this
and32bit struct_and(and_output, operandA, operandB);
or32bit struct_or(or_output, operandA, operandB);
nand32bit struct_nand(nand_output, operandA, operandB);
nor32bit struct_nor(nor_output, operandA, operandB);
xor32bit struct_xor(xor_output, operandA, operandB);
FullAddSubtract32bit struct_add_sub(add_sub_output, carryout, overflow, operandA, operandB, invertB);
SLT32bit struct_slt(slt_output, operandA, operandB);
ZeroFlag32bit struct_zeroflag(zero, result);


//now we need 32 muxes to simulate one big bus mux
//each mux will calculate one bit of the result output
//alllllll of the muxes to simulate a 32 bit bus mux

structMux mux0(result[0], muxindex[0], muxindex[1],muxindex[2], add_sub_output[0],  xor_output[0], slt_output[0],and_output[0], nand_output[0], nor_output[0], or_output[0]);
structMux mux1(result[1], muxindex[0], muxindex[1],muxindex[2], add_sub_output[1],  xor_output[1], slt_output[1],and_output[1], nand_output[1], nor_output[1], or_output[1]);
structMux mux2(result[2], muxindex[0], muxindex[1],muxindex[2], add_sub_output[2],  xor_output[2], slt_output[2],and_output[2], nand_output[2], nor_output[2], or_output[2]);
structMux mux3(result[3], muxindex[0], muxindex[1],muxindex[2], add_sub_output[3],  xor_output[3], slt_output[3],and_output[3], nand_output[3], nor_output[3], or_output[3]);
structMux mux4(result[4], muxindex[0], muxindex[1],muxindex[2], add_sub_output[4],  xor_output[4], slt_output[4],and_output[4], nand_output[4], nor_output[4], or_output[4]);
structMux mux5(result[5], muxindex[0], muxindex[1],muxindex[2], add_sub_output[5],  xor_output[5], slt_output[5],and_output[5], nand_output[5], nor_output[5], or_output[5]);
structMux mux6(result[6], muxindex[0], muxindex[1],muxindex[2], add_sub_output[6],  xor_output[6], slt_output[6],and_output[6], nand_output[6], nor_output[6], or_output[6]);
structMux mux7(result[7], muxindex[0], muxindex[1],muxindex[2], add_sub_output[7],  xor_output[7], slt_output[7],and_output[7], nand_output[7], nor_output[7], or_output[7]);
structMux mux8(result[8], muxindex[0], muxindex[1],muxindex[2], add_sub_output[8],  xor_output[8], slt_output[8],and_output[8], nand_output[8], nor_output[8], or_output[8]);
structMux mux9(result[9], muxindex[0], muxindex[1],muxindex[2], add_sub_output[9],  xor_output[9], slt_output[9],and_output[9], nand_output[9], nor_output[9], or_output[9]);
structMux mux10(result[10], muxindex[0], muxindex[1],muxindex[2], add_sub_output[10],  xor_output[10], slt_output[10],and_output[10], nand_output[10], nor_output[10], or_output[10]);
structMux mux11(result[11], muxindex[0], muxindex[1],muxindex[2], add_sub_output[11],  xor_output[11], slt_output[11],and_output[11], nand_output[11], nor_output[11], or_output[11]);
structMux mux12(result[12], muxindex[0], muxindex[1],muxindex[2], add_sub_output[12],  xor_output[12], slt_output[12],and_output[12], nand_output[12], nor_output[12], or_output[12]);
structMux mux13(result[13], muxindex[0], muxindex[1],muxindex[2], add_sub_output[13],  xor_output[13], slt_output[13],and_output[13], nand_output[13], nor_output[13], or_output[13]);
structMux mux14(result[14], muxindex[0], muxindex[1],muxindex[2], add_sub_output[14],  xor_output[14], slt_output[14],and_output[14], nand_output[14], nor_output[14], or_output[14]);
structMux mux15(result[15], muxindex[0], muxindex[1],muxindex[2], add_sub_output[15],  xor_output[15], slt_output[15],and_output[15], nand_output[15], nor_output[15], or_output[15]);
structMux mux16(result[16], muxindex[0], muxindex[1],muxindex[2], add_sub_output[16],  xor_output[16], slt_output[16],and_output[16], nand_output[16], nor_output[16], or_output[16]);
structMux mux17(result[17], muxindex[0], muxindex[1],muxindex[2], add_sub_output[17],  xor_output[17], slt_output[17],and_output[17], nand_output[17], nor_output[17], or_output[17]);
structMux mux18(result[18], muxindex[0], muxindex[1],muxindex[2], add_sub_output[18],  xor_output[18], slt_output[18],and_output[18], nand_output[18], nor_output[18], or_output[18]);
structMux mux19(result[19], muxindex[0], muxindex[1],muxindex[2], add_sub_output[19],  xor_output[19], slt_output[19],and_output[19], nand_output[19], nor_output[19], or_output[19]);
structMux mux20(result[20], muxindex[0], muxindex[1],muxindex[2], add_sub_output[20],  xor_output[20], slt_output[20],and_output[20], nand_output[20], nor_output[20], or_output[20]);
structMux mux21(result[21], muxindex[0], muxindex[1],muxindex[2], add_sub_output[21],  xor_output[21], slt_output[21],and_output[21], nand_output[21], nor_output[21], or_output[21]);
structMux mux22(result[22], muxindex[0], muxindex[1],muxindex[2], add_sub_output[22],  xor_output[22], slt_output[22],and_output[22], nand_output[22], nor_output[22], or_output[22]);
structMux mux23(result[23], muxindex[0], muxindex[1],muxindex[2], add_sub_output[23],  xor_output[23], slt_output[23],and_output[23], nand_output[23], nor_output[23], or_output[23]);
structMux mux24(result[24], muxindex[0], muxindex[1],muxindex[2], add_sub_output[24],  xor_output[24], slt_output[24],and_output[24], nand_output[24], nor_output[24], or_output[24]);
structMux mux25(result[25], muxindex[0], muxindex[1],muxindex[2], add_sub_output[25],  xor_output[25], slt_output[25],and_output[25], nand_output[25], nor_output[25], or_output[25]);
structMux mux26(result[26], muxindex[0], muxindex[1],muxindex[2], add_sub_output[26],  xor_output[26], slt_output[26],and_output[26], nand_output[26], nor_output[26], or_output[26]);
structMux mux27(result[27], muxindex[0], muxindex[1],muxindex[2], add_sub_output[27],  xor_output[27], slt_output[27],and_output[27], nand_output[27], nor_output[27], or_output[27]);
structMux mux28(result[28], muxindex[0], muxindex[1],muxindex[2], add_sub_output[28],  xor_output[28], slt_output[28],and_output[28], nand_output[28], nor_output[28], or_output[28]);
structMux mux29(result[29], muxindex[0], muxindex[1],muxindex[2], add_sub_output[29],  xor_output[29], slt_output[29],and_output[29], nand_output[29], nor_output[29], or_output[29]);
structMux mux30(result[30], muxindex[0], muxindex[1],muxindex[2], add_sub_output[30],  xor_output[30], slt_output[30],and_output[30], nand_output[30], nor_output[30], or_output[30]);
structMux mux31(result[31], muxindex[0], muxindex[1],muxindex[2], add_sub_output[31],  xor_output[31], slt_output[31],and_output[31], nand_output[31], nor_output[31], or_output[31]);
endmodule



module ALUcontrolLUT //To control MUX index and Adder or Subtractor
(
output reg[2:0]     	muxindex,
output reg  		invertB,
input[2:0]  		ALUcommand
);
/*This controls the multiplexer that will determine the output of the ALU as well as the control signal for making the add/subtractor subtract*/

  always @(ALUcommand) begin
    case (ALUcommand)
      `ADD_lut:  begin muxindex = 0; invertB=0;  end    
      `SUB_lut:  begin muxindex = 0; invertB=1;  end
      `XOR_lut:  begin muxindex = 1; invertB=0;  end    
      `SLT_lut:  begin muxindex = 2; invertB=0;  end
      `AND_lut:  begin muxindex = 3; invertB=0;  end    
      `NAND_lut: begin muxindex = 4; invertB=0;  end
      `NOR_lut:  begin muxindex = 5; invertB=0;  end    
      `OR_lut:   begin muxindex = 6; invertB=0;  end
    endcase
  end
endmodule


module structMux(out, address0,address1, address2, in0,in1,in2,in3,in4,in5,in6); //STRUCTURAL MUX to choose final solution
//initialize inputs and outputs
output out;
input address0, address1, address2;
input in0, in1, in2, in3, in4, in5, in6;// in7;
//initialize inside wires
wire na0, na1, na2;
//inverters for the select inputs
not na0inv(na0, address0);
not na1inv(na1, address1);
not na2inv(na2, address2);
//ands for the actual outputs, these will have 3 inputs apiece
wire and0wire, and1wire, and2wire, and3wire, and4wire, and5wire, and6wire; //and7wire);
and in0and(and0wire, na0, na1, na2, in0);
and in1and(and1wire, address0, na1, na2, in1);
and in2and(and2wire, na0, address1, na2, in2);
and in3and(and3wire, address0, address1, na2, in3);
and in4and(and4wire, na0, na1, address2, in4);
and in5and(and5wire, address0, na1, address2, in5);
and in6and(and6wire, na0, address1, address2, in6);

//final or gate with 4 inputs
or finalor(out, and0wire, and1wire, and2wire, and3wire, and4wire, and5wire, and6wire); //, and7wire);

endmodule

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
module or32bit //32 bit or
(
//initializing inputs and outputs, sum, a and b are combined into busses
output[31:0] out,
input[31:0] a,
input[31:0] b
);

`OR or00(out[0], a[0], b[0]);
`OR or01(out[1], a[1], b[1]);
`OR or02(out[2], a[2], b[2]);
`OR or03(out[3], a[3], b[3]);
`OR or04(out[4], a[4], b[4]);
`OR or05(out[5], a[5], b[5]);
`OR or06(out[6], a[6], b[6]);
`OR or07(out[7], a[7], b[7]);
`OR or08(out[8], a[8], b[8]);
`OR or09(out[9], a[9], b[9]);
`OR or10(out[10], a[10], b[10]);
`OR or11(out[11], a[11], b[11]);
`OR or12(out[12], a[12], b[12]);
`OR or13(out[13], a[13], b[13]);
`OR or14(out[14], a[14], b[14]);
`OR or15(out[15], a[15], b[15]);
`OR or16(out[16], a[16], b[16]);
`OR or17(out[17], a[17], b[17]);
`OR or18(out[18], a[18], b[18]);
`OR or19(out[19], a[19], b[19]);
`OR or20(out[20], a[20], b[20]);
`OR or21(out[21], a[21], b[21]);
`OR or22(out[22], a[22], b[22]);
`OR or23(out[23], a[23], b[23]);
`OR or24(out[24], a[24], b[24]);
`OR or25(out[25], a[25], b[25]);
`OR or26(out[26], a[26], b[26]);
`OR or27(out[27], a[27], b[27]);
`OR or28(out[28], a[28], b[28]);
`OR or29(out[29], a[29], b[29]);
`OR or30(out[30], a[30], b[30]);
`OR or31(out[31], a[31], b[31]);

endmodule
module nand32bit //32 bit nand
(
//initializing inputs and outputs, sum, a and b are combined into busses
output[31:0] out,
input[31:0] a,
input[31:0] b
);

`NAND nand00(out[0], a[0], b[0]);
`NAND nand01(out[1], a[1], b[1]);
`NAND nand02(out[2], a[2], b[2]);
`NAND nand03(out[3], a[3], b[3]);
`NAND nand04(out[4], a[4], b[4]);
`NAND nand05(out[5], a[5], b[5]);
`NAND nand06(out[6], a[6], b[6]);
`NAND nand07(out[7], a[7], b[7]);
`NAND nand08(out[8], a[8], b[8]);
`NAND nand09(out[9], a[9], b[9]);
`NAND nand10(out[10], a[10], b[10]);
`NAND nand11(out[11], a[11], b[11]);
`NAND nand12(out[12], a[12], b[12]);
`NAND nand13(out[13], a[13], b[13]);
`NAND nand14(out[14], a[14], b[14]);
`NAND nand15(out[15], a[15], b[15]);
`NAND nand16(out[16], a[16], b[16]);
`NAND nand17(out[17], a[17], b[17]);
`NAND nand18(out[18], a[18], b[18]);
`NAND nand19(out[19], a[19], b[19]);
`NAND nand20(out[20], a[20], b[20]);
`NAND nand21(out[21], a[21], b[21]);
`NAND nand22(out[22], a[22], b[22]);
`NAND nand23(out[23], a[23], b[23]);
`NAND nand24(out[24], a[24], b[24]);
`NAND nand25(out[25], a[25], b[25]);
`NAND nand26(out[26], a[26], b[26]);
`NAND nand27(out[27], a[27], b[27]);
`NAND nand28(out[28], a[28], b[28]);
`NAND nand29(out[29], a[29], b[29]);
`NAND nand30(out[30], a[30], b[30]);
`NAND nand31(out[31], a[31], b[31]);

endmodule

module nor32bit //32 bit nor
(
//initializing inputs and outputs, sum, a and b are combined into busses
output[31:0] out,
input[31:0] a,
input[31:0] b
);

`NOR nor00(out[0], a[0], b[0]);
`NOR nor01(out[1], a[1], b[1]);
`NOR nor02(out[2], a[2], b[2]);
`NOR nor03(out[3], a[3], b[3]);
`NOR nor04(out[4], a[4], b[4]);
`NOR nor05(out[5], a[5], b[5]);
`NOR nor06(out[6], a[6], b[6]);
`NOR nor07(out[7], a[7], b[7]);
`NOR nor08(out[8], a[8], b[8]);
`NOR nor09(out[9], a[9], b[9]);
`NOR nor10(out[10], a[10], b[10]);
`NOR nor11(out[11], a[11], b[11]);
`NOR nor12(out[12], a[12], b[12]);
`NOR nor13(out[13], a[13], b[13]);
`NOR nor14(out[14], a[14], b[14]);
`NOR nor15(out[15], a[15], b[15]);
`NOR nor16(out[16], a[16], b[16]);
`NOR nor17(out[17], a[17], b[17]);
`NOR nor18(out[18], a[18], b[18]);
`NOR nor19(out[19], a[19], b[19]);
`NOR nor20(out[20], a[20], b[20]);
`NOR nor21(out[21], a[21], b[21]);
`NOR nor22(out[22], a[22], b[22]);
`NOR nor23(out[23], a[23], b[23]);
`NOR nor24(out[24], a[24], b[24]);
`NOR nor25(out[25], a[25], b[25]);
`NOR nor26(out[26], a[26], b[26]);
`NOR nor27(out[27], a[27], b[27]);
`NOR nor28(out[28], a[28], b[28]);
`NOR nor29(out[29], a[29], b[29]);
`NOR nor30(out[30], a[30], b[30]);
`NOR nor31(out[31], a[31], b[31]);

endmodule


module xor32bit //32 bit xor
(
//initializing inputs and outputs, sum, a and b are combined into busses
output[31:0] out,
input[31:0] a,
input[31:0] b
);

`XOR xor00(out[0], a[0], b[0]);
`XOR xor01(out[1], a[1], b[1]);
`XOR xor02(out[2], a[2], b[2]);
`XOR xor03(out[3], a[3], b[3]);
`XOR xor04(out[4], a[4], b[4]);
`XOR xor05(out[5], a[5], b[5]);
`XOR xor06(out[6], a[6], b[6]);
`XOR xor07(out[7], a[7], b[7]);
`XOR xor08(out[8], a[8], b[8]);
`XOR xor09(out[9], a[9], b[9]);
`XOR xor10(out[10], a[10], b[10]);
`XOR xor11(out[11], a[11], b[11]);
`XOR xor12(out[12], a[12], b[12]);
`XOR xor13(out[13], a[13], b[13]);
`XOR xor14(out[14], a[14], b[14]);
`XOR xor15(out[15], a[15], b[15]);
`XOR xor16(out[16], a[16], b[16]);
`XOR xor17(out[17], a[17], b[17]);
`XOR xor18(out[18], a[18], b[18]);
`XOR xor19(out[19], a[19], b[19]);
`XOR xor20(out[20], a[20], b[20]);
`XOR xor21(out[21], a[21], b[21]);
`XOR xor22(out[22], a[22], b[22]);
`XOR xor23(out[23], a[23], b[23]);
`XOR xor24(out[24], a[24], b[24]);
`XOR xor25(out[25], a[25], b[25]);
`XOR xor26(out[26], a[26], b[26]);
`XOR xor27(out[27], a[27], b[27]);
`XOR xor28(out[28], a[28], b[28]);
`XOR xor29(out[29], a[29], b[29]);
`XOR xor30(out[30], a[30], b[30]);
`XOR xor31(out[31], a[31], b[31]);

endmodule
module FullAddSubtract32bit //32 bit Add or Subtract
( //initializing inputs and outputs, sum, a and b are combined into busses
output[31:0] sum,
output carryout, 
output overflow,
input[31:0] a,
input[31:0] b,
input control
);

//general format for gates: [gatename][bit#][gate# of that type]

//adding first bit (bit 0)
`XOR xor0c(b0XORcontrol, b[0], control);
`XOR xor0a(a0XORb0, a[0], b0XORcontrol);
`AND and0a(a0ANDb0, a[0], b0XORcontrol);
`AND and0b(a0XORb0ANDcarryin0, a0XORb0, control);
`OR or0(carryin1, a0XORb0ANDcarryin0, a0ANDb0);
`XOR xor0b(sum[0], a0XORb0, control);

//adding second bit (bit 1)
`XOR xor1c(b1XORcontrol, b[1], control);
`XOR xor1a(a1XORb1, a[1], b1XORcontrol);
`AND and1a(a1ANDb1, a[1], b1XORcontrol);
`AND and1b(a1XORb1ANDcarryin1, a1XORb1, carryin1);
`OR or1(carryin2, a1XORb1ANDcarryin1, a1ANDb1);
`XOR xor1b(sum[1], a1XORb1, carryin1);

//adding third bit (bit 2)
`XOR xor2c(b2XORcontrol, b[2], control);
`XOR xor2a(a2XORb2, a[2], b2XORcontrol);
`AND and2a(a2ANDb2, a[2], b2XORcontrol);
`AND and2b(a2XORb2ANDcarryin2, a2XORb2, carryin2);
`OR or2(carryin3, a2XORb2ANDcarryin2, a2ANDb2);
`XOR xor2b(sum[2], a2XORb2, carryin2);

//(bit 3)
`XOR xor3c(b3XORcontrol, b[3], control);
`XOR xor3a(a3XORb3, a[3], b3XORcontrol);
`AND and3a(a3ANDb3, a[3], b3XORcontrol);
`AND and3b(a3XORb3ANDcarryin3, a3XORb3, carryin3);
`OR or3(carryin4, a3XORb3ANDcarryin3, a3ANDb3);
`XOR xor3b(sum[3], a3XORb3, carryin3);

//(bit 4)
`XOR xor4c(b4XORcontrol, b[4], control);
`XOR xor4a(a4XORb4, a[4], b4XORcontrol);
`AND and4a(a4ANDb4, a[4], b4XORcontrol);
`AND and4b(a4XORb4ANDcarryin4, a4XORb4, carryin4);
`OR or4(carryin5, a4XORb4ANDcarryin4, a4ANDb4);
`XOR xor4b(sum[4], a4XORb4, carryin4);

//(bit 5)
`XOR xor5c(b5XORcontrol, b[5], control);
`XOR xor5a(a5XORb5, a[5], b5XORcontrol);
`AND and5a(a5ANDb5, a[5], b5XORcontrol);
`AND and5b(a5XORb5ANDcarryin5, a5XORb5, carryin5);
`OR or5(carryin6, a5XORb5ANDcarryin5, a5ANDb5);
`XOR xor5b(sum[5], a5XORb5, carryin5);

//(bit 6)
`XOR xor6c(b6XORcontrol, b[6], control);
`XOR xor6a(a6XORb6, a[6], b6XORcontrol);
`AND and6a(a6ANDb6, a[6], b6XORcontrol);
`AND and6b(a6XORb6ANDcarryin6, a6XORb6, carryin6);
`OR or6(carryin7, a6XORb6ANDcarryin6, a6ANDb6);
`XOR xor6b(sum[6], a6XORb6, carryin6);

//(bit 7)
`XOR xor7c(b7XORcontrol, b[7], control);
`XOR xor7a(a7XORb7, a[7], b7XORcontrol);
`AND and7a(a7ANDb7, a[7], b7XORcontrol);
`AND and7b(a7XORb7ANDcarryin7, a7XORb7, carryin7);
`OR or7(carryin8, a7XORb7ANDcarryin7, a7ANDb7);
`XOR xor7b(sum[7], a7XORb7, carryin7);

//(bit 8)
`XOR xor8c(b8XORcontrol, b[8], control);
`XOR xor8a(a8XORb8, a[8], b8XORcontrol);
`AND and8a(a8ANDb8, a[8], b8XORcontrol);
`AND and8b(a8XORb8ANDcarryin8, a8XORb8, carryin8);
`OR or8(carryin9, a8XORb8ANDcarryin8, a8ANDb8);
`XOR xor8b(sum[8], a8XORb8, carryin8);

//(bit 9)
`XOR xor9c(b9XORcontrol, b[9], control);
`XOR xor9a(a9XORb9, a[9], b9XORcontrol);
`AND and9a(a9ANDb9, a[9], b9XORcontrol);
`AND and9b(a9XORb9ANDcarryin9, a9XORb9, carryin9);
`OR or9(carryin10, a9XORb9ANDcarryin9, a9ANDb9);
`XOR xor9b(sum[9], a9XORb9, carryin9);

//(bit 10)
`XOR xor10c(b10XORcontrol, b[10], control);
`XOR xor10a(a10XORb10, a[10], b10XORcontrol);
`AND and10a(a10ANDb10, a[10], b10XORcontrol);
`AND and10b(a10XORb10ANDcarryin10, a10XORb10, carryin10);
`OR or10(carryin11, a10XORb10ANDcarryin10, a10ANDb10);
`XOR xor10b(sum[10], a10XORb10, carryin10);

//(bit 11)
`XOR xor11c(b11XORcontrol, b[11], control);
`XOR xor11a(a11XORb11, a[11], b11XORcontrol);
`AND and11a(a11ANDb11, a[11], b11XORcontrol);
`AND and11b(a11XORb11ANDcarryin11, a11XORb11, carryin11);
`OR or11(carryin12, a11XORb11ANDcarryin11, a11ANDb11);
`XOR xor11b(sum[11], a11XORb11, carryin11);

//(bit 12)
`XOR xor12c(b12XORcontrol, b[12], control);
`XOR xor12a(a12XORb12, a[12], b12XORcontrol);
`AND and12a(a12ANDb12, a[12], b12XORcontrol);
`AND and12b(a12XORb12ANDcarryin12, a12XORb12, carryin12);
`OR or12(carryin13, a12XORb12ANDcarryin12, a12ANDb12);
`XOR xor12b(sum[12], a12XORb12, carryin12);

//(bit 13)
`XOR xor13c(b13XORcontrol, b[13], control);
`XOR xor13a(a13XORb13, a[13], b13XORcontrol);
`AND and13a(a13ANDb13, a[13], b13XORcontrol);
`AND and13b(a13XORb13ANDcarryin13, a13XORb13, carryin13);
`OR or13(carryin14, a13XORb13ANDcarryin13, a13ANDb13);
`XOR xor13b(sum[13], a13XORb13, carryin13);

//(bit 14)
`XOR xor14c(b14XORcontrol, b[14], control);
`XOR xor14a(a14XORb14, a[14], b14XORcontrol);
`AND and14a(a14ANDb14, a[14], b14XORcontrol);
`AND and14b(a14XORb14ANDcarryin14, a14XORb14, carryin14);
`OR or14(carryin15, a14XORb14ANDcarryin14, a14ANDb14);
`XOR xor14b(sum[14], a14XORb14, carryin14);

//(bit 15)
`XOR xor15c(b15XORcontrol, b[15], control);
`XOR xor15a(a15XORb15, a[15], b15XORcontrol);
`AND and15a(a15ANDb15, a[15], b15XORcontrol);
`AND and15b(a15XORb15ANDcarryin15, a15XORb15, carryin15);
`OR or15(carryin16, a15XORb15ANDcarryin15, a15ANDb15);
`XOR xor15b(sum[15], a15XORb15, carryin15);

//(bit 16)
`XOR xor16c(b16XORcontrol, b[16], control);
`XOR xor16a(a16XORb16, a[16], b16XORcontrol);
`AND and16a(a16ANDb16, a[16], b16XORcontrol);
`AND and16b(a16XORb16ANDcarryin16, a16XORb16, carryin16);
`OR or16(carryin17, a16XORb16ANDcarryin16, a16ANDb16);
`XOR xor16b(sum[16], a16XORb16, carryin16);

//(bit 17)
`XOR xor17c(b17XORcontrol, b[17], control);
`XOR xor17a(a17XORb17, a[17], b17XORcontrol);
`AND and17a(a17ANDb17, a[17], b17XORcontrol);
`AND and17b(a17XORb17ANDcarryin17, a17XORb17, carryin17);
`OR or17(carryin18, a17XORb17ANDcarryin17, a17ANDb17);
`XOR xor17b(sum[17], a17XORb17, carryin17);

//(bit 18)
`XOR xor18c(b18XORcontrol, b[18], control);
`XOR xor18a(a18XORb18, a[18], b18XORcontrol);
`AND and18a(a18ANDb18, a[18], b18XORcontrol);
`AND and18b(a18XORb18ANDcarryin18, a18XORb18, carryin18);
`OR or18(carryin19, a18XORb18ANDcarryin18, a18ANDb18);
`XOR xor18b(sum[18], a18XORb18, carryin18);

//(bit 19)
`XOR xor19c(b19XORcontrol, b[19], control);
`XOR xor19a(a19XORb19, a[19], b19XORcontrol);
`AND and19a(a19ANDb19, a[19], b19XORcontrol);
`AND and19b(a19XORb19ANDcarryin19, a19XORb19, carryin19);
`OR or19(carryin20, a19XORb19ANDcarryin19, a19ANDb19);
`XOR xor19b(sum[19], a19XORb19, carryin19);

//(bit 20)
`XOR xor20c(b20XORcontrol, b[20], control);
`XOR xor20a(a20XORb20, a[20], b20XORcontrol);
`AND and20a(a20ANDb20, a[20], b20XORcontrol);
`AND and20b(a20XORb20ANDcarryin20, a20XORb20, carryin20);
`OR or20(carryin21, a20XORb20ANDcarryin20, a20ANDb20);
`XOR xor20b(sum[20], a20XORb20, carryin20);

//(bit 21)
`XOR xor21c(b21XORcontrol, b[21], control);
`XOR xor21a(a21XORb21, a[21], b21XORcontrol);
`AND and21a(a21ANDb21, a[21], b21XORcontrol);
`AND and21b(a21XORb21ANDcarryin21, a21XORb21, carryin21);
`OR or21(carryin22, a21XORb21ANDcarryin21, a21ANDb21);
`XOR xor21b(sum[21], a21XORb21, carryin21);

//(bit 22)
`XOR xor22c(b22XORcontrol, b[22], control);
`XOR xor22a(a22XORb22, a[22], b22XORcontrol);
`AND and22a(a22ANDb22, a[22], b22XORcontrol);
`AND and22b(a22XORb22ANDcarryin22, a22XORb22, carryin22);
`OR or22(carryin23, a22XORb22ANDcarryin22, a22ANDb22);
`XOR xor22b(sum[22], a22XORb22, carryin22);

//(bit 23)
`XOR xor23c(b23XORcontrol, b[23], control);
`XOR xor23a(a23XORb23, a[23], b23XORcontrol);
`AND and23a(a23ANDb23, a[23], b23XORcontrol);
`AND and23b(a23XORb23ANDcarryin23, a23XORb23, carryin23);
`OR or23(carryin24, a23XORb23ANDcarryin23, a23ANDb23);
`XOR xor23b(sum[23], a23XORb23, carryin23);

//(bit 24)
`XOR xor24c(b24XORcontrol, b[24], control);
`XOR xor24a(a24XORb24, a[24], b24XORcontrol);
`AND and24a(a24ANDb24, a[24], b24XORcontrol);
`AND and24b(a24XORb24ANDcarryin24, a24XORb24, carryin24);
`OR or24(carryin25, a24XORb24ANDcarryin24, a24ANDb24);
`XOR xor24b(sum[24], a24XORb24, carryin24);

//(bit 25)
`XOR xor25c(b25XORcontrol, b[25], control);
`XOR xor25a(a25XORb25, a[25], b25XORcontrol);
`AND and25a(a25ANDb25, a[25], b25XORcontrol);
`AND and25b(a25XORb25ANDcarryin25, a25XORb25, carryin25);
`OR or25(carryin26, a25XORb25ANDcarryin25, a25ANDb25);
`XOR xor25b(sum[25], a25XORb25, carryin25);

//(bit 26)
`XOR xor26c(b26XORcontrol, b[26], control);
`XOR xor26a(a26XORb26, a[26], b26XORcontrol);
`AND and26a(a26ANDb26, a[26], b26XORcontrol);
`AND and26b(a26XORb26ANDcarryin26, a26XORb26, carryin26);
`OR or26(carryin27, a26XORb26ANDcarryin26, a26ANDb26);
`XOR xor26b(sum[26], a26XORb26, carryin26);

//(bit 27)
`XOR xor27c(b27XORcontrol, b[27], control);
`XOR xor27a(a27XORb27, a[27], b27XORcontrol);
`AND and27a(a27ANDb27, a[27], b27XORcontrol);
`AND and27b(a27XORb27ANDcarryin27, a27XORb27, carryin27);
`OR or27(carryin28, a27XORb27ANDcarryin27, a27ANDb27);
`XOR xor27b(sum[27], a27XORb27, carryin27);

//(bit 28)
`XOR xor28c(b28XORcontrol, b[28], control);
`XOR xor28a(a28XORb28, a[28], b28XORcontrol);
`AND and28a(a28ANDb28, a[28], b28XORcontrol);
`AND and28b(a28XORb28ANDcarryin28, a28XORb28, carryin28);
`OR or28(carryin29, a28XORb28ANDcarryin28, a28ANDb28);
`XOR xor28b(sum[28], a28XORb28, carryin28);

//(bit 29)
`XOR xor29c(b29XORcontrol, b[29], control);
`XOR xor29a(a29XORb29, a[29], b29XORcontrol);
`AND and29a(a29ANDb29, a[29], b29XORcontrol);
`AND and29b(a29XORb29ANDcarryin29, a29XORb29, carryin29);
`OR or29(carryin30, a29XORb29ANDcarryin29, a29ANDb29);
`XOR xor29b(sum[29], a29XORb29, carryin29);

//(bit 30)
`XOR xor30c(b30XORcontrol, b[30], control);
`XOR xor30a(a30XORb30, a[30], b30XORcontrol);
`AND and30a(a30ANDb30, a[30], b30XORcontrol);
`AND and30b(a30XORb30ANDcarryin30, a30XORb30, carryin30);
`OR or30(carryin31, a30XORb30ANDcarryin30, a30ANDb30);
`XOR xor30b(sum[30], a30XORb30, carryin30);

//adding most significant bit (bit 31)
`XOR xor31c(b31XORcontrol, b[31], control);
`XOR xor31a(a31XORb31, a[31], b31XORcontrol);
`AND and31a(a31ANDb31, a[31], b31XORcontrol);
`AND and31b(a31XORb31ANDcarryin31, a31XORb31, carryin31);
`OR or31(carryout, a31XORb31ANDcarryin31, a31ANDb31);
`XOR xor31b(sum[31], a31XORb31, carryin31);

//calculating whether overflow occured by looking at the carryin and carryout for the most significant bit. Returns 1 if overflow occured
`XOR xoroverflow(overflow, carryin31, carryout);
//end of adder-subtractor
endmodule







module SLT32bit //32 bit SLT
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
module ZeroFlag32bit //ZeroFlaf 32bit
(

output zero,
input[31:0] result
);
//NOR everything, if result is 1 all inputs where 0
`NOR norzero(zero, result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15], result[16], result[17], result[18], result[19], result[20], result[21], result[22], result[23], result[24], result[25], result[26], result[27], result[28], result[29], result[30], result[31]);
endmodule



//this is working
module behavioralFullAdder(output[31:0] sum, output carryout, input[31:0] a, input[31:0] b, input carryin);
assign {carryout, sum}=a+b+carryin;
endmodule

//this is working
module behavioralFullSubtractor(output[31:0] sum, output carryout, input[31:0] a, input[31:0] b, input carryin);
assign {carryout, sum}=a-b;
endmodule

module behavioralFullSlt(output[31:0] sum, input[31:0] a, input[31:0] b);
assign {sum}=a>=b;
endmodule

//this is working
module behavioralFullAnd(output[31:0] sum, input[31:0] a, input[31:0] b);
assign {sum}= a & b;
endmodule

//this one is working
module behavioralFullOr(output[31:0] sum, input[31:0] a, input[31:0] b);
assign {sum} = a | b;
endmodule

module behavioralFullXor(output[31:0] sum, input[31:0] a, input[31:0] b);
assign {sum} = a ^ b;
endmodule

module behavioralFullNand(output[31:0] sum, input[31:0] a, input[31:0] b);
assign {sum}= ~(a & b);
endmodule

module behavioralFullNor(output[31:0] sum, input[31:0] a, input[31:0] b);
assign {sum} = ~(a | b);
endmodule


module test_looping();
//this module will test 2 modules against an array of inputs, and see if they are the same every time.

integer i;
integer iterations_add;
integer iterations_simple;

wire[31:0]    	result;
wire          	carryout;
wire          	zero;
wire          	overflow;
reg[31:0]     	operandA;
reg[31:0]     	operandB;
reg[2:0]      	command;
wire[2:0]  	muxindex;
wire 		invertB;



wire[31:0] 	resultAND;
wire[31:0] 	resultOR;
wire[31:0] 	resultNAND;
wire[31:0] 	resultNOR;
wire[31:0] 	resultXOR;
wire[31:0] 	resultADD;
wire[31:0] 	resultSUB;
wire[31:0] 	resultSLT;
wire		carryoutB;
wire		overflowB;
wire		carryoutC;



ALU structural(result, carryout, zero, overflow, operandA, operandB, command, muxindex, invertB);

behavioralFullAdder adder0(resultADD, carryoutB, operandA, operandB, 1'b0);

behavioralFullSubtractor subtract0(resultSUB, carryoutC, operandA, operandB, 1'b1);

behavioralFullAnd andB(resultAND, operandA , operandB);
behavioralFullOr orB(resultOR, operandA , operandB);
behavioralFullXor xor0(resultXOR, operandA , operandB);
behavioralFullNand nand0(resultNAND, operandA , operandB);
behavioralFullNor nor0(resultNOR, operandA , operandB);
behavioralFullSlt slt0(resultSLT, operandA, operandB);



reg [31:0] test_inputsa[0:8]; //array of 32 bit bus signals, 7 elements in the array
reg [31:0] test_inputsb[0:8]; //second array of inputs

initial begin
iterations_add = 6;
iterations_simple = 9;


test_inputsa[0] = 'h0000000f;
test_inputsb[0] = 'h00000001;
test_inputsa[1] = 'hffffffff;
test_inputsb[1] = 'hfffffff0;
test_inputsa[2] = 'h0fffffff;
test_inputsb[2] = 'hf0000000;
test_inputsa[3] = 'hcffffffc;
test_inputsb[3] = 'hcffffffc;
test_inputsa[4] = 'hf0000000;
test_inputsb[4] = 'hf0000000;

test_inputsa[5] = 'hffffffff;
test_inputsb[5] = 'hffffffff;

test_inputsa[6] = 'h00000000;
test_inputsb[6] = 'h00000000;
test_inputsa[7] = 'h00000000;
test_inputsb[7] = 'hffffffff;
test_inputsa[8] = 'hffffffff;
test_inputsb[8] = 'h00000000;

	
  //ADD LOOP has some random commented stuff
  for (i = 0; i < iterations_add; i = i + 1) begin
	
	operandA = test_inputsa[i];
	operandB = test_inputsb[i];
	//a1 = test_inputsa[i+1];
	//b1 = test_inputsb[i+1];
	command = 3'd0;
	#1000

	if (i == 0) begin
		$display("this is the ADD operation");
		$display("operandA   operandB  | muxindex  invertB  zero | expected  actual  | carryout carryoutB | overflow");
	end
	$display("%h   %h  |    %h         %h       %h  | %h %h |     %h        %h     |    %h ", operandA, operandB, muxindex, invertB, zero, resultADD, result, carryout, carryoutB, overflow);
	
  end

//SUB LOOP
  for (i = 0; i < iterations_add; i = i + 1) begin
	
	operandA = test_inputsa[i];
	operandB = test_inputsb[i];
	command = 3'd1;
	#1000
	if (i == 0) begin
		$display("this is the SUB operation");
		$display("operandA   operandB  | muxindex  invertB  zero | expected  actual  | carryout carryoutC | overflow");
	end
	$display("%h   %h  |    %h         %h       %h  | %h %h |     %h        %h     |    %h ", operandA, operandB, muxindex, invertB, zero, resultSUB, result, carryout, carryoutC, overflow);
	
  end


//SLT LOOP
  for (i = 0; i < iterations_add; i = i + 1) begin
	
	operandA = test_inputsa[i];
	operandB = test_inputsb[i];
	command = 3'd3;
	#1000
	if (i == 0) begin
		$display("this is the SLT operation");
		$display("operandA   operandB  | muxindex  invertB  zero | expected   actual");
	end
	$display("%h   %h  |    %h         %h      %h   | %h  %h", operandA, operandB, muxindex, invertB, zero, result, resultSLT);
	
  end

 //AND LOOP
for (i = 5; i < iterations_simple; i = i + 1) begin
	
	operandA = test_inputsa[i];
	operandB = test_inputsb[i];
	command = 3'd4;
	#300
	if (i == 5) begin
		$display("this is the AND operation");
		$display("operandA   operandB  | muxindex  invertB  zero | expected   actual");
	end
	$display("%h   %h  |    %h         %h      %h   | %h  %h", operandA, operandB, muxindex, invertB, zero, resultAND, result);
	
  end


//OR LOOP
for (i = 5; i < iterations_simple; i = i + 1) begin
	
	operandA = test_inputsa[i];
	operandB = test_inputsb[i];
	command = 3'd7;
	#300
	if (i == 5) begin
		$display("this is the OR operation");
		$display("operandA   operandB  | muxindex  invertB  zero | expected   actual");
	end
	$display("%h   %h  |    %h         %h      %h   | %h  %h", operandA, operandB, muxindex, invertB, zero, resultOR, result);
	
  end


//NAND LOOP
for (i = 5; i < iterations_simple; i = i + 1) begin
	
	operandA = test_inputsa[i];
	operandB = test_inputsb[i];
	command = 3'd5;
	#300
	if (i == 5) begin
		$display("this is the NAND operation");
		$display("operandA   operandB  | muxindex  invertB  zero | expected   actual");
	end
	$display("%h   %h  |    %h         %h      %h   | %h  %h", operandA, operandB, muxindex, invertB, zero, resultNAND, result);
	
  end


//NOR LOOP
for (i = 5; i < iterations_simple; i = i + 1) begin
	operandA = test_inputsa[i];
	operandB = test_inputsb[i];
	command = 3'd6;
	#300
	if (i == 5) begin
		$display("this is the NOR operation");
		$display("operandA   operandB  | muxindex  invertB  zero | expected   actual");
	end
	$display("%h   %h  |    %h         %h      %h   | %h  %h", operandA, operandB, muxindex, invertB, zero, resultNOR, result);
	
  end


//XOR LOOP
for (i = 5; i < iterations_simple; i = i + 1) begin
	
	operandA = test_inputsa[i];
	operandB = test_inputsb[i];
	command = 3'd2;
	#300
	if (i == 5) begin
		$display("this is the XOR operation");
		$display("operandA   operandB  | muxindex  invertB  zero | expected   actual");
	end
	$display("%h   %h  |    %h         %h      %h   | %h  %h", operandA, operandB, muxindex, invertB, zero, resultXOR, result);
  end


end

endmodule

