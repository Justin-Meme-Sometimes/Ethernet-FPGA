`default_nettype none

/*
   This module is a modification of a 240 counter
   it counts only up and has a clear and clock,
   clear takes precedence over enable
   reset_n is also asynchronus.
*/

module Counter
  #(parameter WIDTH=8)
  (input  logic en, clear, clock, reset_n,
   output logic [WIDTH-1:0] Q);
   
  always_ff @(posedge clock, negedge reset_n)
    if(!reset_n) begin
        Q <= '0;
    end else begin
        if (clear)
          Q <= '0;
        else if (en) begin
          Q <= Q + 1;
        end
    end
        
endmodule : Counter

/* 
   This module is used for the CRC_5 counters on
   bistream encoding and bitstream decoding.
   to count down from 4 to index into the CRC number.
*/

module Counter_Down
  #(parameter WIDTH=8)
  (input  logic en, clear, clock, reset_n,
   output logic [WIDTH-1:0] Q);
   
  always_ff @(posedge clock, negedge reset_n)
    if(!reset_n) begin
        Q <= 8'd4;
    end else begin
        if (clear)
          Q <= 8'd4;
        else if (en && Q != 0) begin
          Q <= Q - 1;
        end
    end
        
endmodule : Counter_Down

/* 
   This module is used for the CRC_16 counters on
   bistream encoding and bitstream decoding.
   to count down from 15 to index into the CRC number.
*/

module Counter_Down_16
  #(parameter WIDTH=8)
  (input  logic en, clear, clock, reset_n,
   output logic [WIDTH-1:0] Q);
   
  always_ff @(posedge clock, negedge reset_n)
    if(!reset_n) begin
        Q <= 8'd15;
    end else begin
        if (clear)
          Q <= 8'd15;
        else if (en && Q != 0) begin
          Q <= Q - 1;
        end
    end
        
endmodule : Counter_Down_16

/* 
  check is a value is between [lo,hi] (inclusive for both)
   for a certain value (val) and outputs whether that value is 
   lo <= val <= hi.
*/

module RangeCheck
    #(parameter WIDTH = 6)
    (input logic [WIDTH-1:0] val,
    input logic [WIDTH-1:0] lo,
    input logic [WIDTH-1:0] hi,
    output logic is_between);
      
    assign is_between = (val >= lo) && (val <= hi);
endmodule: RangeCheck

/* 
   This module is used for the CRC_5 and CRC_16 on
   bistream encoding and bitstream decoding.
   NOTE: because CRC_5 and CRC_16 assume that the registers
   start at 1 clear and reset_n, reset to 1.
*/

module CRC_Register
  #(parameter WIDTH=8)
  (input  logic [WIDTH-1:0] D_in,
   input  logic en, clock, reset_n, clear,
   output logic [WIDTH-1:0] Q);
   
  always_ff @(posedge clock, negedge reset_n)
    if(!reset_n) begin
     Q <= 1'd1;
    end else begin
      if(clear) begin
        Q <= 1'd1;
      end
      else if(en) begin
        Q <= D_in;
      end
    end      
endmodule : CRC_Register