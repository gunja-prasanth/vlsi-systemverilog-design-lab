`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2026 20:38:10
// Design Name: 
// Module Name: fsm_onehot
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


module fsm_onehot (
    input  logic clk,
    input  logic rst,
    input  logic start,
    output logic done
);

    typedef enum logic [3:0] {
        IDLE    = 4'b0001,
        LOAD    = 4'b0010,
        PROCESS = 4'b0100,
        DONE    = 4'b1000
    } state_t;

    state_t current_state, next_state;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always_comb begin
        next_state = current_state;
        done = 0;

        case (current_state)
            IDLE:    if (start) next_state = LOAD;
            LOAD:    next_state = PROCESS;
            PROCESS: next_state = DONE;
            DONE: begin
                done = 1;
                next_state = IDLE;
            end
        endcase
    end

endmodule
