`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2026 18:07:17
// Design Name: 
// Module Name: apb_system
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


// APB MASTER
module apb_master #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 32
)(
    input  logic                   PCLK,
    input  logic                   PRESETn,
    input  logic                   start,
    input  logic                   rw,      // 1 = write, 0 = read
    input  logic [ADDR_WIDTH-1:0]  addr,
    input  logic [DATA_WIDTH-1:0]  wdata,

    output logic                   PSEL,
    output logic                   PENABLE,
    output logic                   PWRITE,
    output logic [ADDR_WIDTH-1:0]  PADDR,
    output logic [DATA_WIDTH-1:0]  PWDATA,

    input  logic [DATA_WIDTH-1:0]  PRDATA,
    input  logic                   PREADY,

    output logic [DATA_WIDTH-1:0]  rdata,
    output logic                   done
);

    typedef enum logic [1:0] {IDLE, SETUP, ACCESS} state_t;
    state_t state, next_state;

    always_ff @(posedge PCLK or negedge PRESETn) begin
        if (!PRESETn)
            state <= IDLE;
        else
            state <= next_state;
    end

    always_comb begin
        PSEL = 0;
        PENABLE = 0;
        done = 0;
        next_state = state;

        case(state)
            IDLE: begin
                if (start)
                    next_state = SETUP;
            end

            SETUP: begin
                PSEL = 1;
                next_state = ACCESS;
            end

            ACCESS: begin
                PSEL = 1;
                PENABLE = 1;
                if (PREADY) begin
                    done = 1;
                    next_state = IDLE;
                end
            end
        endcase
    end

    assign PWRITE = rw;
    assign PADDR  = addr;
    assign PWDATA = wdata;
    assign rdata  = PRDATA;

endmodule


// APB SLAVE
module apb_slave #(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 32
)(
    input  logic                   PCLK,
    input  logic                   PRESETn,
    input  logic                   PSEL,
    input  logic                   PENABLE,
    input  logic                   PWRITE,
    input  logic [ADDR_WIDTH-1:0]  PADDR,
    input  logic [DATA_WIDTH-1:0]  PWDATA,

    output logic [DATA_WIDTH-1:0]  PRDATA,
    output logic                   PREADY
);

    logic [DATA_WIDTH-1:0] mem [0:255];

    always_ff @(posedge PCLK or negedge PRESETn) begin
        if (!PRESETn) begin
            PREADY <= 0;
            PRDATA <= 0;
        end
        else begin
            PREADY <= 0;

            if (PSEL && PENABLE) begin
                PREADY <= 1;

                if (PWRITE)
                    mem[PADDR] <= PWDATA;
                else
                    PRDATA <= mem[PADDR];
            end
        end
    end

endmodule
