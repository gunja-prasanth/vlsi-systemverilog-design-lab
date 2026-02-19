`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2026 18:08:54
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input  logic clk,
    input  logic rst,
    input  logic baud_tick,
    input  logic start,
    input  logic [7:0] data_in,
    output logic tx,
    output logic busy
);

    typedef enum logic [1:0] {
        IDLE,
        START,
        DATA,
        STOP
    } state_t;

    state_t state;

    logic [2:0] bit_index;
    logic [7:0] data_reg;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state     <= IDLE;
            tx        <= 1'b1;
            busy      <= 0;
            bit_index <= 0;
        end
        else begin
            case (state)

                IDLE: begin
                    tx   <= 1'b1;
                    busy <= 0;
                    if (start) begin
                        data_reg <= data_in;
                        state    <= START;
                        busy     <= 1;
                    end
                end

                START: if (baud_tick) begin
                    tx    <= 0;
                    state <= DATA;
                    bit_index <= 0;
                end

                DATA: if (baud_tick) begin
                    tx <= data_reg[bit_index];
                    if (bit_index == 7)
                        state <= STOP;
                    else
                        bit_index <= bit_index + 1;
                end

                STOP: if (baud_tick) begin
                    tx    <= 1;
                    state <= IDLE;
                end

            endcase
        end
    end

endmodule

