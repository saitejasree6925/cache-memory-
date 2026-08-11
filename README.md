# cache-memory-
Cache Memory using Verilog

Description

A simple direct-mapped cache memory designed using Verilog HDL to demonstrate fast data access and cache hit/miss operations.

Features

- Direct-mapped cache
- Read operation
- Write operation
- Cache hit detection
- Cache miss detection
- Valid bit and tag comparison
- Simple testbench for verification
- Simulation waveform support

Files

cache-memory/
├── README.md
├── src/
│   └── cache_memory.v
├── tb/
│   └── cache_memory_tb.v
└── simulation/
    └── simulation_results.md

Working Principle

The memory address is divided into:

+--------+-------+--------+
|  TAG   | INDEX | OFFSET |
+--------+-------+--------+

The cache checks the valid bit and compares the tag with the requested address.

- Cache Hit: Requested data is available in the cache.
- Cache Miss: Requested data is not available in the cache.

Tools Required

- Verilog HDL
- Icarus Verilog / ModelSim / QuestaSim
- GTKWave (optional, for waveform viewing)

Simulation

Compile the design and testbench:

iverilog -o cache_sim src/cache_memory.v tb/cache_memory_tb.v

Run the simulation:

vvp cache_sim

Generate waveform:

iverilog -o cache_sim -D DUMP_WAVE src/cache_memory.v tb/cache_memory_tb.v
vvp cache_sim

Open the waveform using GTKWave:

gtkwave cache_memory.vcd

Expected Result

The testbench checks:

- Initial cache miss
- Data storage after a miss
- Subsequent cache hit
- Write operation
- Data read after write

Applications

Cache memory is commonly used in:

- CPUs
- Microprocessors
- Embedded systems
- Computer architecture
- High-speed memory systems

Author

Created as a Verilog HDL digital design project.

author: Sai teja sree 
