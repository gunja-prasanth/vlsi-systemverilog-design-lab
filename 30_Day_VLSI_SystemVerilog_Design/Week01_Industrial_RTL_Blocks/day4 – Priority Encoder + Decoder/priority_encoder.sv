`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2026 20:43:43
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder #(
    parameter int N = 8
)(
    input  logic [N-1:0] req,
    output logic [$clog2(N)-1:0] enc,
    output logic valid
);

    integer i;

    always_comb begin
        enc   = '0;
        valid = 1'b0;

        for (i = N-1; i >= 0; i--) begin
            if (req[i]) begin
                enc   = i[$clog2(N)-1:0];
                valid = 1'b1;
                break;
            end
        end
    end

endmodule

