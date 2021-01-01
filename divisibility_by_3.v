`timescale 1ns / 1ps

module divisibility_by_3(output reg y, input clk, reset, in);
  reg [1:0]next_state = 0;
  reg [1:0]state = 0;
  
  parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;
  
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
        s1: next_state <= in ? s0 : s2;
        s2: next_state <= in ? s2 : s1;
        default: next_state <= s0;
      endcase
    end
  
  //output block
  always @(posedge clk or posedge reset)
    begin
      if(reset)
      	y <= 1'b0;
      else
        y <= (~in && (state == s0)) || (in && (state == s1));
    end  
endmodule       
