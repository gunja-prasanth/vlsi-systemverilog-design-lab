`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 21:03:52
// Design Name: 
// Module Name: memory_top
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


module memory_top;

    parameter ADDR_WIDTH = 4;
    parameter DATA_WIDTH = 8;

    logic clk;
    logic reset;
    logic we;

    logic [ADDR_WIDTH-1:0] addr;
    logic [DATA_WIDTH-1:0] ram_out;
    logic [DATA_WIDTH-1:0] processed_data;

    address_generator #(ADDR_WIDTH) addr_gen (
        .clk(clk),
        .reset(reset),
        .addr(addr)
    );

    ram #(ADDR_WIDTH, DATA_WIDTH) mem (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(processed_data),
        .dout(ram_out)
    );

    data_processor #(DATA_WIDTH) proc (
        .data_in(ram_out),
        .data_out(processed_data)
    );

endmodule
