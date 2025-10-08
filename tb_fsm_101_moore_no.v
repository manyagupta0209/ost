module tb_fsm_101_moore_no;
reg clk, rst,x;
wire y;
fsm_101_moore_no uut(.clk(clk),.rst(rst),.x(x),.y(y)); //Previous Instantiation was wrong
always #2 clk=~clk;
initial
begin
clk=0; rst=1; //Added reset
#70 rst=0;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;
#10 $finish;
end
endmodule
