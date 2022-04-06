////////////////////////////////////////////////////////////////////////////////
// Getting Started
// Verilog Language
// Circuits
// |-- Combinational Logic
//     |-- Basic Gates (*)
////////////////////////////////////////////////////////////////////////////////

// https://hdlbits.01xz.net/wiki/Exams/m2014_q4h
module top_module (
    input in,
    output out);
    
    // direct wire
    assign out = in;
    
endmodule


// https://hdlbits.01xz.net/wiki/Exams/m2014_q4i
module top_module (
    output out);

    // ground
    assign out = 1'b0;
    
endmodule

// https://hdlbits.01xz.net/wiki/Exams/m2014_q4e
module top_module (
    input in1,
    input in2,
    output out);

    // nor gate
    assign out = ~(in1|in2);
    
endmodule


// https://hdlbits.01xz.net/wiki/Exams/m2014_q4f
module top_module (
    input in1,
    input in2,
    output out);
    
    assign out = in1 & (~in2);

endmodule


// https://hdlbits.01xz.net/wiki/Exams/m2014_q4g
module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    
    assign out = (~(in1^in2))^in3;

endmodule


// https://hdlbits.01xz.net/wiki/Gates
/*
Ok, let's try building several logic gates at the same time. Build a combinational circuit with two inputs, a and b.

There are 7 outputs, each with a logic gate driving it:

out_and: a and b
out_or: a or b
out_xor: a xor b
out_nand: a nand b
out_nor: a nor b
out_xnor: a xnor b
out_anotb: a and-not b
*/
module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    
    assign out_and  = a&b;
    assign out_or   = a|b;
    assign out_xor  = a^b;
    assign out_nand = ~(a&b);
    assign out_nor  = ~(a|b);
    assign out_xnor = ~(a^b);
    assign out_anotb = a&(~b);

endmodule


// https://hdlbits.01xz.net/wiki/7420
// The 7400-series integrated circuits are a series of digital chips with a few gates each. The 7420 is a chip with two 4-input NAND gates.
// Create a module with the same functionality as the 7420 chip. It has 8 inputs and 2 outputs.
module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    assign p1y = ~(p1a & p1b & p1c & p1d);
    assign p2y = ~(p2a & p2b & p2c & p2d);

endmodule

// https://hdlbits.01xz.net/wiki/Truthtable1

