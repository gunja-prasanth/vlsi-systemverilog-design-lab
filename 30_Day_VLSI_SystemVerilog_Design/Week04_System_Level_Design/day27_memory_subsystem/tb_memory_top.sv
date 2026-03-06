`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2026 21:06:05
// Design Name: 
// Module Name: tb_memory_top
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


module tb_memory_top;

    logic clk;
    logic reset;
    logic we;

    memory_top dut();

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        we = 1;

        #10 reset = 0;

        #200;

        $display("Memory subsystem simulation finished");
        $finish;
    end

endmodule