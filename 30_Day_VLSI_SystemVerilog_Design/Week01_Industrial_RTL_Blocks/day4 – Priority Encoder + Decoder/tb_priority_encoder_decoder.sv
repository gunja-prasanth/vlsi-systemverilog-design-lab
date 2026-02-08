`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2026 20:46:09
// Design Name: 
// Module Name: tb_priority_encoder_decoder
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


module tb_priority_encoder_decoder;

    parameter int N = 8;
    logic [N-1:0] req;
    logic [$clog2(N)-1:0] enc;
    logic valid;
    logic [N-1:0] dec_out;

    priority_encoder #(N) pe (
        .req(req), .enc(enc), .valid(valid)
    );

    decoder #(N) dec (
        .dec(enc), .en(valid), .out(dec_out)
    );

    task check(input [N-1:0] expected);
        if (dec_out !== expected)
            $fatal("FAIL: Expected %b, Got %b", expected, dec_out);
        else
            $display("PASS: %b", dec_out);
    endtask

    initial begin
        // One-hot tests
        req = 8'b00001000; #10; check(8'b00001000);
        req = 8'b00000001; #10; check(8'b00000001);

        // Multiple bits (priority)
        req = 8'b10110000; #10; check(8'b10000000);

        // No request
        req = 8'b00000000; #10;
        if (valid) $fatal("FAIL: valid should be 0");

        $display("ALL TESTS PASSED ");
        $finish;
    end

endmodule

