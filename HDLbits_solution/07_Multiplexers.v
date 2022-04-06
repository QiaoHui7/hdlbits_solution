////////////////////////////////////////////////////////////////////////////////
// Getting Started
// Verilog Language
// Circuits
// |-- Combinational Logic
//     |-- Basic Gates
//     |-- Multiplexers (*)
////////////////////////////////////////////////////////////////////////////////

// https://hdlbits.01xz.net/wiki/Mux2to1
// a one-bit wide, 2-to-1 multiplexer. When sel=0, choose a. When sel=1, choose b.
module top_module( 
    input a, b, sel,
    output out ); 

    // a one-bit wide, 2-to-1 multiplexer. When sel=0, choose a. When sel=1, choose b.
    assign out = sel ? b : a;
    
endmodule


// https://hdlbits.01xz.net/wiki/Mux2to1v
// a 100-bit wide, 2-to-1 multiplexer. When sel=0, choose a. When sel=1, choose b.
module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

    // bus mux (Mux2to1v)
    assign out = sel ? b : a;
    
endmodule


// https://hdlbits.01xz.net/wiki/Mux9to1v
// Mux 9 to 1
module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    
    // Mux 9 to 1
    always @ (*) begin
        case(sel)
            4'd0: out = a;
            4'd1: out = b;
            4'd2: out = c;
            4'd3: out = d;
            4'd4: out = e;
            4'd5: out = f;
            4'd6: out = g;
            4'd7: out = h;
            4'd8: out = i;
            default: out = 16'hffff;
        endcase
    end

endmodule


// https://hdlbits.01xz.net/wiki/Mux256to1
// special mux,
// vector indices can be variable, as long as the synthesizer can figure out that
//  the width of the bits being selected is constant. In particular, 
// selecting one bit out of a vector using a variable index will work.
module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );

    // mux 256 to 1
    assign out = in[sel];
    
endmodule


// https://hdlbits.01xz.net/wiki/Mux256to1v
// Create a 4-bit wide, 256-to-1 multiplexer. 
// The 256 4-bit inputs are all packed into a single 1024-bit input vector. 
// sel=0 should select bits in[3:0], sel=1 selects bits in[7:4], sel=2 selects bits in[11:8], etc.
module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    
    // complex mux: 1024 to 4
    assign out = {in[sel*4+3], in[sel*4+2], in[sel*4+1], in[sel*4+0]};
    
endmodule

// block finished