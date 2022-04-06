////////////////////////////////////////////////////////////////////////////////
// Getting Started (*)
// Verilog Language
////////////////////////////////////////////////////////////////////////////////

// https://hdlbits.01xz.net/wiki/Step_one
module top_module( output one );

    // Insert your code here
    assign one = 1'b1;

endmodule


// https://hdlbits.01xz.net/wiki/Zero
module top_module(
    output zero
);// Module body starts after semicolon

    assign zero = 1'b0;

endmodule

// block finished