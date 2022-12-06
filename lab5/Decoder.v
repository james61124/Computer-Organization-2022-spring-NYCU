//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      109550136 邱弘竣
//----------------------------------------------
//Date:       
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder( 
	instr_op_i, 
	RegWrite_o,	
	ALUOp_o, 
	ALUSrc_o, 
	RegDst_o,
	Branch_o, 
	MemRead_o, 
	MemWrite_o, 
	MemtoReg_o,
	BranchType_o
);
     
//I/O ports
input	[6-1:0] instr_op_i;

output	[3-1:0] ALUOp_o;
output  [2-1:0] BranchType_o;
output          RegDst_o, MemtoReg_o;
output		ALUSrc_o, RegWrite_o, Branch_o, MemRead_o, MemWrite_o;

//Internal Signals
reg	[3-1:0] ALUOp_o;
reg 	[2-1:0] BranchType_o;
reg	        RegDst_o, MemtoReg_o;
reg		ALUSrc_o, RegWrite_o, Branch_o, MemRead_o, MemWrite_o;

//Main function
always@(*)begin
	if(instr_op_i==6'b000000)begin
		ALUOp_o<=3'b100;
		RegDst_o<=1'b1;
		MemtoReg_o<=1'b0;
		RegWrite_o<=1'b1;
		ALUSrc_o<=1'b0;
		Branch_o<=1'b0;
		MemRead_o<=1'b0;
		MemWrite_o<=1'b0;
		BranchType_o<=2'b00;
	end else if(instr_op_i==6'b001000)begin
		ALUOp_o<=3'b000;
		RegDst_o<=1'b0;
		MemtoReg_o<=1'b0;
		RegWrite_o<=1'b1;
		ALUSrc_o<=1'b1;
		Branch_o<=1'b0;
		MemRead_o<=1'b0;
		MemWrite_o<=1'b0;
		BranchType_o<=2'b00;
	end else if(instr_op_i==6'b001010)begin
		ALUOp_o<=3'b010;
		RegDst_o<=1'b0;
		MemtoReg_o<=1'b0;
		RegWrite_o<=1'b1;
		ALUSrc_o<=1'b1;
		Branch_o<=1'b0;
		MemRead_o<=1'b0;
		MemWrite_o<=1'b0;
		BranchType_o<=2'b00;
	end else if(instr_op_i==6'b100011)begin
		ALUOp_o<=3'b000;
		RegDst_o<=1'b0;
		MemtoReg_o<=1'b1;
		RegWrite_o<=1'b1;
		ALUSrc_o<=1'b1;
		Branch_o<=1'b0;
		MemRead_o<=1'b1;
		MemWrite_o<=1'b0;
	end else if(instr_op_i==6'b101011)begin
		ALUOp_o<=3'b000;
		RegDst_o<=1'b0;
		MemtoReg_o<=1'b0;
		RegWrite_o<=1'b0;
		ALUSrc_o<=1'b1;
		Branch_o<=1'b0;
		MemRead_o<=1'b0;
		MemWrite_o<=1'b1;
		BranchType_o<=2'b00;
	end else if(instr_op_i==6'b000100)begin
		ALUOp_o<=3'b001;
		RegDst_o<=1'b0;
		MemtoReg_o<=1'b0;
		RegWrite_o<=1'b0;
		ALUSrc_o<=1'b0;
		Branch_o<=1'b1;
		MemRead_o<=1'b0;
		MemWrite_o<=1'b0;
		BranchType_o<=2'b00;
	end else if(instr_op_i==6'b000101)begin
		ALUOp_o<=3'b001;
		RegDst_o<=1'b0;
		MemtoReg_o<=1'b0;
		RegWrite_o<=1'b0;
		ALUSrc_o<=1'b0;
		Branch_o<=1'b1;
		MemRead_o<=1'b0;
		MemWrite_o<=1'b0;
		BranchType_o<=2'b01;
	end else if(instr_op_i==6'b000001)begin
		ALUOp_o<=3'b001;
		RegDst_o<=1'b0;
		MemtoReg_o<=1'b0;
		RegWrite_o<=1'b0;
		ALUSrc_o<=1'b0;
		Branch_o<=1'b1;
		MemRead_o<=1'b0;
		MemWrite_o<=1'b0;
		BranchType_o<=2'b10;
	end else if(instr_op_i==6'b000111)begin
		ALUOp_o<=3'b001;
		RegDst_o<=1'b0;
		MemtoReg_o<=1'b0;
		RegWrite_o<=1'b0;
		ALUSrc_o<=1'b0;
		Branch_o<=1'b1;
		MemRead_o<=1'b0;
		MemWrite_o<=1'b0;
		BranchType_o<=2'b11;
	end
end

endmodule
   