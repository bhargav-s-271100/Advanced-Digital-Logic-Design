`timescale 1ns / 1ps

module DFF(output reg q, input d, set, reset, clk);
  always @(posedge clk or posedge reset or posedge set)
    begin
      if(reset)
        q <= 1'b0;
      else if(set)
        q <= 1'b1;
      else
        q <= d;
    end
endmodule

