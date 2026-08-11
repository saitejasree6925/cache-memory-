`timescale 1ns/1ps

module cache_memory_tb;

    reg clk;
    reg reset;
    reg read_en;
    reg write_en;
    reg [7:0] address;
    reg [7:0] write_data;

    wire [7:0] read_data;
    wire hit;

    cache_memory uut (
        .clk(clk),
        .reset(reset),
        .read_en(read_en),
        .write_en(write_en),
        .address(address),
        .write_data(write_data),
        .read_data(read_data),
        .hit(hit)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Waveform generation
        $dumpfile("cache_memory.vcd");
        $dumpvars(0, cache_memory_tb);

        // Initial values
        clk = 0;
        reset = 1;
        read_en = 0;
        write_en = 0;
        address = 8'b0;
        write_data = 8'b0;

        // Reset
        #10;
        reset = 0;

        // --------------------------------
        // Write data to cache
        // Address = 0x25
        // Data    = 0xAB
        // --------------------------------
        #10;
        address = 8'h25;
        write_data = 8'hAB;
        write_en = 1;

        #10;
        write_en = 0;

        // --------------------------------
        // Read same address
        // Expected: Cache HIT
        // Data = AB
        // --------------------------------
        #10;
        address = 8'h25;
        read_en = 1;

        #10;
        read_en = 0;

        $display("Address = %h, Data = %h, Hit = %b",
                 address, read_data, hit);

        // --------------------------------
        // Read different address
        // Expected: Cache MISS
        // --------------------------------
        #10;
        address = 8'h35;
        read_en = 1;

        #10;
        read_en = 0;

        $display("Address = %h, Data = %h, Hit = %b",
                 address, read_data, hit);

        #20;

        $finish;
    end

endmodule