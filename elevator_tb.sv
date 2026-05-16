`timescale 1ns / 1ps



module elevator_tb();

logic clk;               
logic rst;                
logic stop;               
logic [1:0] in;           
logic [1:0] floor;       
logic [3:0] changes_count;

elevator elevatorsim(
.clk(clk),                
.rst(rst),                
.stop(stop),               
.in(in),           
.floor(floor),       
.changes_count(changes_count)
);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial
begin
in <= 0;
stop <= 0;
rst <= 1;
@(negedge clk);
rst <= 0;
@(negedge clk);
in <= 3;
repeat(4)
begin
@(negedge clk);
end
in <=1;
repeat(2)
begin
@(negedge clk);
end
in<=2;
stop<=1;

repeat(3)
begin
@(negedge clk);
end
stop<=0;

repeat(2)
begin
@(negedge clk);
end
stop<=1;
in<=3;

repeat(2)
begin
@(negedge clk);
end
in<=0;
@(negedge clk);
stop<=0;
repeat(3)
begin
@(negedge clk);
end
$stop;
end

endmodule
