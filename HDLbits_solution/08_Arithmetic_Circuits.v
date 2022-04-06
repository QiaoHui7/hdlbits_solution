////////////////////////////////////////////////////////////////////////////////
// Getting Started
// Verilog Language
// Circuits
// |-- Combinational Logic
//     |-- Basic Gates
//     |-- Multiplexers
//     |-- Arithmetic Circuits (*)
////////////////////////////////////////////////////////////////////////////////

// https://hdlbits.01xz.net/wiki/Hadd
// Hadd
module top_module( 
    input a, b,
    output cout, sum );

    // 1-bit half adder
    assign sum  = a ^ b;
    assign cout = a & b;
    
endmodule


// https://hdlbits.01xz.net/wiki/Fadd
// full adder
module top_module( 
    input a, b, cin,
    output cout, sum );

    // full adder
    assign {cout,sum} = a+b+cin;
    
endmodule


// https://hdlbits.01xz.net/wiki/Adder3
// pay attnetion to cout
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    // ripple adder
    assign {cout[0],sum[0]} = a[0]+b[0]+cin;
    assign {cout[1],sum[1]} = a[1]+b[1]+cout[0];
    assign {cout[2],sum[2]} = a[2]+b[2]+cout[1];
    
endmodule


// https://hdlbits.01xz.net/wiki/Exams/m2014_q4j
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    // is there auto extend?
    assign sum = x + y;
    
endmodule


// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q1c
// Assume that you have two 8-bit 2's complement numbers, a[7:0] and b[7:0]. 
// These numbers are added to produce s[7:0]. Also compute whether a (signed) overflow has occurred.
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
 
    // assign s = ...
    // assign overflow = ...
    wire [8:0] a_ext;
    wire [8:0] b_ext;
    wire [8:0] s_ext;
    
    assign a_ext = {a[7],a};
    assign b_ext = {b[7],b};
    
    assign s_ext = a_ext + b_ext;
    
    // include both overflow and underflow
    assign overflow = s_ext[8] ^ s_ext[7];
    assign s = s_ext[7:0];

endmodule


// https://hdlbits.01xz.net/wiki/Adder100
// Create a 100-bit binary adder. The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out.
// Expected solution length: Around 1 line.
module top_module(
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    
    assign {cout,sum} = a+b+cin;

endmodule


// https://hdlbits.01xz.net/wiki/Bcdadd4
// todo: BCD counter
