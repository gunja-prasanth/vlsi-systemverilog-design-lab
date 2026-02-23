`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2026 18:48:57
// Design Name: 
// Module Name: rr_arbiter_tb
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


module rr_arbiter_tb;

    parameter int N = 4;

    logic clk;
    logic rst;
    logic [N-1:0] req;
    logic [N-1:0] grant;

    rr_arbiter #(N) dut (
        .clk(clk),
        .rst(rst),
        .req(req),
        .grant(grant)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;

        // Test 1: All request active
        req = 4'b1111;

        repeat (8) begin
            @(posedge clk);
            $display("Grant = %b", grant);
        end

        // Test 2: Single requester
        req = 4'b0100;
        @(posedge clk);
        if (grant !== 4'b0100)
            $fatal("FAIL: Single request case failed");

        $display("All tests passed");
        $finish;
    end

endmodule