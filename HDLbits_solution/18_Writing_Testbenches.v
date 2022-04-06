// https://hdlbits.01xz.net/wiki/Tb/clock
module top_module ( );

    // must use reg
    reg clk;
    
    initial begin
        // the init state
        clk = 0;
        
        // update logic
        forever begin
            #5 ; // delay 5
            clk <= ~clk;
        end
    end
    
    // DUT
    dut inst(.clk(clk));
    
endmodule

