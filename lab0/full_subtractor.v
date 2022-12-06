`timescale 1ns / 1ps

module Full_Subtractor(
    In_A, In_B, Borrow_in, Difference, Borrow_out
    );
    input In_A, In_B, Borrow_in;
    output Difference, Borrow_out;
    wire output1,output2,output3;
    
    // implement full subtractor circuit, your code starts from here.
    or(Borrow_out,output3,output2);
    // use half subtractor in this module, fulfill I/O ports connection.
    Half_Subtractor HSUB1 (
        .In_A(In_A), 
        .In_B(In_B), 
        .Difference(output1), 
        .Borrow_out(output2)
    );
    Half_Subtractor HSUB2 (
        .In_A(output1), 
        .In_B(Borrow_in), 
        .Difference(Difference), 
        .Borrow_out(output3)
    );

endmodule
