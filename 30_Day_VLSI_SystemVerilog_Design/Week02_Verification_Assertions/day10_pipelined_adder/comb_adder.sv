`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2026 17:55:19
// Design Name: 
// Module Name: comb_adder
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


module comb_adder #(
    parameter int N = 16
)(
    input  logic [N-1:0] A,
    input  logic [N-1:0] B,
    output logic [N-1:0] SUM
);

    assign SUM = A + B;

endmodule
