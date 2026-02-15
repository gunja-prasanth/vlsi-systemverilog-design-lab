`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2026 11:04:31
// Design Name: 
// Module Name: clock_enable_counter
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


module clock_enable_counter (
    input  logic clk,
    input  logic rst,
    input  logic enable,
    output logic [3:0] count
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'd0;
        else if (enable)
            count <= count + 1;
        else
            count <= count;   // Hold state
    end

endmodule
