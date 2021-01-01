`timescale 1ns / 1ps

module moore_0100(output reg y, input clk, reset, in);
  reg [2:0]next_state = 0;
  reg [2:0]state = 0;
  
  parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
  
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
        s0: next_state <= in ? s0 : s1;
        s1: next_state <= in ? s2 : s1;
        s2: next_state <= in ? s0 : s3;
        s3: next_state <= in ? s2 : s4;
        s4: next_state <= in ? s0 : s1;
        default: next_state <= s0;
      endcase
    end
  
  //output block
  always @(posedge clk or posedge reset)
    begin
      if(reset)
      	y <= 1'b0;
      else
        y <= (state == s4);
    end  
endmodule       
