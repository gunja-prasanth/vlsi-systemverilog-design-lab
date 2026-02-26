`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2026 20:50:25
// Design Name: 
// Module Name: lfsr
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


module lfsr #(
    parameter int N = 4,
    parameter logic [N-1:0] TAPS = 4'b1001  // x^4 + x + 1 (example)
)(
    input  logic clk,
    input  logic rst,
    input  logic enable,
    output logic [N-1:0] lfsr_out
);

    logic feedback;

    // XOR selected tap positions
    assign feedback = ^(lfsr_out & TAPS);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            lfsr_out <= 'h1; // Non-zero seed required
        else if (enable)
            lfsr_out <= {lfsr_out[N-2:0], feedback};
    end

endmodule
