module slave1(Prdata1,Pready1,Psel1,Pclk,Paddr,Prst,Penable,Pwrite,Pwdata,s1m);
input Pclk,Prst,Psel1,Penable,Pwrite;
output reg [15:0]Prdata1,s1m;
output reg Pready1;
input [15:0]Pwdata;
input [2:0]Paddr;
reg [15:0]slave1[3:0];
always@(*)    begin
if(Prst==1) begin
slave1[0]=16'b0000_0010_0101_0101;
slave1[1]=16'b0;
slave1[2]=16'b1111_1111_1111_0000;
slave1[3]=16'b0;
Pready1=0;   end
else if(Psel1 && Penable) begin
if(Paddr < 4 && (Pwrite==1) && Pwdata<=255)begin
	Pready1<=1'b1;
	slave1[Paddr] <= Pwdata; // Write data
	s1m=slave1[Paddr];     end
if(Paddr < 4 && (Pwrite==0) && slave1[Paddr]<=255)begin
	Pready1<=1'b1;
	Prdata1=slave1[Paddr];    // Read data
	end
if(Paddr < 4 && (Pwrite==1) && Pwdata>255)begin
	#15 Pready1=1'b1;
	slave1[Paddr] = Pwdata; // Write data with wait state
	s1m=slave1[Paddr];    end
if(Paddr < 4 && (Pwrite==0) && slave1[Paddr]>255)begin
	#15 Pready1=1'b1;
	Prdata1=slave1[Paddr];    // Read data with wait state
	end
			    end         
else   Pready1 <= 1'b0;   end
endmodule
