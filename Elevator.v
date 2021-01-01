`timescale 1ns / 1ps

module Elevator(input rst, clk, input [3:0]floor_req, output reg [3:0]out);
  
  reg [3:0] current_floor = 0;
  
  always @(posedge clk or negedge rst)
    begin
      if (rst)
        begin
        	out <= 0;
          	current_floor <= 0;
        end
      else if(floor_req > current_floor)
        	begin
        		out <= current_floor + 1;
            	current_floor <= out;
            end
      else if(floor_req < current_floor)
        	begin
        		out <= current_floor - 1;
            	current_floor <= out;
            end
      else
          out <= current_floor;
    end
endmodule  