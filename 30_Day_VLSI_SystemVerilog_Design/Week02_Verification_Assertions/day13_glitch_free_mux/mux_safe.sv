`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2026 18:12:59
// Design Name: 
// Module Name: mux_safe
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


module mux_safe (
    input  logic a,
    input  logic b,
    input  logic sel,
    output logic y
);

    always_comb begin
        case (sel)
            1'b0: y = a;
            1'b1: y = b;
            default: y = 1'b0;
        endcase
    end

endmodule
