`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2026 18:19:27
// Design Name: 
// Module Name: interrupt_controller
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


module interrupt_controller #(
    parameter int N = 8   // number of interrupt lines
)(
    input  logic [N-1:0] irq,        // interrupt requests
    input  logic [N-1:0] mask,       // mask bits (1 = disabled)
    output logic         irq_valid,  // interrupt present
    output logic [$clog2(N)-1:0] irq_id // highest priority ID
);

    logic [N-1:0] active;

    // Apply mask
    assign active = irq & ~mask;

    always_comb begin
        irq_valid = 1'b0;
        irq_id    = '0;

        // Fixed priority: highest index = highest priority
        for (int i = N-1; i >= 0; i--) begin
            if (active[i]) begin
                irq_valid = 1'b1;
                irq_id    = i[$clog2(N)-1:0];
                break;
            end
        end
    end

endmodule