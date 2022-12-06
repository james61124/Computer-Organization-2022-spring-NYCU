// 0716089
//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      Luke
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Forwarding_Unit(
            regwrite_mem,
            regwrite_wb,
            idex_regs,
            idex_regt,
            exmem_regd,
            memwb_regd,
            forwarda,
            forwardb
);

input       regwrite_mem, regwrite_wb;
input [4:0] idex_regs, idex_regt, exmem_regd, memwb_regd;
output [1:0] forwarda, forwardb;

reg [1:0] forwarda, forwardb;

always@(*) begin
    if(regwrite_mem == 1'b1 && idex_regs == exmem_regd && exmem_regd != 5'd0)
        forwarda <= 2'b01;
    else if(regwrite_wb == 1'b1 && idex_regs == memwb_regd && memwb_regd != 5'd0)
        forwarda <= 2'b10;
    else
        forwarda <= 2'b00;

    if(regwrite_mem == 1'b1 && idex_regt == exmem_regd && exmem_regd != 5'd0)
        forwardb <= 2'b01;
    else if(regwrite_wb == 1'b1 && idex_regt == memwb_regd && memwb_regd != 5'd0)
        forwardb <= 2'b10;
    else
        forwardb <= 2'b00;
end
endmodule