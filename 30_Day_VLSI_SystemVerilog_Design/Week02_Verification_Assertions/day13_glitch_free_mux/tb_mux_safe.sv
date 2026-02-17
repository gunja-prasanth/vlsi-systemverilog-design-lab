`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2026 18:17:20
// Design Name: 
// Module Name: tb_mux_safe
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


module tb_mux_safe;

    logic a, b, sel;
    logic y;

    // Instantiate SAFE MUX
    mux_safe dut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        $display("Starting SAFE MUX simulation...");

        // Case 1: Both inputs 1
        a = 1; 
        b = 1; 
        sel = 0;
        #5 sel = 1;
        #5 sel = 0;
        #5 sel = 1;

        // Case 2: Different inputs
        #10 a = 0; b = 1; sel = 0;
        #5 sel = 1;
        #5 sel = 0;

        // Case 3: Both inputs 0
        #10 a = 0; b = 0; sel = 1;
        #5 sel = 0;

        #10;
        $display("SAFE MUX simulation completed.");
        $finish;
    end

endmodule

