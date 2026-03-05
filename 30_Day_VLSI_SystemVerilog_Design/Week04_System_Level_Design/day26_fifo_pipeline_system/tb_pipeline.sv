`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2026 20:25:56
// Design Name: 
// Module Name: tb_pipeline
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


module tb_pipeline;

logic clk;
logic rst;

top_pipeline dut (
    .clk(clk),
    .rst(rst)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    #20 rst = 0;

    #500 $finish;
end

endmodule
