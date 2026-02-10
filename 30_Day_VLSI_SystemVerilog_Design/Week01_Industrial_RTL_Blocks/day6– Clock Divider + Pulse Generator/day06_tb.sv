`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2026 22:28:16
// Design Name: 
// Module Name: day06_tb
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


module day06_tb;

    logic clk, rst, enable;
    logic clk_div, pulse;

    clock_divider #(.DIV(4)) u_div (
        .clk(clk), .rst(rst), .clk_div(clk_div)
    );

    pulse_gen u_pulse (
        .clk(clk), .rst(rst), .enable(enable), .pulse(pulse)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; enable = 0;
        #20 rst = 0;

        // Enable pulse
        #15 enable = 1;
        #10 enable = 0;

        // Hold enable high (should still generate single pulse)
        #20 enable = 1;
        #40 enable = 1;
        #10 enable = 0;

        #50;
        $display("DAY 6 SIMULATION COMPLETE ");
        $finish;
    end

endmodule

