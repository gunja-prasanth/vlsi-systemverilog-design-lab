`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2026 18:14:21
// Design Name: 
// Module Name: tb_mux_glitchy
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


module tb_mux_glitchy;

    logic a, b, sel;
    logic y;

    mux_glitchy dut (.a(a), .b(b), .sel(sel), .y(y));

    initial begin
        a = 1; 
        b = 1;

        sel = 0;
        #5 sel = 1;
        #5 sel = 0;
        #5 sel = 1;

        #10 $finish;
    end

endmodule
