`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 20:20:30
// Design Name: 
// Module Name: sync_fifo
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


module sync_fifo #(
    parameter int DATA_WIDTH = 8,
    parameter int DEPTH      = 16
)(
    input  logic                     clk,
    input  logic                     rst,

    input  logic                     wr_en,
    input  logic                     rd_en,
    input  logic [DATA_WIDTH-1:0]    wr_data,

    output logic [DATA_WIDTH-1:0]    rd_data,
    output logic                     full,
    output logic                     empty
);

    localparam int ADDR_WIDTH = $clog2(DEPTH);

    logic [DATA_WIDTH-1:0] mem [DEPTH-1:0];

    logic [ADDR_WIDTH:0] wr_ptr;
    logic [ADDR_WIDTH:0] rd_ptr;

    // Write logic
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            wr_ptr <= 0;
        else if (wr_en && !full) begin
            mem[wr_ptr[ADDR_WIDTH-1:0]] <= wr_data;
            wr_ptr <= wr_ptr + 1;
        end
    end

    // Read logic
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            rd_ptr <= 0;
        else if (rd_en && !empty)
            rd_ptr <= rd_ptr + 1;
    end

    assign rd_data = mem[rd_ptr[ADDR_WIDTH-1:0]];

    // Status flags
    assign empty = (wr_ptr == rd_ptr);
    assign full  = (wr_ptr[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]) &&
                   (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);

endmodule

