`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2026 19:54:24
// Design Name: 
// Module Name: alu
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


module alu #(
    parameter int N = 8
)(
    input  logic [N-1:0] A,
    input  logic [N-1:0] B,
    input  logic [2:0]   ALU_SEL,
    output logic [N-1:0] Y,
    output logic         Z,
    output logic         C,
    output logic         V
);

    logic [N:0] result_ext;

    always_comb begin
        Y = '0;
        C = 1'b0;
        V = 1'b0;

        case (ALU_SEL)
            3'b000: begin // ADD
                result_ext = {1'b0, A} + {1'b0, B};
                Y = result_ext[N-1:0];
                C = result_ext[N];
                V = (~(A[N-1] ^ B[N-1])) & (Y[N-1] ^ A[N-1]);
            end

            3'b001: begin // SUB
                result_ext = {1'b0, A} - {1'b0, B};
                Y = result_ext[N-1:0];
                C = result_ext[N];
                V = (A[N-1] ^ B[N-1]) & (Y[N-1] ^ A[N-1]);
            end

            3'b010: Y = A & B;
            3'b011: Y = A | B;
            3'b100: Y = A ^ B;

            default: Y = '0;
        endcase
    end

    assign Z = (Y == '0);

endmodule

