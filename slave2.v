module slave2(Prdata2,Pready2,Psel2,Pclk,Paddr,Prst,Penable,Pwrite,Pwdata,s2m);
input Pclk,Prst,Psel2,Penable,Pwrite;
output reg [15:0]Prdata2,s2m;
output reg Pready2;
input [15:0]Pwdata;
input [2:0]Paddr;
reg [15:0]slave2[3:0];
always@(*)    begin
if(Prst==1) begin
slave2[0]=16'b0;
slave2[1]=16'b0;
slave2[2]=16'b0;
slave2[3]=16'b0;
Pready2=0;   end
else if(Psel2 && Penable) begin
if(Paddr < 4 && (Pwrite==1) && Pwdata<=255)begin
	Pready2<=1'b1;
	slave2[Paddr] <= Pwdata; // Write data
	s2m=slave2[Paddr];     end
if(Paddr < 4 && (Pwrite==0) && slave2[Paddr]<=255)begin
	Pready2<=1'b1;
	Prdata2=slave2[Paddr];    // Read data
	end
if(Paddr < 4 && (Pwrite==1) && Pwdata>255)begin
	#15 Pready2=1'b1;
	slave2[Paddr] = Pwdata; // Write data
	s2m=slave2[Paddr];    end
if(Paddr < 4 && (Pwrite==0) && slave2[Paddr]>255)begin
	#15 Pready2=1'b1;
	Prdata2=slave2[Paddr];    // Read data
	end
			    end         
else   Pready2 <= 1'b0;   end
endmodule
