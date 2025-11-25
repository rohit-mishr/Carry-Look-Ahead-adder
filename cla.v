module CLA(
    input [15:0] A,
    input [15:0] B,
    input Cin,
    output [15:0] Sum,
    output Cout
);
    wire [15:0] G, P, C;

    assign G = A & B;
    assign P = A ^ B;
    assign C[0] = Cin;

    genvar i;
    generate
        for (i = 1; i < 16; i = i + 1) begin
            assign C[i] = G[i-1] | (P[i-1] & C[i-1]);
        end
    endgenerate

    assign Cout = G[15] | (P[15] & C[15]);
    assign Sum = P ^ C;
endmodule
