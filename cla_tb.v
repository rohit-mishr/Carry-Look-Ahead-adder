`timescale 1ns / 1ns
`include "CLA.v"

module CLA_tb;
    reg [15:0] A, B;
    reg Cin;
    wire [15:0] Sum;
    wire Cout;

    CLA dut(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

    initial begin
        $dumpfile("CLA_tb.vcd");
        $dumpvars(0, CLA_tb);

        A = 16'hFFFF; B = 16'h0001; Cin = 1'b0;
        #10;
        A = 16'h1234; B = 16'h5678; Cin = 1'b1;
        #10;
        A = 16'hABCD; B = 16'h4321; Cin = 1'b0;
        #10;
        A = 16'h0000; B = 16'hFFFF; Cin = 1'b1;
        #10;
        $finish;
    end
endmodule 
