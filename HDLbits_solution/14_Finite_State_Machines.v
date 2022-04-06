// Finite_State_Machines

// https://hdlbits.01xz.net/wiki/Fsm1

module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        case(state)
            A:begin
                next_state <= in ? A : B;
            end
            B:begin
                next_state <= in ? B : A;
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        if(areset)begin
            state <= B;
        end else begin
            state <= next_state;
        end
    end

    // Output logic (input: current state)
    assign out = (state == B);

endmodule

// https://hdlbits.01xz.net/wiki/Fsm1s
// Note the Verilog-1995 module declaration syntax here:
module top_module(
    input clk,
    input reset,    // synchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        case(state)
            A:begin
                next_state <= in ? A : B;
            end
            B:begin
                next_state <= in ? B : A;
            end
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            state <= B;
        end else begin
            state <= next_state;
        end
    end

    // Output logic (input: current state)
    assign out = (state == B);

endmodule


// https://hdlbits.01xz.net/wiki/Fsm2
module top_module(
    input clk,
    input areset,    // Asynchronous reset to state OFF
    input j,
    input k,
    output out);//  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        case(state)
            ON:begin
                next_state <= k ? OFF : ON;
            end
            OFF:begin
                next_state <= j ? ON : OFF;
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        if(areset)begin
            state <= OFF;
        end else begin
            state <= next_state;
        end
    end

    // Output logic (input: current state)
    assign out = (state == ON);

endmodule

// https://hdlbits.01xz.net/wiki/Fsm2s
module top_module(
    input clk,
    input reset,    // Asynchronous reset to state OFF
    input j,
    input k,
    output out);//  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        case(state)
            ON:begin
                next_state <= k ? OFF : ON;
            end
            OFF:begin
                next_state <= j ? ON : OFF;
            end
        endcase
    end

    always @(posedge clk) begin    // This is a sequential always block
        if(reset)begin
            state <= OFF;
        end else begin
            state <= next_state;
        end
    end

    // Output logic (input: current state)
    assign out = (state == ON);

endmodule

// https://hdlbits.01xz.net/wiki/Fsm3comb
module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always @ (*) begin
        case(state)
            A:begin
                next_state <= in ? B : A;
            end
            B:begin
                next_state <= in ? B : C;
            end
            C:begin
                next_state <= in ? D : A;
            end
            D:begin
                next_state <= in ? B : C;
            end
        endcase
    end

    // Output logic:  out = f(state) for a Moore state machine
    assign out = (state == D);

endmodule

// https://hdlbits.01xz.net/wiki/Fsm3onehot
module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out);

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = (~in & state[A]) | (~in & state[C]);
    assign next_state[B] = (in & state[A]) | (in & state[B]) | (in & state[D]);
    assign next_state[C] = (~in & state[B]) | (~in & state[D]);
    assign next_state[D] = in & state[C];

    // Output logic: 
    assign out = state[D];

endmodule


// https://hdlbits.01xz.net/wiki/Fsm3
module top_module(
    input clk,
    input in,
    input areset,    // Asynchronous reset to state OFF
    output out);//  

    // 2-bit state
    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next_state;

    always @(*) begin    // This is a combinational always block
        case(state)
            A:begin
                next_state = in ? B : A;
            end
            B:begin
                next_state = in ? B : C;
            end
            C:begin
                next_state = in ? D : A;
            end
            D:begin
                next_state = in ? B : C;
            end
        endcase
    end

    // async reset
    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        if(areset)begin
            state <= A;
        end else begin
            state <= next_state;
        end
    end

    // Output logic (input: current state)
    assign out = (state === D);

endmodule

// https://hdlbits.01xz.net/wiki/Fsm3s
module top_module(
    input clk,
    input in,
    input reset,    // Asynchronous reset to state OFF
    output out);//  

    // 2-bit state
    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next_state;

    always @(*) begin    // This is a combinational always block
        case(state)
            A:begin
                next_state = in ? B : A;
            end
            B:begin
                next_state = in ? B : C;
            end
            C:begin
                next_state = in ? D : A;
            end
            D:begin
                next_state = in ? B : C;
            end
        endcase
    end

    // sync reset
    always @(posedge clk) begin    // This is a sequential always block
        if(reset)begin
            state <= A;
        end else begin
            state <= next_state;
        end
    end

    // Output logic (input: current state)
    assign out = (state === D);

endmodule

// https://hdlbits.01xz.net/wiki/Exams/ece241_2013_q4


