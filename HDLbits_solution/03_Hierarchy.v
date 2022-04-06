////////////////////////////////////////////////////////////////////////////////
// Getting Started
// Verilog Language
// |-- Basics
// |-- Vectors
// |-- Modules: Hierarchy (*)
////////////////////////////////////////////////////////////////////////////////

// https://hdlbits.01xz.net/wiki/Module
module top_module ( input a, input b, output out );
    
    // module instance (by port name)
    mod_a inst(.in1(a),
               .in2(b),
               .out(out));

endmodule

// https://hdlbits.01xz.net/wiki/Module_pos
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    
    // use module by pos
    mod_a(out1, out2, a, b, c, d);

endmodule

// https://hdlbits.01xz.net/wiki/Module_name
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    mod_a(.in1(a),
          .in2(b),
          .in3(c),
          .in4(d),
          .out1(out1),
          .out2(out2));
    
endmodule

// https://hdlbits.01xz.net/wiki/Module_shift 

// You are given a module my_dff with two inputs and one output (that implements a D flip-flop). 
// Instantiate three of them, then chain them together to make a shift register of length 3.
// The clk port needs to be connected to all instances.
// 
// The module provided to you is: module my_dff ( input clk, input d, output q );
// 
// Note that to make the internal connections, you will need to declare some wires.
// Be careful about naming your wires and module instances: the names must be unique.
module top_module ( input clk, input d, output q );
    
    wire d0_out, d1_out;
    
    // D flip-flop index 0
    my_dff d0(.clk(clk),
              .d(d),
              .q(d0_out));
    
    // D flip-flop index 1
    my_dff d1(.clk(clk),
              .d(d0_out),
              .q(d1_out));
    
    // D flip-flop index 2
    my_dff d2(.clk(clk),
              .d(d1_out),
              .q(q));

endmodule

// https://hdlbits.01xz.net/wiki/Module_shift8
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [7:0] d0_out, d1_out, d2_out;
    
    my_dff8 d0(.clk(clk), 
               .d(d), 
               .q(d0_out));
    
    my_dff8 d1(.clk(clk), 
               .d(d0_out), 
               .q(d1_out));
    
    my_dff8 d2(.clk(clk), 
               .d(d1_out), 
               .q(d2_out));
    
    // output comb-logic
    always @(*) begin
        case (sel)
            3:  q = d2_out;
            2:  q = d1_out;
            1:  q = d0_out;
            0:  q = d;
        endcase
    end
    
endmodule


// https://hdlbits.01xz.net/wiki/Module_add
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire [15:0] sum_low, sum_hig;
    wire cout;
    
    add16 adder_low(.a(a[15:0]),
                    .b(b[15:0]),
                    .cin(1'b0),
                    .cout(cout),
                    .sum(sum_low));
    
    add16 adder_hig(.a(a[31:16]),
                    .b(b[31:16]),
                    .cin(cout),
                    .cout(),
                    .sum(sum_hig));
    
    assign sum = {sum_hig, sum_low};    

endmodule

// https://hdlbits.01xz.net/wiki/Module_fadd
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    
    wire tmp_cout;
    
    add16 add_low(.a(a[15:0]),
                  .b(b[15:0]),
                  .cin(0),
                  .sum(sum[15:0]),
                  .cout(tmp_cout));
    
    add16 add_hig(.a(a[31:16]),
                  .b(b[31:16]),
                  .cin(tmp_cout),
                  .sum(sum[31:16]),
                  .cout());

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign sum = a^b^cin;
    assign cout = (a&b) | (a&cin) | (b&cin);

endmodule


// https://hdlbits.01xz.net/wiki/Module_cseladd
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_high0, sum_high1;
    wire cout;
    
    assign sum[31:16] = cout ? sum_high1 : sum_high0;
    
    add16 add16_high0(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(sum_high0), .cout());
    add16 add16_high1(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(sum_high1), .cout());
    
    add16 add16_low(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(cout));
    
endmodule


// https://hdlbits.01xz.net/wiki/Module_addsub
/* An adder-subtractor can be built from an adder by optionally negating one of the inputs, 
 which is equivalent to inverting the input then adding 1. 
 The net result is a circuit that can do two operations: (a + b + 0) and (a + ~b + 1).
 See Wikipedia if you want a more detailed explanation of how this circuit works.*/
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire [31:0] b_not;
    wire cout;
    
    assign b_not = sub ? ~b : b;
    
    add16 add16_0(.a(a[15:0]),
                  .b(b_not[15:0]),
                  .cin(sub),
                  .sum(sum[15:0]),
                  .cout(cout));
    
    add16 add16_1(.a(a[31:16]),
                  .b(b_not[31:16]),
                  .cin(cout),
                  .sum(sum[31:16]),
                  .cout());

endmodule

// block finished