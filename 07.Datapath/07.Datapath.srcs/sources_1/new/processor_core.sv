`timescale 1ns / 1ps

module processor_core(
    input logic clk_i,
    input logic rst_i,
    
    input logic stall_i,
    input logic [31:0] instr_i,
    input logic [31:0] mem_rd_i,
    
    output logic [31:0] instr_addr_o,
    output logic [31:0] mem_addr_o,
    output logic [2:0] mem_size_o,
    output logic mem_req_o,
    output logic mem_we_o,
    output logic [31:0] mem_wd_o
    );
    
    //decoder
    logic [1:0] dec_a_sel;
    logic [2:0] dec_b_sel;
    logic [4:0] dec_alu_op;    
    logic       dec_gpr_we;
    logic [1:0] dec_wb_sel;
    logic       dec_branch;
    logic       dec_jal;
    logic       dec_jalr;
       
    decoder dec(
        .fetched_instr_i(instr_i),
        .a_sel_o(dec_a_sel),
        .b_sel_o(dec_b_sel),
        .alu_op_o(dec_alu_op),
        .csr_op_o(),
        .csr_we_o(),
        .mem_req_o(mem_req_o),
        .mem_we_o(mem_we_o),
        .mem_size_o(mem_size_o),
        .gpr_we_o(dec_gpr_we),
        .wb_sel_o(dec_wb_sel),
        .illegal_instr_o(),
        .branch_o(dec_branch),
        .jal_o(dec_jal),
        .jalr_o(dec_jalr),
        .mret_o()
    );
   
    logic reg_write_enable;
    logic [4:0] reg_read_addr1;
    logic [4:0] reg_read_addr2;
    logic [4:0] reg_write_addr;
    logic [31:0] reg_write_data;
    logic [31:0] reg_read_data1;
    logic [31:0] reg_read_data2;
    logic [31:0] wb_data;
       
    assign reg_read_addr1 = instr_i[19:15];
    assign reg_read_addr2 = instr_i[24:20];
    assign reg_write_addr = instr_i[11:7];
    assign reg_write_data = wb_data;
    assign reg_write_enable = ~stall_i & dec_gpr_we;
    
    register_file regfile(
        .clk_i(clk_i),
        .write_enable_i(reg_write_enable),
        .read_addr1_i(reg_read_addr1),
        .read_addr2_i(reg_read_addr2),
        .write_addr_i(reg_write_addr),
        .write_data_i(reg_write_data),
        .read_data1_o(reg_read_data1),
        .read_data2_o(reg_read_data2)
    );
    
    logic [31:0] PC;
    logic [31:0] PC_res;
    
    always_ff @(posedge clk_i) begin
        if(rst_i) PC <= 32'b0;
        else if (~stall_i) PC <= PC_res;
    end
    
    assign instr_addr_o = PC;
    
    logic flag_res = 1'b0;
    
    logic [31:0] a_res;
    logic [31:0] b_res;
    
    always_comb begin
        case (dec_a_sel)
            2'd0: a_res = reg_read_data1;
            2'd1: a_res = PC;
            2'd2: a_res = 32'b0;
            default: a_res = 32'b0;
        endcase
    end  
    
    always_comb begin
        case (dec_b_sel)
            3'd0: b_res = reg_read_data2;
            3'd1: b_res = {{20{instr_i[31]}}, instr_i[31:20]};
            3'd2: b_res = {instr_i[31:12], 12'h000};
            3'd3: b_res = {{20{instr_i[31]}}, instr_i[31:25], instr_i[11:7]};
            3'd4: b_res = 32'd4;
            default: b_res = 32'd4;
        endcase
    end
    
    logic [31:0] alu_res;
    
    alu main_alu(
        .a_i(a_res),
        .b_i(b_res),
        .alu_op_i(dec_alu_op),
        .flag_o(flag_res),
        .result_o(alu_res)
    );
    
    assign mem_addr_o = alu_res;
    assign wb_data = dec_wb_sel ? mem_rd_i : alu_res; 
    assign mem_wd_o = reg_read_data2;
    
    logic [31:0] branch_res;
    logic [31:0] jal_output;
   
    assign branch_res = dec_branch ? 
        {{19{instr_i[31]}}, instr_i[31], instr_i[7], instr_i[30:25], instr_i[11:8], 1'b0}
        : {{11{instr_i[31]}}, instr_i[31], instr_i[19:12], instr_i[20], instr_i[30:21], 1'b0};
    
    assign jal_output = (flag_res & dec_branch) | dec_jal ? branch_res : 32'd4;
    
    logic [31:0] PC_jal_result;
    logic PC_jal_adder_carry_o;
    logic RD1_imm_I_adder_carry_o;
    
    fulladder32 PC_jal_adder(
        .a_i(PC),
        .b_i(jal_output),
        .carry_i(1'b0),
        .sum_o(PC_jal_result),
        .carry_o(PC_jal_adder_carry_o)
    );
    
    logic [31:0] offset_res;
    
    fulladder32 RD1_imm_I_adder(
        .a_i(reg_read_data1),
        .b_i({{20{instr_i[31]}}, instr_i[31:20]}),
        .carry_i(1'b0),
        .sum_o(offset_res),
        .carry_o(RD1_imm_I_adder_carry_o)
    );
    
    assign PC_res = dec_jalr ? {offset_res[31:1], 1'b0} : PC_jal_result;
endmodule
