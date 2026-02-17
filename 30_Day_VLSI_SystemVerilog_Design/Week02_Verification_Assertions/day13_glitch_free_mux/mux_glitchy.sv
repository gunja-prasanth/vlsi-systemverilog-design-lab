`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2026 18:11:56
// Design Name: 
// Module Name: mux_glitchy
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


module mux_glitchy (
    input  logic a,
    input  logic b,
    input  logic sel,
    output logic y
);

    // Classic implementation
    assign y = (~sel & a) | (sel & b);

endmodule

