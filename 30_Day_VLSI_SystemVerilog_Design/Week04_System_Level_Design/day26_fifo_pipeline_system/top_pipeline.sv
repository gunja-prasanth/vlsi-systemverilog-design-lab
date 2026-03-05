`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2026 20:24:01
// Design Name: 
// Module Name: top_pipeline
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


module top_pipeline (
    input logic clk,
    input logic rst
);

logic [7:0] prod_data;
logic [7:0] fifo_data;

logic write_en;
logic read_en;

logic full;
logic empty;

producer prod (
    .clk(clk),
    .rst(rst),
    .fifo_full(full),
    .data_out(prod_data),
    .write_en(write_en)
);

fifo fifo_inst (
    .clk(clk),
    .rst(rst),
    .write_en(write_en),
    .read_en(read_en),
    .data_in(prod_data),
    .data_out(fifo_data),
    .full(full),
    .empty(empty)
);

consumer cons (
    .clk(clk),
    .rst(rst),
    .fifo_empty(empty),
    .data_in(fifo_data),
    .read_en(read_en)
);

endmodule
