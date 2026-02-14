`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2026 18:02:11
// Design Name: 
// Module Name: adder_tb
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


module adder_tb;

    parameter int N = 16;

    logic clk, rst;
    logic [N-1:0] A, B;
    logic [N-1:0] sum_comb, sum_pipe;

    comb_adder #(N) u_comb (
        .A(A), .B(B), .SUM(sum_comb)
    );

    pipe_adder #(N) u_pipe (
        .clk(clk), .rst(rst),
        .A(A), .B(B),
        .SUM(sum_pipe)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;

        A = 10; B = 5;
        #10;
        A = 100; B = 25;
        #10;
        A = 300; B = 40;
        #40;

        $finish;
    end

endmodule

