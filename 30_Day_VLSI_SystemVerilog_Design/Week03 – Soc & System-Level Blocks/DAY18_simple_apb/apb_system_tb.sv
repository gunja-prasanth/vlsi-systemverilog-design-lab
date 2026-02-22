`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2026 18:09:23
// Design Name: 
// Module Name: apb_system_tb
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


module apb_system_tb;

    parameter ADDR_WIDTH = 8;
    parameter DATA_WIDTH = 32;

    logic PCLK;
    logic PRESETn;

    logic start;
    logic rw;
    logic [ADDR_WIDTH-1:0] addr;
    logic [DATA_WIDTH-1:0] wdata;

    logic PSEL, PENABLE, PWRITE;
    logic [ADDR_WIDTH-1:0] PADDR;
    logic [DATA_WIDTH-1:0] PWDATA;
    logic [DATA_WIDTH-1:0] PRDATA;
    logic PREADY;

    logic [DATA_WIDTH-1:0] rdata;
    logic done;

    // Clock
    initial PCLK = 0;
    always #5 PCLK = ~PCLK;

    // Instantiate MASTER
    apb_master #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) master (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .start(start),
        .rw(rw),
        .addr(addr),
        .wdata(wdata),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA),
        .PREADY(PREADY),
        .rdata(rdata),
        .done(done)
    );

    // Instantiate SLAVE
    apb_slave #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) slave (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA),
        .PREADY(PREADY)
    );

    initial begin
        PRESETn = 0;
        start = 0;
        #20;
        PRESETn = 1;

        @(posedge PCLK);
        addr  = 8'h10;
        wdata = 32'hA5A5A5A5;
        rw    = 1;
        start = 1;

        @(posedge PCLK);
        start = 0;

        wait(done);

        // READ TRANSACTION
        @(posedge PCLK);
        addr  = 8'h10;
        rw    = 0;
        start = 1;

        @(posedge PCLK);
        start = 0;

        wait(done);

        if (rdata !== 32'hA5A5A5A5)
            $fatal("ERROR: Read data mismatch!");
        else
            $display("PASS: APB Write/Read Successful");

        #20;
        $finish;
    end

endmodule
