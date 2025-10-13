`timescale 1ns / 1ps

module fulladder4(
    input logic [3:0] a_i, 
    input logic [3:0] b_i, 
    input logic carry_i, 
    output logic [3:0] sum_o,
    output logic carry_o
);
   
logic [3:0] carry;    
assign carry_o = carry[3];

generate
    genvar i;
        fulladder1 f0(
            .a_i(a_i[0]),
            .b_i(b_i[0]),
            .carry_i(carry_i),
            .sum_o(sum_o[i]),
            .carry_o(carry[0])
        );
        
        for(i = 4'd1; i < 4'd4; i = i + 1) begin
           fulladder1 f(
            .a_i(a_i[i]),
            .b_i(b_i[i]),
            .carry_i(carry[i-1]),
            .sum_o(sum_o[i]),
            .carry_o(carry[i])
        ); 
            
        end   
    endgenerate   
endmodule
