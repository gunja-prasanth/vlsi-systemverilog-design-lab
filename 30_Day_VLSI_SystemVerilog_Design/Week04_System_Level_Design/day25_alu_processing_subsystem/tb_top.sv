`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2026 22:33:47
// Design Name: 
// Module Name: tb_top
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


module tb_top;

logic clk;
logic start;
logic done;

top_subsystem dut(
    .clk(clk),
    .start(start),
    .done(done)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    start = 0;

    #10 start = 1;
    #10 start = 0;

    wait(done);

    $display("Subsystem operation completed");
    #20 $finish;
end

endmodule