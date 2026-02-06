`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2026 18:06:20
// Design Name: 
// Module Name: multimode_counter
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


module multimode_counter #(
    parameter int N = 8
)(
    input  logic           clk,
    input  logic           reset_n,   // Active-low reset
    input  logic           en,         // Clock enable
    input  logic           up_down,    // 1 = up, 0 = down
    input  logic           load,
    input  logic [N-1:0]   load_val,
    output logic [N-1:0]   count
);

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            count <= '0;
        else if (en) begin
            if (load)
                count <= load_val;
            else if (up_down)
                count <= count + 1'b1;
            else
                count <= count - 1'b1;
        end
    end

endmodule

