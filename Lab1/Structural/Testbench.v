module test_____;
reg[31:0] a
reg[31:0] b
wire [31:0] out
Running

initial begin
$display("   A     B  |  Out | Other (OFL, Cout, Zero) | expected ");
//All 0
a='h00000000; b='h00000000; #1000 
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//All 1
a='hffffffff; b='hffffffff; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//LargePos LargePos
a='h7ffffffc; b='h7ffffffc; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//LargePos SmallPos
a='h7ffffffc; b='h00000001; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//LargePos LargeNeg
a='h7ffffffc; b='hc0000000; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//LargePos Small Neg
a='h7ffffffc; b='hfffffffe; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);

//SmallPos LargePos
a='h00000001; b='h7ffffffc; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//SmallPos SmallPos
a='h00000001; b='h00000001; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//SmallPos LargeNeg
a='h00000001; b='hc0000000; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//SmallPos SmallNeg
a='h00000001; b='hfffffffe; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);

//LargeNeg LargePos
a='hc0000000; b='h7ffffffc; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//LargeNeg SmallPos
a='hc0000000; b='h00000001; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//LargeNeg LargeNeg
a='hc0000000; b='hc0000000; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//LargeNeg SmallNeg
a='hc0000000; b='hfffffffe; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);

//SmallNeg LargePos
a='hfffffffe; b='h7ffffffc; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//SmallNeg SmallPos
a='hfffffffe; b='h00000001; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//SmallNeg LargeNeg
a='hfffffffe; b='hc0000000; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
//SmallNeg SmallNeg
a='hfffffffe; b='hfffffffe; #1000
$display(" %b  %b |  %b  |  None | 000000... ", a, b, out);
end
endmodule
