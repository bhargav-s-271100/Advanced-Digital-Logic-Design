`timescale 1ns / 1ps

module ring_counter #(parameter SIZE = 4)
  (input clk, rst_n,
   output reg [SIZE-1:0]out);
  
   integer i;
  
  always @(posedge clk or negedge rst_n)
    begin
      if(rst_n)
        out <= 1;
      else
        begin
          out[SIZE-1] <= out[0];
          for(i = 0; i < SIZE-1; i=i+1)
            begin
              out[i] <= out[i+1];
            end
        end
    end
endmodule