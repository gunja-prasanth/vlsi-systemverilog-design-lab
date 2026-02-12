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

    int pass_count = 0;
    int fail_count = 0;

    // DUT
    alu #(N) dut (
        .A(A),
        .B(B),
        .ALU_SEL(ALU_SEL),
        .Y(Y),
        .Z(Z),
        .C(C),
        .V(V)
    );

    // -------------------------------------------------
    // FUNCTION: Calculate Expected Result
    // -------------------------------------------------
    function automatic [N-1:0] expected_result(
        input [N-1:0] a,
        input [N-1:0] b,
        input [2:0] sel
    );
        case (sel)
            3'b000: expected_result = a + b;
            3'b001: expected_result = a - b;
            3'b010: expected_result = a & b;
            3'b011: expected_result = a | b;
            3'b100: expected_result = a ^ b;
            default: expected_result = 0;
        endcase
    endfunction

    // -------------------------------------------------
    // TASK: Apply Stimulus
    // -------------------------------------------------
    task automatic apply_test(
        input [N-1:0] a,
        input [N-1:0] b,
        input [2:0] sel
    );
        A = a;
        B = b;
        ALU_SEL = sel;
        #10;

        check_output(expected_result(a, b, sel));
    endtask

    // -------------------------------------------------
    // TASK: Check Output
    // -------------------------------------------------
    task automatic check_output(
        input [N-1:0] expected
    );
        if (Y === expected) begin
            pass_count++;
            $display("PASS | A=%0d B=%0d SEL=%0b RESULT=%0d",
                      A, B, ALU_SEL, Y);
        end
        else begin
            fail_count++;
            $display("FAIL | A=%0d B=%0d SEL=%0b EXPECTED=%0d GOT=%0d",
                      A, B, ALU_SEL, expected, Y);
        end
    endtask

    // -------------------------------------------------
    // TEST SEQUENCE
    // -------------------------------------------------
    initial begin

    // ------------------------------
    // Directed Tests (basic sanity)
    // ------------------------------
    apply_test(10, 20, 3'b000);
    apply_test(30, 10, 3'b001);
    apply_test(8'hAA, 8'h0F, 3'b010);
    apply_test(8'hAA, 8'h0F, 3'b011);
    apply_test(8'hAA, 8'h0F, 3'b100);

    // ------------------------------
    // Corner Case Tests
    // ------------------------------
    apply_test(0, 0, 3'b000);          // Zero + Zero
    apply_test(8'hFF, 1, 3'b000);      // Overflow case
    apply_test(8'h80, 8'h80, 3'b000);  // Signed overflow
    apply_test(8'h00, 8'hFF, 3'b001);  // Underflow

    // ------------------------------
    // Random Tests
    // ------------------------------
    repeat (20) begin
        A = $urandom;
        B = $urandom;
        ALU_SEL = $urandom % 5;  // valid range 0-4
        #10;
        check_output(expected_result(A, B, ALU_SEL));
    end

    // ------------------------------
    // Summary
    // ------------------------------
    $display("=================================");
    $display("TOTAL PASSED = %0d", pass_count);
    $display("TOTAL FAILED = %0d", fail_count);
    $display("=================================");

    if (fail_count == 0)
        $display("FINAL RESULT: ALL TESTS PASSED");
    else
        $display("FINAL RESULT: TESTS FAILED");

    $finish;
end
endmodule