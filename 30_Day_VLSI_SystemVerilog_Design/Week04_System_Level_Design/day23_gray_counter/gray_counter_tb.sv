`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2026 18:41:46
// Design Name: 
// Module Name: gray_counter_tb
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


module gray_counter_tb;

    parameter int N = 4;

    logic clk, rst, enable;
    logic [N-1:0] bin_count;
    logic [N-1:0] gray_count;

    gray_counter #(N) dut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .bin_count(bin_count),
        .gray_count(gray_count)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        enable = 0;
        #10 rst = 0;
        enable = 1;

        repeat (16) begin
            #10;
            $display("Binary=%b  Gray=%b", bin_count, gray_count);
        end

        $finish;
    end

endmodule