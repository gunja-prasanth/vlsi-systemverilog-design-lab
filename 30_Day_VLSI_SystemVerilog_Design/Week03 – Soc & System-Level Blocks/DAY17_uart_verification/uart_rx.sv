`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2026 19:17:50
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


module uart_rx(
    input  logic clk,
    input  logic rst,
    input  logic baud_tick,
    input  logic rx,
    output logic [7:0] data_out,
    output logic done,
    output logic error
);

    typedef enum logic [1:0] {
        IDLE,
        DATA,
        STOP
    } state_t;

    state_t state;

    logic [2:0] bit_index;
    logic [7:0] data_reg;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state     <= IDLE;
            bit_index <= 0;
            done      <= 0;
            error     <= 0;
        end
        else begin
            done <= 0;

            case (state)

                IDLE: begin
                    if (rx == 0) begin  // detect start bit
                        state <= DATA;
                        bit_index <= 0;
                    end
                end

                DATA: if (baud_tick) begin
                    data_reg[bit_index] <= rx;
                    if (bit_index == 7)
                        state <= STOP;
                    else
                        bit_index <= bit_index + 1;
                end

                STOP: if (baud_tick) begin
                    if (rx == 1) begin
                        data_out <= data_reg;
                        done <= 1;
                        error <= 0;
                    end
                    else begin
                        error <= 1;
                    end
                    state <= IDLE;
                end

            endcase
        end
    end

endmodule