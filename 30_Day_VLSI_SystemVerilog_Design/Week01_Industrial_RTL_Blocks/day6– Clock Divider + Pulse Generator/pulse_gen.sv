`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2026 22:26:39
// Design Name: 
// Module Name: pulse_gen
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


module pulse_gen (
    input  logic clk,
    input  logic rst,
    input  logic enable,
    output logic pulse
);

    logic enable_d;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            enable_d <= 1'b0;
            pulse    <= 1'b0;
        end else begin
            enable_d <= enable;
            pulse    <= enable & ~enable_d; // one-clock pulse on rising edge
        end
    end

endmodule
