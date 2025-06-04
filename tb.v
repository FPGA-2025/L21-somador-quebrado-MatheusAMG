`timescale 1ns/1ps

module tb();

reg [3:0] num1; // A
reg [3:0] num2; // B
wire [3:0] out; // Soma
wire cout;      // Carry

add u0 (
    .num1 (num1),
    .num2 (num2),
    .out  (out),
    .cout (cout)
);

initial begin
    $dumpvars(0,tb);
    $monitor("num1: %b | num2: %b | soma: %b | carry: %b", num1, num2, out, cout);
    num1 = 'b0000; num2 = 'b0000; // carry_in entrando 1
    #1
    num1 = 'b0000; num2 = 'b0001; // ok depois de corrigido o superior
    #1
    num1 = 'b0000; num2 = 'b0010;
    #1
    num1 = 'b0000; num2 = 'b0100; // Aqui ok
    #1
    num1 = 'b0000; num2 = 'b1000; // Aqui ok
    #1
    num1 = 'b0001; num2 = 'b0001; // Aqui ok
    #1
    num1 = 'b0010; num2 = 'b0010; // Aqui ok
    #1
    num1 = 'b0100; num2 = 'b0100; // Aqui ok
    #1
    num1 = 'b1000; num2 = 'b1000; // Aqui ok
    #10;
end

//OBS: quando não coloco 'b acontecem alguns bugs. Na verdade, o segundo menos significativo vai para o mais significativo.

endmodule
