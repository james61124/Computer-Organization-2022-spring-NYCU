`timescale 1ns/1ps
//alu
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:15:11 08/18/2013
// Design Name:		邱弘竣 109550136
// Module Name:    alu
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu(
           clk,           // system clock              (input)
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );

input           clk;
input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg    [32-1:0] result;
reg             zero;
reg             cout;
reg             overflow;

wire   [32-1:0] res;
wire   [1:0]    oper = ALU_control[1:0];   
wire a_in = ALU_control[3];
wire b_in = ALU_control[2];
wire [31:0]carry;


always@( posedge clk or negedge rst_n ) 
begin
	if(!rst_n) begin
		result <= 0;
        zero <= 0;
        cout <= 0;
        overflow <= 0;
	end
	else begin
		result <= res;
		zero <= ~|res;
		overflow <= carry[31] ^ carry[30];
		if (oper == 2'b10) begin
            cout <= carry[31];
        end
        else begin
            cout <= 0;
        end
	end
end

alu_top alu0( .src1(src1[0]), .src2(src2[0]), .less(set), .A_invert(a_in), .B_invert(b_in),
				  .cin(ALU_control[2]), .operation(oper), .result(res[0]), .cout(carry[0]) );

alu_top alu1( .src1(src1[1]), .src2(src2[1]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		     .cin(carry[0]), .operation(oper), .result(res[1]), .cout(carry[1]) );
				  
alu_top alu2( .src1(src1[2]), .src2(src2[2]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		     .cin(carry[1]), .operation(oper), .result(res[2]), .cout(carry[2]) );
				  
alu_top alu3( .src1(src1[3]), .src2(src2[3]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		     .cin(carry[2]), .operation(oper), .result(res[3]), .cout(carry[3]) );
				  
alu_top alu4( .src1(src1[4]), .src2(src2[4]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		     .cin(carry[3]), .operation(oper), .result(res[4]), .cout(carry[4]) );
				  
alu_top alu5( .src1(src1[5]), .src2(src2[5]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		     .cin(carry[4]), .operation(oper), .result(res[5]), .cout(carry[5]) );
				  
alu_top alu6( .src1(src1[6]), .src2(src2[6]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		     .cin(carry[5]), .operation(oper), .result(res[6]), .cout(carry[6]) );
				  
alu_top alu7( .src1(src1[7]), .src2(src2[7]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		     .cin(carry[6]), .operation(oper), .result(res[7]), .cout(carry[7]) );
				  
alu_top alu8( .src1(src1[8]), .src2(src2[8]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		     .cin(carry[7]), .operation(oper), .result(res[8]), .cout(carry[8]) );
				  
alu_top alu9( .src1(src1[9]), .src2(src2[9]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		     .cin(carry[8]), .operation(oper), .result(res[9]), .cout(carry[9]) );
				  
alu_top alu10( .src1(src1[10]), .src2(src2[10]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[9]), .operation(oper), .result(res[10]), .cout(carry[10]) );	
					
alu_top alu11( .src1(src1[11]), .src2(src2[11]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[10]), .operation(oper), .result(res[11]), .cout(carry[11]) );
					
alu_top alu12( .src1(src1[12]), .src2(src2[12]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[11]), .operation(oper), .result(res[12]), .cout(carry[12]) );
					
alu_top alu13( .src1(src1[13]), .src2(src2[13]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[12]), .operation(oper), .result(res[13]), .cout(carry[13]) );
					
alu_top alu14( .src1(src1[14]), .src2(src2[14]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[13]), .operation(oper), .result(res[14]), .cout(carry[14]) );
					
alu_top alu15( .src1(src1[15]), .src2(src2[15]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[14]), .operation(oper), .result(res[15]), .cout(carry[15]) );
					
alu_top alu16( .src1(src1[16]), .src2(src2[16]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[15]), .operation(oper), .result(res[16]), .cout(carry[16]) );
					
alu_top alu17( .src1(src1[17]), .src2(src2[17]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[16]), .operation(oper), .result(res[17]), .cout(carry[17]) );
					
alu_top alu18( .src1(src1[18]), .src2(src2[18]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[17]), .operation(oper), .result(res[18]), .cout(carry[18]) );
					
alu_top alu19( .src1(src1[19]), .src2(src2[19]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[18]), .operation(oper), .result(res[19]), .cout(carry[19]) );
					
alu_top alu20( .src1(src1[20]), .src2(src2[20]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[19]), .operation(oper), .result(res[20]), .cout(carry[20]) );
					
alu_top alu21( .src1(src1[21]), .src2(src2[21]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[20]), .operation(oper), .result(res[21]), .cout(carry[21]) );
					
alu_top alu22( .src1(src1[22]), .src2(src2[22]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[21]), .operation(oper), .result(res[22]), .cout(carry[22]) );
					
alu_top alu23( .src1(src1[23]), .src2(src2[23]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[22]), .operation(oper), .result(res[23]), .cout(carry[23]) );
					
alu_top alu24( .src1(src1[24]), .src2(src2[24]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[23]), .operation(oper), .result(res[24]), .cout(carry[24]) );
					
alu_top alu25( .src1(src1[25]), .src2(src2[25]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[24]), .operation(oper), .result(res[25]), .cout(carry[25]) );
					
alu_top alu26( .src1(src1[26]), .src2(src2[26]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[25]), .operation(oper), .result(res[26]), .cout(carry[26]) );
					
alu_top alu27( .src1(src1[27]), .src2(src2[27]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[26]), .operation(oper), .result(res[27]), .cout(carry[27]) );
					
alu_top alu28( .src1(src1[28]), .src2(src2[28]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[27]), .operation(oper), .result(res[28]), .cout(carry[28]) );
					
alu_top alu29( .src1(src1[29]), .src2(src2[29]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[28]), .operation(oper), .result(res[29]), .cout(carry[29]) );
					
alu_top alu30( .src1(src1[30]), .src2(src2[30]), .less(0), .A_invert(a_in), .B_invert(b_in),
	 		      .cin(carry[29]), .operation(oper), .result(res[30]), .cout(carry[30]) );

alu_last alu31( .src1(src1[31]), .src2(src2[31]), .less(0), .A_invert(a_in), .B_invert(b_in),
					.cin(carry[30]), .operation(oper), .result(res[31]), .cout(carry[31]),
					.set(set) );

endmodule
