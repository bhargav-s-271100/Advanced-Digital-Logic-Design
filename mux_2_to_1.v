`timescale 1ns / 1ps

module mux_2_to_1(out,a,b,s);
  input a, b, s;
  output reg out;
  
  always@(s, a, b) begin
  if(s == 1'b1)
    out <= a;
  else if (s == 1'b0)
  	out <= b;
  end
endmodule