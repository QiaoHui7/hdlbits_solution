////////////////////////////////////////////////////////////////////////////////
// Getting Started
// Verilog Language
// Circuits
// |-- Combinational Logic
// |-- Sequential Logic
//     |-- Latch and Flip-Flops (*)
////////////////////////////////////////////////////////////////////////////////

// https://hdlbits.01xz.net/wiki/Dff
// D flip-flop
module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//

    // Use a clocked always block
    //   copy d to q at every positive edge of clk
    //   Clocked always blocks should use non-blocking assignments
    always @(posedge clk) begin
        q <= d;
    end

endmodule


// https://hdlbits.01xz.net/wiki/Dff8
// D flip-flop array
module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);

    always @(posedge clk) begin
        q <= d;
    end
endmodule


// https://hdlbits.01xz.net/wiki/Dff8r
// 8 D flip-flops with active high synchronous reset
module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    // synchronous reset
    always @(posedge clk) begin
        if(reset) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end
endmodule


// https://hdlbits.01xz.net/wiki/Dff8p
// 8 D flip-flops with active high synchronous reset to 0x34
module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    // synchronous reset
    always @(negedge clk) begin
        if(reset) begin
            q <= 8'h34;
        end
        else begin
            q <= d;
        end
    end
endmodule


// https://hdlbits.01xz.net/wiki/Dff8ar
//8 D flip-flops with active high asynchronous reset.
module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    // asynchronous reset
    always @(posedge clk, posedge areset) begin
        if(areset) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end
endmodule


// https://hdlbits.01xz.net/wiki/Dff16e
//16 D flip-flops. It's sometimes useful to only modify parts of a group of flip-flops. 
// The byte-enable inputs control whether each byte of the 16 registers should be written to on that cycle. byteena[1] controls the upper byte d[15:8], while byteena[0] controls the lower byte d[7:0].
// resetn is a synchronous, active-low reset.
module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @ (posedge clk) begin
        if(!resetn) begin
            q <= 0;
        end
        else begin
            // high byte
            if(byteena[1]) begin
                q[15:8] <= d[15:8];
            end
            // low byte
            if(byteena[0]) begin
                q[7:0] <= d[7:0];
            end
        end
    end
    
endmodule


// https://hdlbits.01xz.net/wiki/Exams/m2014_q4a
// D latch
module top_module (
    input d, 
    input ena,
    output q);

    always @ (*) begin
        if(ena) begin
            q <= d;
        end
    end
        
endmodule


// https://hdlbits.01xz.net/wiki/Exams/m2014_q4b
module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);

    always @ (posedge clk, posedge ar) begin
        if(ar) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end
    
endmodule


// 
module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);
    always @ (posedge clk) begin
        if(reset) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end

endmodule


// https://hdlbits.01xz.net/wiki/Exams/m2014_q4c
// synchronous dff
module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q
);
    always @ (posedge clk) begin
        if(r) begin
            q <= 0;
        end
        else begin
            q <= d;
        end
    end

endmodule


// https://hdlbits.01xz.net/wiki/Exams/m2014_q4d
// dff with gate
module top_module (
    input clk,
    input in, 
    output out);

    // create wire
    wire d, q;
    
    // gate
    assign d = in^q;
    
    // dff
    always @ (posedge clk) begin
        q <= d;
    end
    
    // output
    assign out = q;
    
endmodule


// https://hdlbits.01xz.net/wiki/Mt2015_muxdff
// muxdff
module top_module (
    input clk,
    input L,
    input r_in,
    input q_in,
    output reg Q);
    
    wire D;
    
    // mux
    assign D = L ? r_in : q_in ;
    
    // dff
    always @ (posedge clk) begin
        Q <= D;
    end

endmodule

