`timescale 1ns/1ps
module tb_clock_divider_suite;
  reg clk_in = 0;
  reg rst_n = 0;
  wire clk_out_even4;
  wire clk_out_odd3;

  always #5 clk_in = ~clk_in;
  clk_div_even # (.N(4)) u_even (
    .clk_in  (clk_in),
    .rst_n   (rst_n),
    .clk_out (clk_out_even4)
  );

  clk_div_odd #(.N(3)) u_odd (
    .clk_in  (clk_in),
    .rst_n   (rst_n),
    .clk_out  (clk_out_odd3)
  );

  initial begin
    $dumpfile("clk_div.vcd");
    $dumpvars(0,tb_clock_divider_suite);
    rst_n = 0;
    #12 rst_n = 1;
    #300 $finish;
  end

  initial $monitor("t=%4t clk_in=%b even4=%b odd3=%b", $time,clk_in,clk_out_even4,clk_out_odd3);
endmodule