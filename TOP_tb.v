module toptb();
reg Pclk;
reg Prst;
reg [2:0] Paddr;
reg Pwrite;
reg [15:0] Pwdata;
top qq(Pclk, Prst, Paddr, Pwdata,Pwrite);
initial
begin
Pclk=1;
Prst=1;
end

always #5 Pclk=~Pclk;
initial
begin
$dumpfile("qwe.vcd");
$dumpvars(0,toptb);
$dumpvars(1,qq.d1);
#20;
Prst=0;
Paddr=3'b010;
Pwrite=1;
Pwdata=16'b0000000000001001;

#20;
Paddr=3'b101;
Pwdata=16'b0000000000000001;

#20;
Paddr=3'b001;
Pwdata=16'b0000011111111111;

#40;
Paddr=3'b111;
Pwdata=16'b0000000000000111;

#20;
Pwrite=0;
Paddr=3'b101;

#20;
Pwrite=0;
Paddr=3'b001;

#100;
$finish;
end

endmodule
