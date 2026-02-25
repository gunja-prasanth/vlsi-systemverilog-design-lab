`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2026 16:34:55
// Design Name: 
// Module Name: mini_subsystem_top
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


module mini_subsystem_top #(parameter N = 8)(
    input  logic clk,
    input  logic rst,
    input  logic [N-1:0] ext_data,
    input  logic [2:0]   alu_sel,
    input  logic         fifo_rd,
    output logic [N-1:0] fifo_out,
    output logic         fifo_empty
);

    logic [N-1:0] counter_out;
    logic [N-1:0] alu_out;
    logic         fifo_full;

    // Counter
    multi_mode_counter #(N) u_counter (
        .clk(clk),
        .rst(rst),
        .enable(1'b1),
        .mode(2'b00),
        .data_in('0),
        .count(counter_out)
    );

    // ALU
    alu #(N) u_alu (
        .A(counter_out),
        .B(ext_data),
        .ALU_SEL(alu_sel),
        .Y(alu_out),
        .Z(),
        .C(),
        .V()
    );

    // FIFO
    synchronous_fifo #(N,16) u_fifo (
        .clk(clk),
        .rst(rst),
        .wr_en(~fifo_full),
        .rd_en(fifo_rd),
        .data_in(alu_out),
        .data_out(fifo_out),
        .full(fifo_full),
        .empty(fifo_empty)
    );

endmodule