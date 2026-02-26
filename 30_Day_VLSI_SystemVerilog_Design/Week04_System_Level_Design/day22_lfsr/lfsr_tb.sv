`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2026 20:51:39
// Design Name: 
// Module Name: lfsr_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lfsr_tb;

    parameter int N = 4;

    logic clk, rst, enable;
    logic [N-1:0] lfsr_out;

    lfsr #(
        .N(N),
        .TAPS(4'b1001)
    ) dut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .lfsr_out(lfsr_out)
    );

    always #5 clk = ~clk;

    int count = 0;

    initial begin
        clk = 0;
        rst = 1;
        enable = 0;
        #10 rst = 0;
        enable = 1;

        repeat (20) begin
            #10;
            $display("Cycle %0d: %b", count, lfsr_out);
            count++;
        end

        $finish;
    end

endmodule