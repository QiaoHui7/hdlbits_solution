////////////////////////////////////////////////////////////////////////////////
// Getting Started
// Verilog Language
// |-- Basics
// |-- Vectors (*)
////////////////////////////////////////////////////////////////////////////////

// https://hdlbits.01xz.net/wiki/Vector0
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
    
    assign o2 = vec[2];
    assign o1 = vec[1];
    assign o0 = vec[0];
    
    assign outv = vec;

endmodule


// https://hdlbits.01xz.net/wiki/Vector1
`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    
    assign out_hi = in[15:8];
    assign out_lo = in[7:0];

endmodule


// https://hdlbits.01xz.net/wiki/Vector2
module top_module( 
    input [31:0] in,
    output [31:0] out );//

    assign out[31:24] = in[7:0];
    assign out[23:16] = in[15:8];
    assign out[15:8]  = in[23:16];
    assign out[7:0]   = in[31:24];

endmodule


// https://hdlbits.01xz.net/wiki/Vectorgates
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    
    assign out_or_bitwise = a|b;
    assign out_or_logical = a||b;
    assign out_not        = {~b, ~a};

endmodule


// https://hdlbits.01xz.net/wiki/Gates4
// reduce operator
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);

    assign out_and = &in;
    assign out_or  = |in;
    assign out_xor = ^in;
    
endmodule


// https://hdlbits.01xz.net/wiki/Vector3
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
    assign w = {a, b[4:2]};
    assign x = {b[1:0], c, d[4]};
    assign y = {d[3:0], e[4:1]};
    assign z = {e[0], f, 2'b11};

endmodule

// https://hdlbits.01xz.net/wiki/Vectorr
module top_module( 
    input [7:0] in,
    output [7:0] out
);
    
    assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};

endmodule


// https://hdlbits.01xz.net/wiki/Vector4
// sign extension
module top_module (
    input [7:0] in,
    output [31:0] out );//

    // assign out = { replicate-sign-bit , the-input };
    assign out = {{24{in[7]}}, in};

endmodule


// https://hdlbits.01xz.net/wiki/Vector5
module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    assign out = ~{ {5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}} } ^ { {5{a,b,c,d,e}} };

endmodule

// block finished