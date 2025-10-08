module fsm_101_moore_no(clk, x, rst, y);
input clk, rst, x;
output reg y;
reg q1, q0;
reg d1, d0;
always @(posedge clk) //Solved the issue of postive edge clock
begin
if (rst)
begin q1<= 1'b0; q0<=1'b0; end
else
begin q1<= d1; q0<= d0; end
end

always @(*)
begin
d1 =((~q1)&(q0)&(~x))|(q1&(~q0)&x); //Logic Correction
d0= x;
y = q1&(~q0); //Equation calculation
end
endmodule
//this is appended version using cat.

