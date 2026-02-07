`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2026 12:47:59
// Design Name: 
// Module Name: universal_shift_register
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


module universal_shift_register #(
    parameter int N = 8
)(
    input  logic           clk,
    input  logic           rst,
    input  logic [1:0]     mode,
    input  logic           serial_in,
    input  logic [N-1:0]   parallel_in,
    output logic           serial_out,
    output logic [N-1:0]   parallel_out
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            parallel_out <= '0;
        end else begin
            case (mode)
                2'b00: begin // SISO
                    parallel_out <= {parallel_out[N-2:0], serial_in};
                end

                2'b01: begin // SIPO
                    parallel_out <= {parallel_out[N-2:0], serial_in};
                end

                2'b10: begin // PISO
                    parallel_out <= {parallel_out[N-2:0], parallel_in[N-1]};
                end

                2'b11: begin // PIPO
                    parallel_out <= parallel_in;
                end
            endcase
        end
    end

    assign serial_out = parallel_out[N-1];

endmodule

