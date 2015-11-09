//-//--------------------------------------------------------------------------------
//  Wrapper for Lab 0: Full Adder
// 
//  Rationale: 
//     The ZYBO board has 4 buttons, 4 switches, and 4 LEDs. But if we want to
//     show the results of a 4-bit add operation, we will need at least 6 LEDs!
//
//     This wrapper module allows for 4-bit operands to be loaded in one at a
//     time, and multiplexes the LEDs to show the SUM and carryout/overflow at
//     different times.
//
//  Your job:
//     Write FullAdder4bit with the proper port signature. It will be instantiated
//     by the lab0_wrapper module in this file, which interfaces with the buttons,
//     switches, and LEDs for you.
//
//  Usage:
//     btn0 - load operand A from the current switch configuration
//     btn1 - load operand B from the current switch configuration
//     btn2 - show SUM on LEDs
//     btn3 - show carryout on led0, overflow on led1
//
//     Note: Buttons, switches, and LEDs have the least-significant (0) position
//     on the right.      
//--------------------------------------------------------------------------------

`timescale 1ns / 1ps


//--------------------------------------------------------------------------------
// Basic building block modules
//--------------------------------------------------------------------------------

// D flip-flop with parameterized bit width (default: 1-bit)
// Parameters in Verilog: http://www.asic-world.com/verilog/para_modules1.html
module dff #( parameter W = 1 )
(
    input trigger,
    input enable,
    input      [W-1:0] d,
    output reg [W-1:0] q
);
    always @(posedge trigger) begin
        if(enable) begin
            q <= d;
        end 
    end
endmodule

// JK flip-flop
module jkff1
(
    input trigger,
    input j,
    input k,
    output reg q
);
    always @(posedge trigger) begin
        if(j && ~k) begin
            q <= 1'b1;
        end
        else if(k && ~j) begin
            q <= 1'b0;
        end
        else if(k && j) begin
            q <= ~q;
        end
    end
endmodule

// Two-input MUX with parameterized bit width (default: 1-bit)
module mux2 #( parameter W = 1 )
(
    input[W-1:0]    in0,
    input[W-1:0]    in1,
    input           sel,
    output[W-1:0]   out
);
    // Conditional operator - http://www.verilog.renerta.com/source/vrg00010.htm
    assign out = (sel) ? in1 : in0;
endmodule


//--------------------------------------------------------------------------------
// Main Lab 0 wrapper module
//   Interfaces with switches, buttons, and LEDs on ZYBO board. Allows for two
//   4-bit operands to be stored, and two results to be alternately displayed
//   to the LEDs.
//
//   You must write the FullAdder4bit (in your adder.v) to complete this module.
//   Challenge: write your own interface module instead of using this one.
//--------------------------------------------------------------------------------

module lab0_wrapper
(
    input        clk,
    input  [1:0] sw,
    input  [3:0] btn,
    output [3:0] led
);

    wire sclk_pin;
    wire cs_pin;
    wire miso_pin;
    wire mosi_pin;
    //wire res_sel;             // Select between display options
    wire fault_pin;
    //wire clkEdge;
    //wire parallelLoad;
    //wire serialDataIn;
    //wire serialDataOut;
    //reg[7:0] parallelDataIn;
    //wire[7:0] parallelDataOut;
    
/*    // Memory for stored operands (parametric width set to 4 bits)
    dff #(4) opA_mem(.trigger(clk), .enable(btn[0]), .d(sw), .q(opA));
    dff #(4) opB_mem(.trigger(clk), .enable(btn[1]), .d(sw), .q(opB)); */
    
  
    //initialize functions
    spimemory spimemory(.clk(clk), .sclk_pin(), .cs_pin(), .miso_pin(miso_pin), .mosi_pin(), .fault_pin(), .leds(led))

    //mux2 #(4) output_select(.in0(parallelDataOut[3:0]), .in1(parallelDataOut[7:4]), .sel(res_sel), .out(led));
    // Capture button input to switch which MUX input to LEDs
    //jkff1 src_sel(.trigger(clk), .j(btn[2]), .k(btn[1]), .q(res_sel));
    
endmodule
