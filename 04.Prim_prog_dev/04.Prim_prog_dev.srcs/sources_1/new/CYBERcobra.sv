`timescale 1ns / 1ps

module CYBERcobra(
    input logic clk_i,
    input logic rst_i,
    input logic [15:0] sw_i,
    output logic [31:0] out_o
    );
    
    logic [31:0] PC;
    logic [31:0] PC_res;
    logic [31:0] read_data_o;
    logic [31:0] PC_offset;
    logic flag_res;
    logic [31:0] WD;
    logic [31:0] alu_result;
    logic [31:0] RD1;
    logic [31:0] RD2;
    
    logic J;
    logic B;
    logic [1:0] WS;
    logic [4:0] ALUop;
    logic [4:0] RA1;
    logic [4:0] RA2;
    logic [7:0] offset_const;
    logic [4:0] WA;
    
    assign J = read_data_o[31];
    assign B = read_data_o[30];
    assign WS = read_data_o[29:28];
    assign ALUop = read_data_o[27:23];
    assign RA1 = read_data_o[22:18];
    assign RA2 = read_data_o[17:13];
    assign offset_const = read_data_o[12:5];
    assign WA = read_data_o[4:0];
           
    always_ff@(posedge clk_i or posedge rst_i) begin
        if(rst_i) 
            PC <= 32'b0;
        else 
            PC <= PC_res;
    end   
   
    always_comb begin
        case(WS) 
            2'b00: WD = {{9{read_data_o[27]}}, read_data_o[27:5]};              
            2'b01: WD = alu_result;     
            2'b10: WD = {{16{sw_i[15]}}, sw_i};  
            2'b11: WD = 32'b0;
            default: WD = 32'b0;
        endcase
    end      
    
    assign PC_offset = J | (B & flag_res) ? {{22{offset_const[7]}}, offset_const, 2'b00} : 32'd4;   
     
    fulladder32 do_PC_offset(
        .a_i(PC),
        .b_i(PC_offset),
        .carry_i(1'b0),
        .sum_o(PC_res),
        .carry_o()
    );
    
    instr_mem imem(
        .read_addr_i(PC),
        .read_data_o(read_data_o)   
    );
    
    register_file reg_file(
        .clk_i(clk_i),
        .write_enable_i(~(B|J)),
        .read_addr1_i(RA1),
        .read_addr2_i(RA2),
        .write_addr_i(WA),
        .write_data_i(WD),
        .read_data1_o(RD1),
        .read_data2_o(RD2)
    ); 
    
    alu do_alu_main_calc(
        .a_i(RD1),
        .b_i(RD2),
        .alu_op_i(ALUop),
        .flag_o(flag_res),
        .result_o(alu_result)
    );
    
    assign out_o = RD1;
endmodule
