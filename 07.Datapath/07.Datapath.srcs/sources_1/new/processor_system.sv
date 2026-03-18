`timescale 1ns / 1ps

module processor_system(
    input logic clk_i,
    input logic rst_i
    );
   
    logic stall;
    logic [31:0] instr;
    logic [31:0] mem_rd;
    logic [31:0] instr_addr;
    logic [31:0] mem_addr;
    logic [2:0] mem_size;
    logic mem_req;
    logic mem_we;
    logic [31:0] mem_wd;
    
    instr_mem mem(
        .read_addr_i(instr_addr),
        .read_data_o(instr)
    );
    
    always_ff@(posedge clk_i) begin
        if(rst_i) stall <= 1'b0;
        else stall <= (~stall & mem_req);
    end
    
    processor_core core(   
        .clk_i(clk_i),
        .rst_i(rst_i),
        .stall_i(~stall & mem_req),
        .instr_i(instr),
        .mem_rd_i(mem_rd),
        
        .instr_addr_o(instr_addr),
        .mem_addr_o(mem_addr),
        .mem_size_o(mem_size),
        .mem_req_o(mem_req),
        .mem_we_o(mem_we),
        .mem_wd_o(mem_wd)
    );
    
    logic ready;
    
    data_mem d_mem(
        .clk_i(clk_i),
        .mem_req_i(mem_req),
        .write_enable_i(mem_we),
        .byte_enable_i(4'b1111),
        .addr_i(mem_addr),
        .write_data_i(mem_wd),
        .read_data_o(mem_rd),
        .ready_o(ready)
    );

endmodule
