module cache_memory (
    input        clk,
    input        reset,
    input        read_en,
    input        write_en,
    input  [7:0] address,
    input  [7:0] write_data,
    output reg [7:0] read_data,
    output reg       hit
);

    // 16 cache lines
    reg [7:0] data_mem [0:15];
    reg [3:0] tag_mem  [0:15];
    reg       valid_mem[0:15];

    integer i;

    wire [3:0] index = address[3:0];
    wire [3:0] tag   = address[7:4];

    always @(posedge clk) begin

        if (reset) begin
            read_data <= 8'b0;
            hit <= 1'b0;

            for (i = 0; i < 16; i = i + 1) begin
                data_mem[i]  <= 8'b0;
                tag_mem[i]   <= 4'b0;
                valid_mem[i] <= 1'b0;
            end
        end

        else begin

            // Read operation
            if (read_en) begin

                if (valid_mem[index] && tag_mem[index] == tag) begin
                    // Cache hit
                    read_data <= data_mem[index];
                    hit <= 1'b1;
                end

                else begin
                    // Cache miss
                    read_data <= 8'b0;
                    hit <= 1'b0;
                end
            end

            // Write operation
            if (write_en) begin
                data_mem[index]  <= write_data;
                tag_mem[index]   <= tag;
                valid_mem[index] <= 1'b1;
            end
        end
    end

endmodule