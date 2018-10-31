/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module cmpleTest_23 (
    input clk,
    input rst,
    input button,
    input [3:0] count,
    output reg [15:0] out,
    output reg true,
    output reg [7:0] step
  );
  
  
  
  localparam BEGIN_state = 4'd0;
  localparam PP1_state = 4'd1;
  localparam PP2_state = 4'd2;
  localparam PP3_state = 4'd3;
  localparam PP4_state = 4'd4;
  localparam NN1_state = 4'd5;
  localparam NN2_state = 4'd6;
  localparam NN3_state = 4'd7;
  localparam NN4_state = 4'd8;
  localparam GOOD_state = 4'd9;
  localparam ERROR_state = 4'd10;
  
  reg [3:0] M_state_d, M_state_q = BEGIN_state;
  reg [27:0] M_timer_d, M_timer_q = 1'h0;
  wire [16-1:0] M_cmple_out;
  reg [8-1:0] M_cmple_io_dip;
  reg [16-1:0] M_cmple_a;
  reg [16-1:0] M_cmple_b;
  cmp_7 cmple (
    .clk(clk),
    .rst(rst),
    .io_dip(M_cmple_io_dip),
    .a(M_cmple_a),
    .b(M_cmple_b),
    .out(M_cmple_out)
  );
  
  localparam PP1A = 16'h6960;
  
  localparam PP1B = 16'h696a;
  
  localparam PP2A = 16'h696a;
  
  localparam PP2B = 16'h6960;
  
  localparam PP3A = 16'h696a;
  
  localparam PP3B = 16'h696a;
  
  localparam PP4A = 16'h7fff;
  
  localparam PP4B = 16'h7fff;
  
  localparam NN1A = 16'h8a90;
  
  localparam NN1B = 16'h8a9c;
  
  localparam NN2A = 16'h8a9c;
  
  localparam NN2B = 16'h8a90;
  
  localparam NN3A = 16'h8a9c;
  
  localparam NN3B = 16'h8a9c;
  
  localparam NN4A = 16'h8000;
  
  localparam NN4B = 16'h8000;
  
  localparam PP1 = 1'h1;
  
  localparam PP2 = 1'h0;
  
  localparam PP3 = 1'h1;
  
  localparam PP4 = 1'h1;
  
  localparam NN1 = 1'h1;
  
  localparam NN2 = 1'h0;
  
  localparam NN3 = 1'h1;
  
  localparam NN4 = 1'h1;
  
  always @* begin
    M_state_d = M_state_q;
    M_timer_d = M_timer_q;
    
    out = 1'h0;
    M_cmple_a = 1'h0;
    M_cmple_b = 1'h0;
    M_timer_d = M_timer_q + 1'h1;
    M_cmple_io_dip = 8'h37;
    true = 1'h0;
    step = 1'h0;
    
    case (M_state_q)
      BEGIN_state: begin
        if (count == 4'hc & ~button) begin
          M_timer_d = 1'h0;
          M_state_d = PP1_state;
        end
      end
      PP1_state: begin
        M_cmple_a = 16'h6960;
        M_cmple_b = 16'h696a;
        step = 1'h1;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h6960;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h696a;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_cmple_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_cmple_out == 1'h1) begin
                  M_timer_d = 1'h0;
                  M_state_d = PP2_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      PP2_state: begin
        M_cmple_a = 16'h696a;
        M_cmple_b = 16'h6960;
        step = 2'h2;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h696a;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h6960;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_cmple_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_cmple_out == 1'h0) begin
                  M_timer_d = 1'h0;
                  M_state_d = PP3_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      PP3_state: begin
        M_cmple_a = 16'h696a;
        M_cmple_b = 16'h696a;
        step = 3'h4;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h696a;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h696a;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_cmple_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_cmple_out == 1'h1) begin
                  M_timer_d = 1'h0;
                  M_state_d = PP4_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      PP4_state: begin
        M_cmple_a = 16'h7fff;
        M_cmple_b = 16'h7fff;
        step = 4'h8;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h7fff;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h7fff;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_cmple_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_cmple_out == 1'h1) begin
                  M_timer_d = 1'h0;
                  M_state_d = NN1_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      NN1_state: begin
        M_cmple_a = 16'h8a90;
        M_cmple_b = 16'h8a9c;
        step = 5'h10;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h8a90;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h8a9c;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_cmple_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_cmple_out == 1'h1) begin
                  M_timer_d = 1'h0;
                  M_state_d = NN2_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      NN2_state: begin
        M_cmple_a = 16'h8a9c;
        M_cmple_b = 16'h8a90;
        step = 6'h20;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h8a9c;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h8a90;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_cmple_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_cmple_out == 1'h0) begin
                  M_timer_d = 1'h0;
                  M_state_d = NN3_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      NN3_state: begin
        M_cmple_a = 16'h8a9c;
        M_cmple_b = 16'h8a9c;
        step = 7'h40;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h8a9c;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h8a9c;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_cmple_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_cmple_out == 1'h1) begin
                  M_timer_d = 1'h0;
                  M_state_d = NN4_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      NN4_state: begin
        M_cmple_a = 16'h8000;
        M_cmple_b = 16'h8000;
        step = 8'h80;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h8000;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h8000;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_cmple_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_cmple_out == 1'h1) begin
                  M_timer_d = 1'h0;
                  M_state_d = GOOD_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      GOOD_state: begin
        if (M_timer_q[27+0-:1] == 1'h1) begin
          true = 1'h1;
        end else begin
          if (M_timer_q[25+0-:1] == 1'h1) begin
            out = 16'hff00;
          end else begin
            if (M_timer_q[25+0-:1] == 1'h0) begin
              out = 16'h0000;
            end
          end
        end
      end
      ERROR_state: begin
        if (M_timer_q[25+0-:1] == 1'h1) begin
          out = 16'h00ff;
        end else begin
          out = 16'h0000;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_timer_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_timer_q <= M_timer_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
