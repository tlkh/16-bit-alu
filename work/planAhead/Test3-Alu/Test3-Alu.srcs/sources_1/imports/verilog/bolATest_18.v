/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module bolATest_18 (
    input clk,
    input rst,
    input button,
    output reg [15:0] out,
    output reg true
  );
  
  
  
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_2 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  localparam BEGIN_state = 3'd0;
  localparam LL_state = 3'd1;
  localparam AL_state = 3'd2;
  localparam LB_state = 3'd3;
  localparam AB_state = 3'd4;
  localparam GOOD_state = 3'd5;
  localparam ERROR_state = 3'd6;
  
  reg [2:0] M_state_d, M_state_q = BEGIN_state;
  reg [27:0] M_timer_d, M_timer_q = 1'h0;
  wire [16-1:0] M_bol_out;
  reg [8-1:0] M_bol_io_dip;
  reg [16-1:0] M_bol_a;
  reg [16-1:0] M_bol_b;
  bol_8 bol (
    .clk(clk),
    .rst(rst),
    .io_dip(M_bol_io_dip),
    .a(M_bol_a),
    .b(M_bol_b),
    .out(M_bol_out)
  );
  
  localparam HH = 16'hffff;
  
  localparam LL = 16'h8001;
  
  localparam II = 16'h7ffe;
  
  localparam ZZ = 16'h0000;
  
  always @* begin
    M_state_d = M_state_q;
    M_timer_d = M_timer_q;
    
    out = 1'h0;
    M_bol_a = 1'h0;
    M_bol_b = 1'h0;
    M_timer_d = M_timer_q + 1'h1;
    M_bol_io_dip = 8'h1a;
    true = 1'h0;
    M_edge_detector_in = button;
    
    case (M_state_q)
      BEGIN_state: begin
        if (M_timer_q[26+1-:2] == 2'h2 & M_edge_detector_out) begin
          M_timer_d = 1'h0;
          M_state_d = LL_state;
        end
      end
      LL_state: begin
        M_bol_a = 16'h8001;
        M_bol_b = 16'h8001;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h8001;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h8001;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_bol_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_bol_out == 16'h8001) begin
                  M_timer_d = 1'h0;
                  M_state_d = AL_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      AL_state: begin
        M_bol_a = 16'hffff;
        M_bol_b = 16'h8001;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'hffff;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h8001;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_bol_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_bol_out == 16'hffff) begin
                  M_timer_d = 1'h0;
                  M_state_d = LB_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      LB_state: begin
        M_bol_a = 16'h8001;
        M_bol_b = 16'hffff;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'hffff;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h8001;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_bol_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_bol_out == 16'h8001) begin
                  M_timer_d = 1'h0;
                  M_state_d = AB_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      AB_state: begin
        M_bol_a = 16'hffff;
        M_bol_b = 16'hffff;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'hffff;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h8001;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_bol_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if (M_bol_out == 16'hffff) begin
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
