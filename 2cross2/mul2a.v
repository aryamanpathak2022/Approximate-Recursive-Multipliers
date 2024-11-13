module mul2a (
    input wire [1:0] a,           // 2-bit input a
    input wire [1:0] b,           // 2-bit input b
    output wire [3:0] product     // 4-bit output product
);

    assign product[3] = 0;                      // c3 is set to 0
    assign product[2] = a[1] & b[1];            // c2
    assign product[1] = (a[0] & b[1]) | (a[1] & b[0]); // c1
    assign product[0] = b[0];            // c0

endmodule