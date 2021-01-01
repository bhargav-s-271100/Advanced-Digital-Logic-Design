`timescale 1ns / 1ps

module basic_gates(output and_out, or_out, not_out, input a1, a2);
  mux_2_to_1 ins0(and_out, 1'b0, a1, a2);
  mux_2_to_1 ins1(or_out, a1, 1'b1, a2);
  mux_2_to_1 ins2(not_out, ~a1, 0, 0);
endmodule
