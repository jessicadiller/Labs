// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder(sum, carryout, a, b, carryin);
output [31:0] sum;
output carryout;
input [31:0] a;
input [31:0] b;
input carryin;
assign {carryout, sum}=a+b+carryin;
endmodule

module testFullAdder;
reg a, b, carryin;
wire sum, carryout;
behavioralFullAdder adder (sum, carryout, a, b, carryin);

initial begin
$display("Cin A B |Sum Cout| Expected Output");
carryin=0;a=11;b=00; #1000 
$display("%b  %b  %b |  %b  %b  | All false", carryin, a, b, sum, carryout);
carryin=1;a=0;b=0; #1000 
$display("%b  %b  %b |  %b  %b  | Sum Only", carryin, a, b, sum, carryout);
carryin=0;a=1;b=0; #1000 
$display("%b  %b  %b |  %b  %b  | Sum Only", carryin, a, b, sum, carryout);
carryin=0;a=0;b=1; #1000 
$display("%b  %b  %b |  %b  %b  | Sum Only", carryin, a, b, sum, carryout);
carryin=0;a=1;b=1; #1000 
$display("%b  %b  %b |  %b  %b  | Cout Only", carryin, a, b, sum, carryout);
carryin=1;a=0;b=1; #1000 
$display("%b  %b  %b |  %b  %b  | Cout Only", carryin, a, b, sum, carryout);
carryin=1;a=1;b=0; #1000 
$display("%b  %b  %b |  %b  %b  | Cout Only", carryin, a, b, sum, carryout);
carryin=1;a=1;b=1; #1000 
$display("%b  %b  %b |  %b  %b  | All true", carryin, a, b, sum, carryout);
end

endmodule
