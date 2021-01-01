`timescale 1ns / 1ps

module ALU(input [7:0]a,b, input [3:0]s, output reg [15:0]y);
  always@(a,b,s)
    begin
      case(s)
        4'b0000 : y <= a+b;	//Addition
        4'b0001 : y <= a-b;	//Subtraction
        4'b0010 : y <= a*b;	//Multiplication
        4'b0011 : y <= a/b;	//Division
        4'b0100 : y <= a%b;	//Modulus
        4'b0101 : y <= a&b;	//Logical AND
        4'b0110 : y <= a|b;	//Logical OR
        4'b0111 : y <= a^b;	//Logical XOR
        4'b1000 : y <= ~(a^b); //Logical XNOR
        default: y=1'bz;
      endcase
    end
endmodule
