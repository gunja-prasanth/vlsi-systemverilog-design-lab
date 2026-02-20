`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2026 16:47:41
// Design Name: 
// Module Name: uart_rx_tb
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


module uart_rx_tb;

    parameter CLK_FREQ  = 10_000_000;  // Reduced for simulation
    parameter BAUD_RATE = 9600;

    logic clk;
    logic rst;
    logic rx;

    logic [7:0] data_out;
    logic data_valid;
    logic framing_error;

    localparam BAUD_TICK = CLK_FREQ / BAUD_RATE;

    uart_rx #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD_RATE(BAUD_RATE)
    ) dut (
        .clk(clk),
        .rst(rst),
        .rx(rx),
        .data_out(data_out),
        .data_valid(data_valid),
        .framing_error(framing_error)
    );

    // Clock generation (100ns period)
    always #50 clk = ~clk;

    task send_byte(input [7:0] data);
        integer i;
        begin
            // Start bit
            rx = 0;
            #(BAUD_TICK*100);

            // Data bits (LSB first)
            for (i = 0; i < 8; i++) begin
                rx = data[i];
                #(BAUD_TICK*100);
            end

            // Stop bit
            rx = 1;
            #(BAUD_TICK*100);
        end
    endtask

    initial begin
        clk = 0;
        rst = 1;
        rx  = 1;  // idle state

        #200;
        rst = 0;

        send_byte(8'hA5);

        #50000;

        if (data_valid && data_out == 8'hA5 && !framing_error)
            $display("UART RX TEST PASSED");
        else
            $fatal("UART RX TEST FAILED");

        $finish;
    end

endmodule