`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2026 18:10:28
// Design Name: 
// Module Name: uart_tx_tb
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


module uart_tx_tb;

    logic clk = 0;
    logic rst;
    logic start;
    logic [7:0] data_in;
    logic tx;
    logic busy;
    logic baud_tick;

    always #5 clk = ~clk;

    baud_gen #(100_000_000, 9600) bg (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick)
    );

    uart_tx dut (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick),
        .start(start),
        .data_in(data_in),
        .tx(tx),
        .busy(busy)
    );

    initial begin
        rst = 1; start = 0;
        #20 rst = 0;

        #20;
        data_in = 8'hA5;
        start   = 1;
        #10 start = 0;

        #200000;
        $finish;
    end

endmodule
