// a very good reference:
// http://referencedesigner.com/tutorials/verilog/verilog_32.php

// https://hdlbits.01xz.net/wiki/Shift4
module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    
    always @ (posedge clk, posedge areset) begin
        if (areset) begin
            q <= 0;
        end else if (load) begin
            q <= data;
        end else if (ena) begin
            q = {1'b0, q[3:1]};
        end else begin
            q = q;
        end
    end

endmodule

// https://hdlbits.01xz.net/wiki/Rotate100
module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 

    always @ (posedge clk) begin
        if (load) begin
            q <= data;
        end else begin
            case(ena)
                2'b01:  q <= {q[0], q[99:1]};
                2'b10:  q <= {q[98:0], q[99]};
                default: q <= q;
            endcase
        end
    end
    
endmodule

// https://hdlbits.01xz.net/wiki/Shift18
module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    always @ (posedge clk) begin
        if (load) begin
            q <= data; // load data
        end else if (ena) begin
            case (amount)
                2'b00: q <= {q[63-1:0], 1'b0};  //shift left by 1 bit.
                2'b01: q <= {q[63-8:0], 8'b0000_0000}; //shift left by 8 bit.
                2'b10: q <= {q[63], q[63:0+1]};  //shift right by 1 bit.
                2'b11: q <= {{8{q[63]}}, q[63:0+8]};  //shift right by 8 bit.
            endcase
        end else begin
            q <= q; // keep reg
        end
    end

endmodule

// https://hdlbits.01xz.net/wiki/Lfsr5

