`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2026 18:00:46
// Design Name: 
// Module Name: pipe_adder
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


module pipe_adder #(
    parameter int N = 16
)(
    input  logic clk,
    input  logic rst,
    input  logic [N-1:0] A,
    input  logic [N-1:0] B,
    output logic [N-1:0] SUM
);

    logic [N/2:0] lower_sum_reg;
    logic [N/2-1:0] upper_A_reg, upper_B_reg;

    // Stage 1
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            lower_sum_reg <= 0;
            upper_A_reg   <= 0;
            upper_B_reg   <= 0;
        end
        else begin
            lower_sum_reg <= A[N/2-1:0] + B[N/2-1:0];
            upper_A_reg   <= A[N-1:N/2];
            upper_B_reg   <= B[N-1:N/2];
        end
    end

    // Stage 2
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            SUM <= 0;
        else
            SUM <= { (upper_A_reg + upper_B_reg + lower_sum_reg[N/2]),
                     lower_sum_reg[N/2-1:0] };
    end

endmodule
