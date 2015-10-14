// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralAnder(andres, a, b);
output [31:0] andres;
input [31:0] a;
input [31:0] b;
assign andres = a & b;
endmodule

module testAnder;
reg[31:0] a, b;
wire[31:0] andres;
behavioralAnder ander (andres, a, b);

initial begin
$display("Cin A B |Sum Cout| Expected Output");
a=11;b=00; #1000 
$display("%b  %b  %b| All false", a, b, andres);
end
endmodule
