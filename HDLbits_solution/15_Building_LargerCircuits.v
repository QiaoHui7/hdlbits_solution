// https://hdlbits.01xz.net/wiki/Exams/review2015_count1k
module top_module (
    input clk,
    input reset,
    output [9:0] q);

    reg [9:0] counter;
    
    always @ (posedge clk) begin
        if((counter === 999) || (reset))  begin
            counter <= 0;
        end else begin
            counter <= counter+1;
        end
    end
    
    assign q = counter;
    
endmodule

