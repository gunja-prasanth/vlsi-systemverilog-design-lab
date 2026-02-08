`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2026 20:45:01
// Design Name: 
// Module Name: decoder
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


module decoder #(
    parameter int N = 8
)(
    input  logic [$clog2(N)-1:0] dec,
    input  logic                 en,
    output logic [N-1:0]         out
);

    always_comb begin
        out = '0;
        if (en)
            out[dec] = 1'b1;
    end

endmodule

