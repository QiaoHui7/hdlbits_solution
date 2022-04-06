////////////////////////////////////////////////////////////////////////////////
// Getting Started
// Verilog Language
// Circuits
// |-- Combinational Logic
// |-- Sequential Logic
//     |-- Latch and Flip-Flops
//     |-- Counters (*)
////////////////////////////////////////////////////////////////////////////////

// Counters.v

// https://hdlbits.01xz.net/wiki/Count15
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    always @ (posedge clk) begin
        if((reset) | (q == 4'b1111)) begin
            q <= 4'b0000;
        end else begin
            q <= q+1;
        end
    end

endmodule


// https://hdlbits.01xz.net/wiki/Count10
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    always @ (posedge clk) begin
        if((reset) | (q == 4'b1001)) begin
            q <= 4'b0000;
        end else begin
            q <= q+1;
        end
    end

endmodule


// https://hdlbits.01xz.net/wiki/Count1to10
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    always @ (posedge clk) begin
        if((reset) | (q == 4'b1010)) begin
            q <= 4'b0001;
        end else begin
            q <= q+1;
        end
    end

endmodule


// https://hdlbits.01xz.net/wiki/Countslow
module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    reg [3:0] cnt;
    
    always @ (posedge clk) begin
        if (reset) begin
            cnt <= 0;
        end else begin
            if (slowena) begin
                cnt <= ((cnt+1)==10) ? 0 : (cnt+1);
            end else begin
                cnt <= cnt;
            end
        end
    end
    
    assign q = cnt;

endmodule


// https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q7a 
/*
Design a 1-12 counter with the following inputs and outputs:

Reset Synchronous active-high reset that forces the counter to 1
Enable Set high for the counter to run
Clk Positive edge-triggered clock input
Q[3:0] The output of the counter
c_enable, c_load, c_d[3:0] Control signals going to the provided 4-bit counter, so correct operation can be verified.
You have the following components available:

the 4-bit binary counter (count4) below, which has Enable and synchronous parallel-load inputs (load has higher priority than enable). The count4 module is provided to you. Instantiate it in your circuit.
logic gates
module count4(
	input clk,
	input enable,
	input load,
	input [3:0] d,
	output reg [3:0] Q
);
The c_enable, c_load, and c_d outputs are the signals that go to the internal counter's enable, load, and d inputs, respectively. Their purpose is to allow these signals to be checked for correctness.
*/

