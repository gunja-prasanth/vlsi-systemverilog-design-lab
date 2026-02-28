`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2026 18:11:07
// Design Name: 
// Module Name: async_fifo
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


module async_fifo #(
    parameter int DATA_WIDTH = 8,
    parameter int ADDR_WIDTH = 3  // Depth = 2^3 = 8
)(
    input  logic wr_clk,
    input  logic rd_clk,
    input  logic rst,

    input  logic wr_en,
    input  logic rd_en,

    input  logic [DATA_WIDTH-1:0] wr_data,
    output logic [DATA_WIDTH-1:0] rd_data,

    output logic full,
    output logic empty
);

    localparam int DEPTH = 1 << ADDR_WIDTH;

    logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Binary pointers
    logic [ADDR_WIDTH:0] wr_bin, rd_bin;

    // Gray pointers
    logic [ADDR_WIDTH:0] wr_gray, rd_gray;
    logic [ADDR_WIDTH:0] wr_gray_sync, rd_gray_sync;

    // Binary to Gray
    assign wr_gray = (wr_bin >> 1) ^ wr_bin;
    assign rd_gray = (rd_bin >> 1) ^ rd_bin;

    // Write domain
    always_ff @(posedge wr_clk or posedge rst) begin
        if (rst)
            wr_bin <= 0;
        else if (wr_en && !full) begin
            mem[wr_bin[ADDR_WIDTH-1:0]] <= wr_data;
            wr_bin <= wr_bin + 1;
        end
    end

    // Read domain
    always_ff @(posedge rd_clk or posedge rst) begin
        if (rst)
            rd_bin <= 0;
        else if (rd_en && !empty) begin
            rd_data <= mem[rd_bin[ADDR_WIDTH-1:0]];
            rd_bin <= rd_bin + 1;
        end
    end

    // 2-flop synchronizers
    logic [ADDR_WIDTH:0] rd_gray_sync1, wr_gray_sync1;

    always_ff @(posedge wr_clk or posedge rst) begin
        if (rst)
            {rd_gray_sync1, rd_gray_sync} <= 0;
        else begin
            rd_gray_sync1 <= rd_gray;
            rd_gray_sync  <= rd_gray_sync1;
        end
    end

    always_ff @(posedge rd_clk or posedge rst) begin
        if (rst)
            {wr_gray_sync1, wr_gray_sync} <= 0;
        else begin
            wr_gray_sync1 <= wr_gray;
            wr_gray_sync  <= wr_gray_sync1;
        end
    end

    // Full logic
    assign full =
        (wr_gray == {~rd_gray_sync[ADDR_WIDTH:ADDR_WIDTH-1],
                      rd_gray_sync[ADDR_WIDTH-2:0]});

    // Empty logic
    assign empty = (rd_gray == wr_gray_sync);

endmodule
