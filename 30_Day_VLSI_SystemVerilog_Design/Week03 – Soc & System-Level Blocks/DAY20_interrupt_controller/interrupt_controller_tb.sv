`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2026 18:32:35
// Design Name: 
// Module Name: interrupt_controller_tb
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


module interrupt_controller_tb;

    parameter int N = 8;

    logic [N-1:0] irq;
    logic [N-1:0] mask;
    logic irq_valid;
    logic [$clog2(N)-1:0] irq_id;

    interrupt_controller #(N) dut (
        .irq(irq),
        .mask(mask),
        .irq_valid(irq_valid),
        .irq_id(irq_id)
    );

    task check(input logic exp_valid, input logic [$clog2(N)-1:0] exp_id);
        if (irq_valid !== exp_valid || irq_id !== exp_id)
            $fatal("FAIL: Expected valid=%0b id=%0d | Got valid=%0b id=%0d",
                   exp_valid, exp_id, irq_valid, irq_id);
        else
            $display("PASS");
    endtask

    initial begin
        // No interrupt
        irq = 0; mask = 0; #10;
        check(0, 0);

        // Single interrupt
        irq = 8'b00001000; mask = 0; #10;
        check(1, 3);

        // Multiple interrupts (highest wins)
        irq = 8'b01001000; mask = 0; #10;
        check(1, 6);

        // Mask highest
        irq = 8'b01001000; mask = 8'b01000000; #10;
        check(1, 3);

        // Mask all
        irq = 8'b11111111; mask = 8'b11111111; #10;
        check(0, 0);

        $display("ALL TESTS PASSED");
        $finish;
    end

endmodule