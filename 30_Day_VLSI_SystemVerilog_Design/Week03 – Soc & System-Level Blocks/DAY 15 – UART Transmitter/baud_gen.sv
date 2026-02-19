`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2026 18:07:47
// Design Name: 
// Module Name: baud_gen
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


module baud_gen #(
    parameter CLK_FREQ = 100_000_000,
    parameter BAUD_RATE = 9600
)(
    input  logic clk,
    input  logic rst,
    output logic baud_tick
);

    localparam int DIVISOR = CLK_FREQ / BAUD_RATE;

    int counter;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            counter   <= 0;
            baud_tick <= 0;
        end
        else begin
            if (counter == DIVISOR-1) begin
                counter   <= 0;
                baud_tick <= 1;
            end
            else begin
                counter   <= counter + 1;
                baud_tick <= 0;
            end
        end
    end

endmodule

