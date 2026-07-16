module clk_div_odd #(
    parameter N= 5
) (
    input wire clk_in,
    input wire rst_n,
    output wire clk_out
);
reg[$clog2(N)-1:0] pos_count;
reg                 pos_toggle;
reg[$clog2(N)-1:0] neg_count;
reg                 neg_toggle;

always @(posedge clk_in or negedge rst_n) begin
    if(!rst_n) begin
        pos_count <=0 ;
        pos_toggle <=0 ;
    
    end else if (pos_count == N-1 ) begin
        pos_count <=0 ;
        pos_toggle <=~pos_toggle;
    end else begin
        pos_count <= pos_count + 1 ;
        if(pos_count == (N-1)/2 )
        pos_toggle <= ~pos_toggle;
    end
end
always @(negedge clk_in or negedge rst_n) begin
    if(!rst_n) begin
        neg_count <= 0;
        neg_toggle <= 0;
    end else if (neg_count == N - 1) begin
        neg_count <= 0;
        neg_toggle <= ~neg_toggle;
    end else begin 
        neg_count <= neg_count + 1;
        if(neg_count == (N-1)/2)
        neg_toggle <= ~neg_toggle;
end
end

assign clk_out = pos_toggle | neg_toggle;
endmodule