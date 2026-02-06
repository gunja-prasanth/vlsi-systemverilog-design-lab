`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2026 18:13:46
// Design Name: 
// Module Name: multimode_counter_tb
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


module multimode_counter_tb;

    parameter int N = 8;

    logic clk;
    logic reset_n;
    logic en;
    logic up_down;
    logic load;
    logic [N-1:0] load_val;
    logic [N-1:0] count;

    multimode_counter #(N) dut (
        .clk(clk),
        .reset_n(reset_n),
        .en(en),
        .up_down(up_down),
        .load(load),
        .load_val(load_val),
        .count(count)
    );

    // Clock
    always #5 clk = ~clk;

    task check(input [N-1:0] exp);
        if (count !== exp)
            $fatal("FAIL: Expected=%0d Got=%0d", exp, count);
        else
            $display("PASS: Count=%0d", count);
    endtask

    initial begin
        clk = 0;
        reset_n = 0;
        en = 0;
        load = 0;
        up_down = 1;
        load_val = '0;

        #10 reset_n = 1;

        // Load
        en = 1; load = 1; load_val = 8'd10;
        #10 load = 0;
        check(10);

        // Count up
        up_down = 1;
        #10 check(11);
        #10 check(12);

        // Count down
        up_down = 0;
        #10 check(11);
        #10 check(10);

        // Clock disable
        en = 0;
        #10 check(10);

        $display("ALL TESTS PASSED ");
        $finish;
    end

endmodule
