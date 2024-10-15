module AxRM16_1 (
    input wire [15:0] a,  
    input wire [15:0] b,  
    output wire [31:0] result  
);


    wire [7:0] a_low  = a[7:0];
    wire [7:0] a_high = a[15:8];
    wire [7:0] b_low  = b[7:0];
    wire [7:0] b_high = b[15:8];


    wire [15:0] p1, p2, p3, p4;


    AxRM1 mul1 (.a(a_low),  .b(b_low),  .result(p1)); 
    AxRM1 mul2 (.a(a_low),  .b(b_high), .result(p2));  
    AxRM1 mul3 (.a(a_high), .b(b_low),  .result(p3));   
    AxRM1 mul4 (.a(a_high), .b(b_high), .result(p4));  

    wire [31:0] sum1, sum2, sum3;

    assign sum1 = {16'b0, p1};             
    assign sum2 = {8'b0, p2, 8'b0};         
    assign sum3 = {8'b0, p3, 8'b0};          
    assign result = sum1 + sum2 + sum3 + {p4, 16'b0}; 

endmodule
