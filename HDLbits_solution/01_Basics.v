////////////////////////////////////////////////////////////////////////////////
// Getting Started
// Verilog Language
// |-- Basics (*)
////////////////////////////////////////////////////////////////////////////////

// https://hdlbits.01xz.net/wiki/Step_one
module top_module( output one );

    // Insert your code here
    assign one = 1'b1;

endmodule


// https://hdlbits.01xz.net/wiki/Zero
module top_module(
    output zero
);
    // Module body starts after semicolon
    assign zero = 1'b0;

endmodule


// https://hdlbits.01xz.net/wiki/Wire
module top_module( input in, output out );

    assign out = in;

endmodule


// https://hdlbits.01xz.net/wiki/Wire4
module top_module( 
    input a,b,c,
    output w,x,y,z );
    
    assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;

endmodule


// https://hdlbits.01xz.net/wiki/Notgate
module top_module( input in, output out );
    // assign out = ~in;
    assign out = !in;
endmodule

// https://hdlbits.01xz.net/wiki/Andgate
module top_module( 
    input a, 
    input b, 
    output out );
    
    // and gate
    assign out = a & b;
    
endmodule


// https://hdlbits.01xz.net/wiki/Norgate
module top_module( 
    input a, 
    input b, 
    output out );

    // nor gate
    assign out = ~ (a | b);
    
endmodule


// https://hdlbits.01xz.net/wiki/Xnorgate
module top_module( 
    input a, 
    input b, 
    output out );
    
    // xnor gate
    assign out = ~(a^b);

endmodule


// https://hdlbits.01xz.net/wiki/Wire_decl
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    // assign wire
    wire a_and_b;
    wire c_and_d;
    
    wire out_tmp;
    
    // assign link
    assign a_and_b = a & b;
    assign c_and_d = c & d;
    
    assign out_tmp = a_and_b | c_and_d;
    
    assign out   =  out_tmp;
    assign out_n = ~out_tmp;

endmodule


// https://hdlbits.01xz.net/wiki/7458
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    // out 1
    assign p1y = (p1a & p1b & p1c) | (p1d & p1e & p1f);
    
    // out 2
    assign p2y = (p2a & p2b) | (p2c & p2d);
    
endmodule

// block finished