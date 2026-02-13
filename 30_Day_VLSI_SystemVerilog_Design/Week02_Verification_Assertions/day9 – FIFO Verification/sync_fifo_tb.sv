`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2026 20:21:55
// Design Name: 
// Module Name: sync_fifo_tb
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


module sync_fifo_tb;

    parameter DATA_WIDTH = 8;
    parameter DEPTH = 16;

    logic clk;
    logic rst;
    logic wr_en, rd_en;
    logic [DATA_WIDTH-1:0] wr_data;
    logic [DATA_WIDTH-1:0] rd_data;
    logic full, empty;

    sync_fifo #(DATA_WIDTH, DEPTH) dut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .wr_data(wr_data),
        .rd_data(rd_data),
        .full(full),
        .empty(empty)
    );

//--------------------------------------------------
// Assertions for Overflow and Underflow
//--------------------------------------------------
always @(posedge clk) begin
    if (full && wr_en)
        $error("Overflow detected!");
end

always @(posedge clk) begin
    if (empty && rd_en)
        $error("Underflow detected!");
end


    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        #20;
        rst = 0;

        //--------------------------------------------------
// 1 FILL FIFO COMPLETELY
//--------------------------------------------------
repeat (DEPTH) begin
    @(posedge clk);
    wr_en = 1;
    rd_en = 0;
    wr_data = $urandom;
end

// Stop writing
@(posedge clk);
wr_en = 0;

//--------------------------------------------------
// 2 OVERFLOW ATTEMPT
//--------------------------------------------------
@(posedge clk);
wr_en = 1;   // try writing when full
wr_data = 8'hAA;

@(posedge clk);
wr_en = 0;

//--------------------------------------------------
// 3 EMPTY FIFO COMPLETELY
//--------------------------------------------------
repeat (DEPTH) begin
    @(posedge clk);
    wr_en = 0;
    rd_en = 1;
end

// Stop reading
@(posedge clk);
rd_en = 0;

//--------------------------------------------------
// 4 UNDERFLOW ATTEMPT
//--------------------------------------------------
@(posedge clk);
rd_en = 1;   // try reading when empty

@(posedge clk);
rd_en = 0;

        #20;
        $finish;
    end

endmodule

