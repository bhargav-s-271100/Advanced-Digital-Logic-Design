`timescale 1ns / 1ps

module mux_7_to_1(y, i[6:0], sel[2:0]);
  input [6:0] i;
  input [2:0] sel;
  output y;
  
  wire t1, t2, t3, t4, t5, t6;
  
  mux_2_to_1 ins1(t1, i[1], i[0], sel[0]);
  mux_2_to_1 ins2(t2, i[3], i[2], sel[0]);
  mux_2_to_1 ins3(t3, i[5], i[4], sel[0]);
  mux_2_to_1 ins4(t4, i[6], 0, sel[0]);
  
  mux_2_to_1 ins5(t5, t2, t1, sel[1]);
  mux_2_to_1 ins6(t6, t4, t3, sel[1]);
  
  mux_2_to_1 ins7(y, t6, t5, sel[2]);
  
endmodule
