//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      109550136 邱弘竣
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Parameter

       
//Select exact operation
always @(funct_i, ALUOp_i) begin
	case (ALUOp_i)
		2'b00: ALUCtrl_o <= 4'h2;  // ADD
		2'b01: ALUCtrl_o <= 4'h6;  // SUB
		2'b10: case (funct_i)
			6'b100000: ALUCtrl_o <= 4'h2;  // ADD
			6'b100010: ALUCtrl_o <= 4'h6;  // SUB
			6'b100100: ALUCtrl_o <= 4'h0;  // AND
			6'b100101: ALUCtrl_o <= 4'h1;  // OR
			6'b101010: ALUCtrl_o <= 4'h7;  // SLT
			default:   ALUCtrl_o <= 4'hE;
		endcase
		2'b11: ALUCtrl_o <= 4'h7;  // SLT
	endcase
end

endmodule     





                    
                    