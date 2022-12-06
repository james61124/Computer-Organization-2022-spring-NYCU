`timescale 1ns/1ps
module Hazard_Detection(
    memread,
    instr_i,
    idex_regt,
    branch,
    pcwrite,
    ifid_write,
    ifid_flush,
    idex_flush,
    exmem_flush
);

input       memread;
input [15:0]instr_i;
input [4:0] idex_regt;
input       branch;
output      pcwrite,ifid_write,ifid_flush,idex_flush,exmem_flush;
reg      pcwrite,ifid_write,ifid_flush,idex_flush,exmem_flush;

always@(*) begin
	if(branch==1'b1)begin
		pcwrite <= 1'b1;
		ifid_write <= 1'b1;
		ifid_flush <= 1'b1;
		idex_flush <= 1'b1;
		exmem_flush <= 1'b1;
	end else if(branch==1'b0)begin
		if(memread == 1'b1 && (instr_i[9:5] == idex_regt || (instr_i[4:0] == idex_regt && instr_i[15:10] != 6'b001000)))begin		
			pcwrite <= 1'b0;
			ifid_write <= 1'b0;
			ifid_flush <= 1'b0;
			idex_flush <= 1'b1;
			exmem_flush <= 1'b0;
		end
		else begin
			pcwrite <= 1'b1;
			ifid_write <= 1'b1;
			ifid_flush <= 1'b0;
			idex_flush <= 1'b0;
			exmem_flush <= 1'b0;
		end

	end
end

endmodule