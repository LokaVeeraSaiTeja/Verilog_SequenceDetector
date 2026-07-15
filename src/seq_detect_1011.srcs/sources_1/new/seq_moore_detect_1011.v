`timescale 1ns / 1ps


module seq_moore_detect_1011(
    input i_clk,
    input i_reset,
    input i_X,
    output o_Y
    );
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100;
            
   reg [2:0] state, next_state;
   
   always @(posedge i_clk or posedge i_reset) begin
          if(i_reset)
           state <= S0;
          else
           state <= next_state;
    end
    
    always @(*) begin
        next_state = state;
        
       case(state)
         S0 : next_state = i_X ? S1 : S0;
         S1 : next_state = i_X ? S1 : S2;
         S2 : next_state = i_X ? S3 : S0;
         S3 : next_state = i_X ? S4 : S2;
         S4 : next_state = i_X ? S1 : S2;
           
         default : 
              next_state = S0;
        endcase
      end
      
   assign  o_Y = (state == S4);
endmodule
