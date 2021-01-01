`timescale 1ns / 1ps

module SRFF(output q, input S, R, set, reset, clk);
  wire w;
  mux_4_to_1 ins(.y(w),.in({1'bz,1'b1,1'b0,q}),.sel({S,R}));
  
  DFF ins1(.q(q),.d(w),.set(set),.reset(reset),.clk(clk));
  
endmodule
