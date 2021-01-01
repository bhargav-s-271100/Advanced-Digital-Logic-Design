`timescale 1ns / 1ps

module shift_reg(input [1:0] s, input [3:0] In, input Serial_In, Clk, Rst, output reg [3:0] Q);
    
  always @(posedge Clk or posedge Rst)
    begin
            if (Rst == 1)
                Q <= 4'b0000;
            else 
              case(s)
                2'b00: begin //right shift
                  	Q[0] <= Serial_In;
                  Q[3:1] <= Q[2:0];
            		end
                2'b01: begin //left shift
                	Q[3] <= Serial_In;
                  Q[2:0] <= Q[3:1];
            		end
                2'b10: Q <= In; // parallel in
            	default: Q <= Q; //Hold the previous value of output
              endcase
    end

endmodule
