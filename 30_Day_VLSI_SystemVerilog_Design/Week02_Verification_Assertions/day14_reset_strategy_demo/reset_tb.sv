`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2026 20:25:20
// Design Name: 
// Module Name: reset_tb
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


module reset_tb;

    logic clk;
    logic rst_n;
    logic d;
    logic q_async;
    logic q_sync;

    async_reset_ff u_async (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q_async)
    );

    sync_reset_ff u_sync (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q_sync)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        d = 0;
        rst_n = 0;   // Apply reset
        #7 rst_n = 1; // Release reset (not aligned to clock)

        #10 d = 1;
        #10 d = 0;

        // Assert reset mid-cycle
        #3 rst_n = 0;
        #4 rst_n = 1;

        #20 $finish;
    end

endmodule
