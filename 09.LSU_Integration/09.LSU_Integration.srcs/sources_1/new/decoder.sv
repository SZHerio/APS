`timescale 1ns / 1ps

module decoder(
    input logic [31:0] fetched_instr_i,
    output logic [1:0] a_sel_o,
    output logic [2:0] b_sel_o,
    output logic [4:0] alu_op_o,
    output logic [2:0] csr_op_o,
    output logic       csr_we_o,
    output logic       mem_req_o,
    output logic       mem_we_o,
    output logic [2:0] mem_size_o,
    output logic       gpr_we_o,
    output logic [1:0] wb_sel_o,
    output logic       illegal_instr_o,
    output logic       branch_o,
    output logic       jal_o,
    output logic       jalr_o,
    output logic       mret_o
    );
    
    import decoder_pkg::*;
    
    logic [6:0] opcode;
    logic [2:0] func3;
    logic [6:0] func7;
    
    assign opcode = fetched_instr_i[6:0];
    assign func3 = fetched_instr_i[14:12];
    assign func7 = fetched_instr_i[31:25];
    
    always_comb begin
        a_sel_o = OP_A_RS1;
        b_sel_o = OP_B_IMM_I;
        alu_op_o = 5'b0;
        csr_op_o = 3'b0;
        csr_we_o = 1'b0;
        mem_req_o = 1'b0;
        mem_we_o = 1'b0;
        mem_size_o = 3'b0;
        gpr_we_o = 1'b0;
        wb_sel_o = WB_EX_RESULT;
        branch_o = 1'b0;
        jal_o = 1'b0;
        jalr_o = 1'b0;
        mret_o = 1'b0;        
        
        illegal_instr_o = ~{opcode[1:0] == 2'b11};
       
        case (opcode[6:2])
            LOAD_OPCODE: begin
                wb_sel_o = WB_LSU_DATA;   
                gpr_we_o = 1'b1;
                mem_req_o = 1'b1; 
                            
                case (func3)  
                    3'h0: mem_size_o = LDST_B;                     
                    3'h1: mem_size_o = LDST_H;
                    3'h2: mem_size_o = LDST_W;   
                    3'h4: mem_size_o = LDST_BU;        
                    3'h5: mem_size_o = LDST_HU; 
                    default: illegal_instr_o = 1'b1;           
                endcase     
            end
            
            MISC_MEM_OPCODE: begin
                case (func3) 
                    3'h0: begin end
                    default: illegal_instr_o = 1'b1;   
                endcase
            end
            
            OP_OPCODE: begin
                b_sel_o = OP_B_RS2;
                gpr_we_o = 1'b1;    
                
                case (func3)  
                    3'h0: begin
                        case (func7)
                            7'h00: alu_op_o = ALU_ADD;
                            7'h20: alu_op_o = ALU_SUB;    
                            default: illegal_instr_o = 1'b1;    
                        endcase
                    end
                    
                    3'h4: begin 
                        case (func7)
                            3'h00: alu_op_o = ALU_XOR; 
                            default: illegal_instr_o = 1'b1;  
                        endcase 
                    end
                     
                    3'h6: begin 
                        case (func7)
                            3'h00: alu_op_o = ALU_OR;
                            default: illegal_instr_o = 1'b1;  
                        endcase 
                    end
                    
                    3'h7: begin 
                        case (func7)
                            3'h00: alu_op_o = ALU_AND; 
                            default: illegal_instr_o = 1'b1;  
                        endcase 
                    end
                    
                    3'h1: begin 
                        case (func7)
                            3'h00: alu_op_o = ALU_SLL;
                            default: illegal_instr_o = 1'b1;  
                        endcase 
                    end
                    
                    3'h5: begin
                        case (func7)
                            7'h00: alu_op_o = ALU_SRL;
                            7'h20: alu_op_o = ALU_SRA;    
                            default: illegal_instr_o = 1'b1;    
                        endcase
                    end
                    
                    3'h2: begin 
                        case (func7)
                            7'h00: alu_op_o = ALU_SLTS;
                            default: illegal_instr_o = 1'b1;  
                        endcase 
                    end
                    
                    3'h3: begin 
                        case (func7)
                            7'h00:alu_op_o = ALU_SLTU; 
                            default: illegal_instr_o = 1'b1;  
                        endcase 
                    end
                    
                endcase    
            end
            
            OP_IMM_OPCODE: begin    
                gpr_we_o = 1'b1;        
                
                case (func3)
                    3'h0: alu_op_o = ALU_ADD; 
                    3'h4: alu_op_o = ALU_XOR; 
                    3'h6: alu_op_o = ALU_OR; 
                    3'h7: alu_op_o = ALU_AND; 
                    
                    3'h1: begin
                        case (func7)
                            7'h00: alu_op_o = ALU_SLL;
                            default: illegal_instr_o = 1'b1; 
                        endcase 
                    end
                    
                    3'h5: begin
                        case (func7)
                            7'h00: alu_op_o = ALU_SRL;
                            7'h20:alu_op_o = ALU_SRA;  
                            default: illegal_instr_o = 1'b1; 
                        endcase 
                    end
                    
                    3'h2: alu_op_o = ALU_SLTS;
                    3'h3: alu_op_o = ALU_SLTU;
                                     
                endcase
            end
            
            AUIPC_OPCODE: begin
                a_sel_o = OP_A_CURR_PC;
                b_sel_o = OP_B_IMM_U;
                gpr_we_o = 1'b1;   
            end
         
            STORE_OPCODE: begin    
                b_sel_o = OP_B_IMM_S;  
                mem_req_o = 1'b1;
                mem_we_o = 1'b1;    
                                          
                case (func3)
                    3'h0: mem_size_o = LDST_B; 
                    3'h1: mem_size_o = LDST_H; 
                    3'h2: mem_size_o = LDST_W;   
                    default: illegal_instr_o = 1'b1;
                endcase                              
            end
            
            LUI_OPCODE: begin
                gpr_we_o = 1'b1;
                a_sel_o = OP_A_ZERO;
                b_sel_o = OP_B_IMM_U;
            end
            
            BRANCH_OPCODE: begin
                branch_o = 1'b1;
                b_sel_o = OP_B_RS2;
                
                case (func3)
                    3'h0: alu_op_o = ALU_EQ;
                    3'h1: alu_op_o = ALU_NE; 
                    3'h4: alu_op_o = ALU_LTS; 
                    3'h5: alu_op_o = ALU_GES; 
                    3'h6: alu_op_o = ALU_LTU; 
                    3'h7: alu_op_o = ALU_GEU; 
                    default: illegal_instr_o = 1'b1;
                endcase
            end
            
            JALR_OPCODE: begin
                case (func3)
                    3'h0: begin a_sel_o = OP_A_CURR_PC; b_sel_o = OP_B_INCR; gpr_we_o = 1'b1; jalr_o = 1'b1; end
                    default: illegal_instr_o = 1'b1;
                endcase
            end    
            
            JAL_OPCODE: begin
                jal_o = 1'b1;
                gpr_we_o = 1'b1; 
                a_sel_o = OP_A_CURR_PC;
                b_sel_o = OP_B_INCR;
            end    
            
            SYSTEM_OPCODE: begin
                wb_sel_o = WB_CSR_DATA;
                
                case (func3) 
                    3'h0: begin
                        case (fetched_instr_i[31:20])
                            12'h302: mret_o = 1;
                            default: illegal_instr_o = 1'b1;
                        endcase
                    end
                    
                    3'h1: begin gpr_we_o = 1'b1; csr_we_o = 1'b1; csr_op_o = CSR_RW; end
                    3'h2: begin gpr_we_o = 1'b1; csr_we_o = 1'b1; csr_op_o = CSR_RS; end
                    3'h3: begin gpr_we_o = 1'b1; csr_we_o = 1'b1; csr_op_o = CSR_RC; end
                    3'h5: begin gpr_we_o = 1'b1; csr_we_o = 1'b1; csr_op_o = CSR_RWI; end
                    3'h6: begin gpr_we_o = 1'b1; csr_we_o = 1'b1; csr_op_o = CSR_RSI; end
                    3'h7: begin gpr_we_o = 1'b1; csr_we_o = 1'b1; csr_op_o = CSR_RCI; end
                    default: illegal_instr_o = 1'b1;
                endcase
            end
            default: illegal_instr_o = 1'b1;
        endcase 
        
        if(illegal_instr_o == 1'b1) begin
            a_sel_o = OP_A_RS1;
            b_sel_o = OP_B_IMM_I;
            alu_op_o = 5'b0;
            csr_op_o = 3'b0;
            csr_we_o = 1'b0;
            mem_req_o = 1'b0;
            mem_we_o = 1'b0;
            mem_size_o = 3'b0;
            gpr_we_o = 1'b0;
            wb_sel_o = WB_EX_RESULT;
            branch_o = 1'b0;
            jal_o = 1'b0;
            jalr_o = 1'b0;
            mret_o = 1'b0;
        end
        
    end
    
endmodule
