`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2026 11:05:38
// Design Name: 
// Module Name: unsafe_clock_gate
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


module unsafe_clock_gate (
    input  logic clk,
    input  logic enable,
    output logic gated_clk
);

    assign gated_clk = clk & enable;  // Glitch-prone

endmodule
