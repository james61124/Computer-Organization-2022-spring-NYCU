//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      109550136
//----------------------------------------------
//Date:        2022/5/2
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module ALU (src1_i, src2_i, ctrl_i,  result_o, zero_o);
   input [4-1:0] ctrl_i;
   input signed [32-1:0] src1_i,src2_i;
   output reg [32-1:0] result_o;
   output zero_o;
   assign zero_o = (result_o == 0);
   always @(ctrl_i, src1_i, src2_i) begin
      case (ctrl_i)
	0: result_o <= src1_i & src2_i;
	1: result_o <= src1_i | src2_i;
	2: result_o <= src1_i + src2_i;
	6: result_o <= src1_i - src2_i;
	7: result_o <= src1_i < src2_i ? 1 : 0;
	12: result_o <= ~(src1_i | src2_i);
	default: result_o <= 0;
      endcase
    end
endmodule





                    
                    