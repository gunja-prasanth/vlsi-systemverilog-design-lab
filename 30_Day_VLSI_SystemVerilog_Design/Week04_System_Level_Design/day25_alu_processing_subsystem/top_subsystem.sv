`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2026 22:31:48
// Design Name: 
// Module Name: top_subsystem
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


module top_subsystem(
    input  logic clk,
    input  logic start,
    output logic done
);

logic [7:0] rdata1, rdata2;
logic [7:0] alu_out;
logic [2:0] alu_op;

controller ctrl(
    .clk(clk),
    .start(start),
    .done(done),
    .alu_op(alu_op)
);

register_file rf(
    .clk(clk),
    .we(1'b1),
    .waddr(2'b00),
    .wdata(alu_out),
    .raddr1(2'b01),
    .raddr2(2'b10),
    .rdata1(rdata1),
    .rdata2(rdata2)
);

alu alu_unit(
    .a(rdata1),
    .b(rdata2),
    .op(alu_op),
    .y(alu_out)
);

endmodule