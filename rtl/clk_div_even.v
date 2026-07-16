module clk_div_even #(
    parameter N = 4
) (
    input wire clk_in,
    input wire rst_n,
    output reg clk_out
);
reg [$clog2(N/2)-1:0] count;


always @(posedge clk_in or negedge rst_n) begin
   if(!rst_n) begin
   count <= 0;
   clk_out <=0 ;
   end else begin 
   if(count == (N/2 -1)) begin
   count <=0;
   clk_out <= ~clk_out;
   end else begin
   count <= count + 1;
   end
   end
   end
endmodule