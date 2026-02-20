`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2026 16:46:18
// Design Name: 
// Module Name: uart_rx
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


module uart_rx #(
    parameter CLK_FREQ = 100_000_000,
    parameter BAUD_RATE = 9600
)(
    input  logic clk,
    input  logic rst,
    input  logic rx,
    output logic [7:0] data_out,
    output logic data_valid,
    output logic framing_error
);

    localparam integer BAUD_TICK = CLK_FREQ / BAUD_RATE;
    localparam integer HALF_TICK = BAUD_TICK / 2;

    typedef enum logic [2:0] {
        IDLE,
        START,
        DATA,
        STOP
    } state_t;

    state_t state;
    logic [15:0] baud_cnt;
    logic [2:0]  bit_index;
    logic [7:0]  shift_reg;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            baud_cnt <= 0;
            bit_index <= 0;
            data_valid <= 0;
            framing_error <= 0;
        end
        else begin
            case (state)

                IDLE: begin
                    data_valid <= 0;
                    if (rx == 0) begin
                        state <= START;
                        baud_cnt <= 0;
                    end
                end

                START: begin
                    if (baud_cnt == HALF_TICK) begin
                        if (rx == 0) begin
                            state <= DATA;
                            baud_cnt <= 0;
                            bit_index <= 0;
                        end
                        else
                            state <= IDLE;
                    end
                    else
                        baud_cnt <= baud_cnt + 1;
                end

                DATA: begin
                    if (baud_cnt == BAUD_TICK-1) begin
                        shift_reg[bit_index] <= rx;
                        baud_cnt <= 0;

                        if (bit_index == 7)
                            state <= STOP;
                        else
                            bit_index <= bit_index + 1;
                    end
                    else
                        baud_cnt <= baud_cnt + 1;
                end

                STOP: begin
                    if (baud_cnt == BAUD_TICK-1) begin
                        data_out <= shift_reg;
                        data_valid <= 1;

                        if (rx != 1)
                            framing_error <= 1;
                        else
                            framing_error <= 0;

                        state <= IDLE;
                        baud_cnt <= 0;
                    end
                    else
                        baud_cnt <= baud_cnt + 1;
                end

            endcase
        end
    end

endmodule
