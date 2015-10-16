// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR or #50


/*module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;

`NOT not1(naddress0, address0);
`NOT not2(naddress1, address1);
`AND and1(ANDin0na0na1, in0, naddress0, naddress1);
`AND and2(ANDin1a0na1, in1, address0, naddress1);
`AND and3(ANDin2na0a1, in2, naddress0, address1);
`AND and4(ANDin3a0a1, in3, address0, address1);
`OR or1(out, ANDin0na0na1, ANDin1a0na1, ANDin2na0a1, ANDin3a0a1);
wire out;

endmodule*/
module structMux(out, address0,address1, address2, in0,in1,in2,in3,in4,in5,in6);
output out;
input address0, address1, address2;
input in0, in1, in2, in3, in4, in5, in6;

//inverters for the select inputs
`NOT na0inv(na0, address0);
`NOT na1inv(na1, address1);
`NOT na2inv(na2, address2);
//ands for the actual outputs, these will have 3 inputs apiece
//wire and0wire, and1wire, and2wire, and3wire, and4wire, and5wire, and6wire;
`AND in0and(and0wire, na0, na1, na2);
`AND in1and(and1wire, address0, na1, na2);
`AND in2and(and2wire, na0, address1, na2);
`AND in3and(and3wire, address0, address1, na2);
`AND in4and(and4wire, na0, na1, address2);
`AND in5and(and5wire, address0, na1, address2);
`AND in6and(and6wire, na0, address1, address2);

//final or gate with 4 inputs
`OR finalor(out, and0wire, and1wire, and2wire, and3wire, and4wire, and5wire, and6wire);

endmodule

module testMultiplexer;
reg address0, address1, address2;
reg in0, in1, in2, in3, in4, in5, in6;
wire out;
structMux multiplexer (out, address0,address1, address2, in0,in1,in2,in3,in4,in5,in6);

initial begin
$display("Add1 Add2 | In0 In1 In2 In3 | Out | Expected Output");
address0=0;address1=0;address2=0; in0=0;in1=0;in2=0;in3=0;in4=0;in5=0;in6=0; #1000 
$display("  %b   %b   %b   |  %b   X   X   X   X   X   X  |  %b  | False", address0, address1, address1, in0, out);
address0=0;address1=0;address2=0; in0=1;in1=0;in2=0;in3=0;in4=0;in5=0;in6=0; #1000 
$display("  %b   %b   %b   |  %b   X   X   X   X   X   X  |  %b  | True", address0, address1, address1, in0, out);
/*address0=0;address1=0;in0=1;in1=0;in2=0;in3=0; #1000 
$display("  %b   %b   |  %b   X   X   X  |  %b  | True", address0, address1, in0, out);
address0=1;address1=0;in0=0;in1=0;in2=0;in3=0; #1000 
$display("  %b   %b   |  X   %b   X   X  |  %b  | False", address0, address1, in1, out);
address0=1;address1=0;in0=0;in1=1;in2=0;in3=0; #1000 
$display("  %b   %b   |  X   %b   X   X  |  %b  | True", address0, address1, in1, out);
address0=0;address1=1;in0=0;in1=0;in2=0;in3=0; #1000 
$display("  %b   %b   |  X   X   %b   X  |  %b  | False", address0, address1, in2, out);
address0=0;address1=1;in0=0;in1=0;in2=1;in3=0; #1000 
$display("  %b   %b   |  X   X   %b   X  |  %b  | True", address0, address1, in2, out);
address0=1;address1=1;in0=0;in1=0;in2=0;in3=0; #1000 
$display("  %b   %b   |  X   X   X   %b  |  %b  | False", address0, address1, in3, out);
address0=1;address1=1;in0=0;in1=0;in2=0;in3=1; #1000 
$display("  %b   %b   |  X   X   X   %b  |  %b  | True", address0, address1, in3, out);
*/
end
endmodule