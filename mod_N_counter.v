`timescale 1ns / 1ps

module mod_N_counter #(parameter N = 12, WIDTH = 4)
  (input rst_n,clk, output reg [WIDTH-1:0]y);
  always @(posedge clk or negedge rst_n)
    begin
      if(rst_n == 1'b0 || y == N)
        y <= 0;
      else
        y <= y+1;
    end
endmodule