//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      109550136
//----------------------------------------------
//Date:        2022/5/2
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
`timescale 1ns/1ps
module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
 
//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;

//Parameter


//Main function
always@(instr_op_i) begin
    // case (instr_op_i)
    //     // r-types: add, sub, and, or, slt
    //     6'b000000:
    //         {RegWrite_o, ALU_op_o, ALUSrc_o, RegDst_o, Branch_o} <= 7'b1100010;
    //     // addi (add imm)
    //     6'b001000:
    //         {RegWrite_o, ALU_op_o, ALUSrc_o, RegDst_o, Branch_o} <= 7'b1000100;
    //     // beq
    //     6'b000100:
    //         {RegWrite_o, ALU_op_o, ALUSrc_o, RegDst_o, Branch_o} <= 7'b0001001;
    //     // slti (set less than imm)
	// 	6'b001010:
	//     	{RegWrite_o, ALU_op_o, ALUSrc_o, RegDst_o, Branch_o} <= 7'b1010100;
    //     default:
    //         {RegWrite_o, ALU_op_o, ALUSrc_o, RegDst_o, Branch_o} <= 7'bxxxxxxx;
    // endcase
    
    ALU_op_o <= instr_op_i[3:1];
	RegWrite_o <= ~instr_op_i[2];
	ALUSrc_o <= instr_op_i[3];
	RegDst_o <= ~instr_op_i[3];
	Branch_o <= instr_op_i[2];
end

endmodule





                    
                    