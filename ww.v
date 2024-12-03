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
$dumpfile("wait_write.vcd");
$dumpvars(0,toptb);
/*
#20;             // wait read
Prst=0;
Pwrite=0;
Paddr=3'b010;
*/

/*

#20;                    //wait write
Prst=0;
Paddr=3'b011;
Pwrite=1;
Pwdata=16'b1000000000001001;


*/
/*
#20;                    //no wait write
Prst=0;
Paddr=3'b001;
Pwrite=1;
Pwdata=16'b0000000000001001;


*/
#20;             //no wait read
Prst=0;
Pwrite=0;
Paddr=3'b000;



#50;
$finish;
end

endmodule
