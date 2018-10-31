/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module subTest_13 (
    input clk,
    input rst,
    input button,
    input [3:0] count,
    output reg [15:0] out,
    output reg v,
    output reg n,
    output reg z,
    output reg true,
    output reg [7:0] step
  );
  
  
  
  wire [1-1:0] M_edge_detector_out;
  reg [1-1:0] M_edge_detector_in;
  edge_detector_2 edge_detector (
    .clk(clk),
    .in(M_edge_detector_in),
    .out(M_edge_detector_out)
  );
  localparam BEGIN_state = 3'd0;
  localparam PP1_state = 3'd1;
  localparam PP2_state = 3'd2;
  localparam PP3_state = 3'd3;
  localparam PP4_state = 3'd4;
  localparam PP5_state = 3'd5;
  localparam GOOD_state = 3'd6;
  localparam ERROR_state = 3'd7;
  
  reg [2:0] M_state_d, M_state_q = BEGIN_state;
  reg [27:0] M_timer_d, M_timer_q = 1'h0;
  wire [16-1:0] M_sub_out;
  wire [1-1:0] M_sub_z;
  wire [1-1:0] M_sub_v;
  wire [1-1:0] M_sub_n;
  reg [8-1:0] M_sub_io_dip;
  reg [16-1:0] M_sub_a;
  reg [16-1:0] M_sub_b;
  add_6 sub (
    .clk(clk),
    .rst(rst),
    .io_dip(M_sub_io_dip),
    .a(M_sub_a),
    .b(M_sub_b),
    .out(M_sub_out),
    .z(M_sub_z),
    .v(M_sub_v),
    .n(M_sub_n)
  );
  
  localparam PP1A = 16'h7fff;
  
  localparam PP1B = 16'h00ff;
  
  localparam PP1 = 16'h7f00;
  
  localparam PP2A = 16'h7fff;
  
  localparam PP2B = 16'h7fff;
  
  localparam PP2 = 16'h0000;
  
  localparam PP3A = 16'h0001;
  
  localparam PP3B = 16'h0002;
  
  localparam PP3 = 16'hffff;
  
  localparam PP4A = 16'h0001;
  
  localparam NN4B = 16'hffff;
  
  localparam PP4 = 16'h0002;
  
  localparam NN5A = 16'hffff;
  
  localparam NN5B = 16'hfffd;
  
  localparam PP5 = 16'h0002;
  
  always @* begin
    M_state_d = M_state_q;
    M_timer_d = M_timer_q;
    
    out = 1'h0;
    v = M_sub_v;
    n = M_sub_n;
    z = M_sub_z;
    M_sub_a = 1'h0;
    M_sub_b = 1'h0;
    M_timer_d = M_timer_q + 1'h1;
    M_sub_io_dip = 8'h01;
    true = 1'h0;
    M_edge_detector_in = button;
    step = 1'h0;
    
    case (M_state_q)
      BEGIN_state: begin
        if (count == 2'h2 & M_edge_detector_out) begin
          M_timer_d = 1'h0;
          M_state_d = PP1_state;
        end
      end
      PP1_state: begin
        M_sub_a = 16'h7fff;
        M_sub_b = 16'h00ff;
        step = 1'h1;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h7fff;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h00ff;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_sub_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if ((M_sub_out == 16'h7f00)) begin
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
        M_sub_a = 16'h7fff;
        M_sub_b = 16'h7fff;
        step = 2'h2;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h7fff;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h7fff;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_sub_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if ((M_sub_out == 16'h0000)) begin
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
        M_sub_a = 16'h0001;
        M_sub_b = 16'h0002;
        step = 3'h4;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h0001;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'h0002;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_sub_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if ((M_sub_out == 16'hffff)) begin
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
        M_sub_a = 16'h0001;
        M_sub_b = 16'hffff;
        step = 4'h8;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'h0001;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'hffff;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_sub_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if ((M_sub_out == 16'h0002)) begin
                  M_timer_d = 1'h0;
                  M_state_d = PP5_state;
                end else begin
                  M_state_d = ERROR_state;
                end
              end
            end
          end
        end
      end
      PP5_state: begin
        M_sub_a = 16'hffff;
        M_sub_b = 16'hfffd;
        if (M_timer_q[26+1-:2] == 1'h0) begin
          out = 16'hffff;
        end else begin
          if (M_timer_q[26+1-:2] == 1'h1) begin
            out = 16'hfffd;
          end else begin
            if (M_timer_q[26+1-:2] == 2'h2) begin
              out = M_sub_out;
            end else begin
              if (M_timer_q[26+1-:2] == 2'h3) begin
                if ((M_sub_out == 16'h0002)) begin
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
