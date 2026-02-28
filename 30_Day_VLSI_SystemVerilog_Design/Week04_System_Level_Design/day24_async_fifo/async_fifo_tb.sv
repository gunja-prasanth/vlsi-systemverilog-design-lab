`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2026 18:13:07
// Design Name: 
// Module Name: async_fifo_tb
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


module async_fifo_tb;

    logic wr_clk, rd_clk, rst;
    logic wr_en, rd_en;
    logic [7:0] wr_data, rd_data;
    logic full, empty;

    async_fifo #(8,3) dut (
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .wr_data(wr_data),
        .rd_data(rd_data),
        .full(full),
        .empty(empty)
    );

    // Different clocks
    always #5  wr_clk = ~wr_clk;   // 100 MHz
    always #7  rd_clk = ~rd_clk;   // ~71 MHz

    initial begin
        wr_clk = 0;
        rd_clk = 0;
        rst = 1;
        wr_en = 0;
        rd_en = 0;

        #20 rst = 0;

        // Write data
        repeat (10) begin
            @(posedge wr_clk);
            wr_en = 1;
            wr_data = $random;
        end
        wr_en = 0;

        // Read data
        repeat (10) begin
            @(posedge rd_clk);
            rd_en = 1;
        end
        rd_en = 0;

        #100 $finish;
    end

endmodule
