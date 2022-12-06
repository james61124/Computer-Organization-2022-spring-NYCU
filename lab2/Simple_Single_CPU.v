//Subject:     CO project 2 - Simple Single CPU
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
module Simple_Single_CPU(
        clk_i,
	rst_i
);
		
//I/O port
input         clk_i;
input         rst_i;

//Internal Signles
wire [31:0]pc_out_o, sum_o1, Mux_PC_Source_o, sum_o2, instr_o, RSdata_o, RTdata_o, Sign_Extend_o, Mux_ALUSrc_o, result, Shift_Left_Two_32_o;

wire [4:0] Mux_Write_Reg_o, WriteData, ReadReg1, ReadReg2;

wire [3:0] ALU_control;
wire [2:0] ALU_op;

wire RegDst;
wire RegWrite;
wire branch;
wire ALUSrc;
wire zero;

//Greate componentes
ProgramCounter PC(
            .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_in_i(Mux_PC_Source_o) ,   
	    .pc_out_o(pc_out_o) 
);
	
Adder Adder1(
            .src1_i(pc_out_o),     
	    .src2_i(32'd4),     
	    .sum_o(sum_o1)    
);
	
Instr_Memory IM(
           .pc_addr_i(pc_out_o),  
	   .instr_o(instr_o)    
);

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr_o[20:16]),
        .data1_i(instr_o[15:11]),
        .select_i(RegDst),
        .data_o(Mux_Write_Reg_o)
);	
		
Reg_File RF(
        .clk_i(clk_i),      
	.rst_i(rst_i) ,     
        .RSaddr_i(instr_o[25:21]) ,  
        .RTaddr_i(instr_o[20:16]) ,  
        .RDaddr_i(Mux_Write_Reg_o) ,  
        .RDdata_i(result)  , 
        .RegWrite_i(RegWrite),
        .RSdata_o(RSdata_o) ,  
        .RTdata_o(RTdata_o)   
);
	
Decoder Decoder(
            .instr_op_i(instr_o[31:26]), 
	    .RegWrite_o(RegWrite), 
	    .ALU_op_o(ALU_op),   
	    .ALUSrc_o(ALUSrc),   
	    .RegDst_o(RegDst),   
	    .Branch_o(branch)   
);

ALU_Ctrl AC(
        .funct_i(instr_o[5:0]),   
        .ALUOp_i(ALU_op),   
        .ALUCtrl_o(ALU_control) 
);
	
Sign_Extend SE(
        .data_i(instr_o[15:0]),
        .data_o(Sign_Extend_o)
);

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(RTdata_o),
        .data1_i(Sign_Extend_o),
        .select_i(ALUSrc),
        .data_o(Mux_ALUSrc_o)
);	
		
ALU ALU1(
	.ctrl_i(ALU_control),
	.src1_i(RSdata_o),
        .src2_i(Mux_ALUSrc_o),
        .result_o(result),
	.zero_o(zero)
);
		
Adder Adder2(
        .src1_i(Shift_Left_Two_32_o),
        .src2_i(sum_o1),
        .sum_o(sum_o2)
);
		
Shift_Left_Two_32 Shifter(
        .data_i(Sign_Extend_o),
        .data_o(Shift_Left_Two_32_o)
); 		
		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(sum_o1),
        .data1_i(sum_o2),
        .select_i(branch & zero),
        .data_o(Mux_PC_Source_o)
);	

endmodule
		  


