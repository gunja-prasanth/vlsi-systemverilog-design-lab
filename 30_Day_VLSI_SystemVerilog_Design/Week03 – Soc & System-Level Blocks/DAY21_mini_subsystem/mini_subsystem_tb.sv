`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2026 16:36:16
// Design Name: 
// Module Name: mini_subsystem_tb
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


module mini_subsystem_tb;

    parameter N = 8;

    logic clk = 0;
    logic rst;
    logic [N-1:0] ext_data;
    logic [2:0]   alu_sel;
    logic         fifo_rd;
    logic [N-1:0] fifo_out;
    logic         fifo_empty;

    mini_subsystem_top #(N) dut (
        .clk(clk),
        .rst(rst),
        .ext_data(ext_data),
        .alu_sel(alu_sel),
        .fifo_rd(fifo_rd),
        .fifo_out(fifo_out),
        .fifo_empty(fifo_empty)
    );

    always #5 clk = ~clk;

    initial begin
        rst = 1; fifo_rd = 0; ext_data = 5; alu_sel = 3'b000;
        #20 rst = 0;

        #100 fifo_rd = 1;
        #50  fifo_rd = 0;

        #100 $finish;
    end

endmodule
