`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2026 18:40:41
// Design Name: 
// Module Name: gray_counter
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


module gray_counter #(
    parameter int N = 4
)(
    input  logic clk,
    input  logic rst,
    input  logic enable,
    output logic [N-1:0] bin_count,
    output logic [N-1:0] gray_count
);

    // Binary Counter
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            bin_count <= '0;
        else if (enable)
            bin_count <= bin_count + 1;
    end

    // Binary to Gray conversion
    assign gray_count = (bin_count >> 1) ^ bin_count;

endmodule