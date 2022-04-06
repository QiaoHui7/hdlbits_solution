////////////////////////////////////////////////////////////////////////////////
// Getting Started
// Verilog Language
// Circuits
// |-- Combinational Logic
//     |-- Basic Gates
//     |-- Multiplexers
//     |-- Arithmetic Circuits
//     |-- Karnaugh Map to Circuit (*)
////////////////////////////////////////////////////////////////////////////////

//Karnaugh Map
// https://hdlbits.01xz.net/wiki/Kmap1
// solution 1
module top_module(
    input a,
    input b,
    input c,
    output out  ); 

    assign out = ~((~a)&(~b)&(~c));
    
endmodule


// solution 2
module top_module(
    input a,
    input b,
    input c,
    output out  ); 

    assign out = a | b | c;
    
endmodule


// https://hdlbits.01xz.net/wiki/Kmap2
// Kmap2
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    // collect 0
    assign out = (a | b | (~c) | (~d)) &
        (a | (~b) | c | (~d)) &
        ((~a) | (~b) | c) &
        ((~a) | (~c) | d);
    
endmodule


// https://hdlbits.01xz.net/wiki/Kmap3
// issue, what is d? d is don't care
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = a |
        ((~a)&(~b)&c);
    
endmodule


// https://hdlbits.01xz.net/wiki/Kmap4
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    // this is a parity check
    assign out = ^{a,b,c,d};
    
endmodule

// https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q2
// A single-output digital system with four inputs (a,b,c,d) generates 
// a logic-1 when 2, 7, or 15 appears on the inputs, 
// and a logic-0 when 0, 1, 4, 5, 6, 9, 10, 13, or 14 appears. 
// The input conditions for the numbers 3, 8, 11, and 12 never occur in this system. 
// For example, 7 corresponds to a,b,c,d being set to 0,1,1,1, respectively.
// 
//    ab   00  01  11  10
//  cd\
//    00    0   0   d   d
//    01    0   0   0   0
//    11    d   1   1   d
//    10    1   0   0   0

Determine the output out_sop in minimum SOP form, and the output out_pos in minimum POS form.
module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    assign out_sop = c&d | (~a)&(~b)&c&(~d);
    assign out_pos = c & ((~a)|(~c)|b) & ((~b)|(~c)|d);

endmodule


// https://hdlbits.01xz.net/wiki/Exams/m2014_q3
module top_module (
    input [4:1] x, 
    output f );

    assign f = x[3]&(~x[1]) | x[1]&x[2]&(~x[3]);
        
endmodule


// https://hdlbits.01xz.net/wiki/Exams/2012_q1g
module top_module (
    input [4:1] x,
    output f
); 
    
    assign f = (~x[1]&x[3]) | (x[1]&(~x[2])&(~x[4])) | (&x) | (&(~x));

endmodule


// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q3
module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    assign mux_in[0] = c|d;
    assign mux_in[1] = 0;
    assign mux_in[2] = ~d;
    assign mux_in[3] = c&d;

endmodule

// block finished