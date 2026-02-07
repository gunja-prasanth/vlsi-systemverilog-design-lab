`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2026 12:49:16
// Design Name: 
// Module Name: usr_tb
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


module usr_tb;

    parameter int N = 8;

    logic clk, rst;
    logic [1:0] mode;
    logic serial_in;
    logic [N-1:0] parallel_in;
    logic serial_out;
    logic [N-1:0] parallel_out;

    universal_shift_register #(N) dut (
        .clk(clk), .rst(rst), .mode(mode),
        .serial_in(serial_in),
        .parallel_in(parallel_in),
        .serial_out(serial_out),
        .parallel_out(parallel_out)
    );

    always #5 clk = ~clk;

    task check(input [N-1:0] exp);
        if (parallel_out !== exp)
            $fatal("FAIL: Expected=%b Got=%b", exp, parallel_out);
        else
            $display("PASS: %b", parallel_out);
    endtask

    initial begin
        clk = 0; rst = 1;
        mode = 2'b00;
        serial_in = 0;
        parallel_in = 0;
        #10 rst = 0;

        // SISO
        serial_in = 1; #10;
        serial_in = 0; #10;
        check(8'b00000010);

        // SIPO
        mode = 2'b01;
        serial_in = 1; #10;
        serial_in = 1; #10;
        check(8'b00001011);

        // PISO
        mode = 2'b10;
        parallel_in = 8'b10101010;
        #10;
        check(8'b01010101);

        // PIPO
        mode = 2'b11;
        parallel_in = 8'b11110000;
        #10;
        check(8'b11110000);

        $display("ALL MODES VERIFIED ");
        $finish;
    end

endmodule
