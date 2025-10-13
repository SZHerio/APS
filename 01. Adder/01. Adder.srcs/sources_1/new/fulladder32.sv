`timescale 1ns / 1ps

module fulladder32(
    input logic [31:0] a_i,
    input logic [31:0] b_i,
    input logic carry_i,
    output logic [31:0] sum_o,
    output logic carry_o
);

logic [7:0] carry;
assign carry_o = carry[7];

generate
    genvar i;
    
    fulladder4 fa4_0(
        .a_i(a_i[3:0]),
        .b_i(b_i[3:0]),
        .carry_i(carry_i),
        .carry_o(carry[0]),
        .sum_o(sum_o[3:0])
    );

    for(i = 4'd1; i < 4'd8; i = i + 1) begin
    
    fulladder4 fa4(
        .a_i(a_i[4*i+3 : i*4]),
        .b_i(b_i[4*i+3 : i*4]),
        .carry_i(carry[i - 1]),
        .carry_o(carry[i]),
        .sum_o(sum_o[4*i+3 : i*4])
    );
    
    end

endgenerate
endmodule
