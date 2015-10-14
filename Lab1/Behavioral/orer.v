// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder(orres, a, b);
output [31:0] orres;
input [31:0] a;
input [31:0] b;
assign {andres}=a OR b;
endmodule

module testOrer;
reg a, b;
wire orres;
behavioralOrer orer (orres, a, b);

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
