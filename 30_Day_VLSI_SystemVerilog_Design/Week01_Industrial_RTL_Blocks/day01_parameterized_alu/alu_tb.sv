`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2026 19:55:39
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;

    parameter int N = 8;

    logic [N-1:0] A, B;
    logic [2:0]   ALU_SEL;
    logic [N-1:0] Y;
    logic Z, C, V;

    alu #(N) dut (
        .A(A), .B(B), .ALU_SEL(ALU_SEL),
        .Y(Y), .Z(Z), .C(C), .V(V)
    );

    task check(input [N-1:0] exp);
        if (Y !== exp)
            $fatal("FAIL: Expected=%0d Got=%0d", exp, Y);
        else
            $display("PASS: Result=%0d", Y);
    endtask

    initial begin
        // ADD
        A=10; B=20; ALU_SEL=3'b000; #10; check(30);

        // SUB
        A=30; B=10; ALU_SEL=3'b001; #10; check(20);

        // AND
        A=8'hAA; B=8'h0F; ALU_SEL=3'b010; #10; check(8'h0A);

        // OR
        ALU_SEL=3'b011; #10; check(8'hAF);

        // XOR
        ALU_SEL=3'b100; #10; check(8'hA5);

        $display("ALL TESTS PASSED ?");
        $finish;
    end

endmodule
