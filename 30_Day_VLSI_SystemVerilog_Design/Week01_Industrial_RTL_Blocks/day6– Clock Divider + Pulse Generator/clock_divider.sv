`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2026 22:25:32
// Design Name: 
// Module Name: clock_divider
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


module clock_divider #(
    parameter int DIV = 4   // must be even for 50% duty cycle
)(
    input  logic clk,
    input  logic rst,
    output logic clk_div
);

    localparam int CNT_W = $clog2(DIV);
    logic [CNT_W-1:0] cnt;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt     <= '0;
            clk_div <= 1'b0;
        end else begin
            if (cnt == (DIV/2 - 1)) begin
                cnt     <= '0;
                clk_div <= ~clk_div;
            end else begin
                cnt <= cnt + 1'b1;
            end
        end
    end

endmodule

