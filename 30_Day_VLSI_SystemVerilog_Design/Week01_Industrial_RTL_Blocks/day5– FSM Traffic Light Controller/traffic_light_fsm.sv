`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2026 19:12:26
// Design Name: 
// Module Name: traffic_light_fsm
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


module traffic_light_fsm (
    input  logic clk,
    input  logic rst,
    output logic red,
    output logic yellow,
    output logic green
);

    typedef enum logic [1:0] {
        S_RED        = 2'b00,
        S_RED_YELLOW= 2'b01,
        S_GREEN     = 2'b10,
        S_YELLOW    = 2'b11
    } state_t;

    state_t state, next_state;

    // State register
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            state <= S_RED;
        else
            state <= next_state;
    end

    // Next-state logic
    always_comb begin
        case (state)
            S_RED:         next_state = S_RED_YELLOW;
            S_RED_YELLOW: next_state = S_GREEN;
            S_GREEN:      next_state = S_YELLOW;
            S_YELLOW:     next_state = S_RED;
            default:      next_state = S_RED; // illegal state handling
        endcase
    end

    // Output logic (Moore)
    always_comb begin
        red    = 0;
        yellow = 0;
        green  = 0;

        case (state)
            S_RED:         red = 1;
            S_RED_YELLOW: begin red = 1; yellow = 1; end
            S_GREEN:      green = 1;
            S_YELLOW:     yellow = 1;
        endcase
    end

endmodule
