`timescale 1ns / 1ps

module JKFF(output out, input j, k, s, rst, clock);
  
  wire q_in;
  assign q_in = (j & ~out | ~k & out); 
  
  DFF ins(out, q_in, s, rst, clock);
endmodule
