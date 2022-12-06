module testbench;

reg a, b, bin; // for stimulus waveforms
wire diff, bout;

// correct answer
reg [7:0]ans_diff;
reg [7:0]ans_borrow;
reg correct, clk;
reg [7:0]counter;
// for testing half subtractor
//Half_Subtractor HSUB (a, b, diff, bout);

// for testing full subtractor
Full_Subtractor FSUB (a, b, bin, diff, bout);

initial #100 $finish; // Stopwatch
initial begin // Stimulus patterns

    $dumpfile("testbench.vcd");
    $dumpvars;

    clk = 1'b0;
    counter =  8'd7;
    correct = 1;
    ans_diff     = 8'b01101001;
    ans_borrow   = 8'b01110001;
    
    a = 0; b = 0; bin = 0; // Statements execute in sequence
    #10 a = 0; b = 0; bin = 1;
    #10 a = 0; b = 1; bin = 0;
    #10 a = 0; b = 1; bin = 1; 
    #10 a = 1; b = 0; bin = 0;
    #10 a = 1; b = 0; bin = 1; 
    #10 a = 1; b = 1; bin = 0;
    #10 a = 1; b = 1; bin = 1; 
end

always #5 clk = ~clk;

always@(posedge clk) begin
    if(!(ans_diff[counter] === diff) || !(ans_borrow[counter] === bout)) begin
        $display(" Pattern %d is wrong! ", counter);
        $display(" diff %d ans %d ", diff, ans_diff[counter]);
        $display(" borrow %d ans %d ", bout, ans_borrow[counter]);
        correct = 0;
    end
    if (counter == 0 && correct) begin
        $display("***************************************************");
		$display("           ／＞---＞");
		$display("          | 　_　 _|");
		$display("        ／` ＞ ＿x /");
		$display("       /　　　 　 |");
		$display("      /　 \\　 　 /");
		$display("     │　　| |　|");
		$display("  ／￣|　 |　 |　|");
		$display(" | (￣ \\＿_ \\_ )__)");
		$display(" ＼二＞");
        $display(" Congratulation! All data are correct! ");
        $display("***************************************************");
        correct = 0;
    end
    if(counter != 0)
        counter <= counter - 8'd1;
    else
        counter <= counter;
end




endmodule