`timescale 1ns / 1ps

module divisibility_by_2(input in, clk, reset, output reg y);
  reg next_state = 0;
  reg state = 0;
  
  parameter s0 = 1'b0, s1 = 1'b1;
  
  //present state block
  always @(posedge clk or posedge reset)
    begin
      if(reset)
      	state <= s0;
      else
        state <= next_state;
    end
  
  //next state and output block
  always @(*)
    begin 
      case(state)
        s0: next_state <= in ? s1 : s0;
        s1: next_state <= in ? s1 : s0;
        default: next_state <= s0;
      endcase
    end
  
  //output block
  always @(posedge clk or posedge reset)
    begin
      if(reset)
      	y <= 1'b0;
      else
        y <= (~in && (state == s0 || state == s1));
    end 
endmodule