`timescale 1ns / 1ps


module seq_detect_1011(
    input i_clk,
    input i_reset,
    input i_X,
    output reg o_Y
    );
   parameter S0 = 3'b000,
             S1 = 3'b001,
             S2 = 3'b010,
             S3 = 3'b011;
            
   reg [2:0] state, next_state;
   
   always @(posedge i_clk or posedge i_reset) begin
          if(i_reset)
           state <= S0;
          else
           state <= next_state;
    end
    
    always @(*) begin
        next_state = state;
         o_Y = 0;
       case(state)
         S0 : next_state = i_X ? S1 : S0;
         S1 : next_state = i_X ? S1 : S2;
         S2 : next_state = i_X ? S3 : S0;
         S3 : 
           begin
             if(i_X) 
               begin
                 next_state = S1;
                 o_Y = 1;
               end
               else
                 next_state = S2;
             end
         default : 
              next_state = S0;
        endcase
      end
    endmodule
   
