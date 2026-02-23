`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2026 18:47:43
// Design Name: 
// Module Name: rr_arbiter
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


module rr_arbiter #(
    parameter int N = 4
)(
    input  logic             clk,
    input  logic             rst,
    input  logic [N-1:0]     req,
    output logic [N-1:0]     grant
);

    logic [$clog2(N)-1:0] pointer;
    logic [N-1:0] rotated_req;
    logic [N-1:0] rotated_grant;

    // Pointer update
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            pointer <= 0;
        else if (|grant)
            pointer <= pointer + 1;
    end

    // Rotate request based on pointer
    assign rotated_req = (req >> pointer) | (req << (N - pointer));

    // Grant logic (priority to lowest index after rotation)
    always_comb begin
        rotated_grant = '0;
        for (int i = 0; i < N; i++) begin
            if (rotated_req[i]) begin
                rotated_grant[i] = 1'b1;
                break;
            end
        end
    end

    // Rotate grant back
    assign grant = (rotated_grant << pointer) | (rotated_grant >> (N - pointer));

endmodule