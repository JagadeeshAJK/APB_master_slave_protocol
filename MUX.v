module mux(Paddr,Pselx,Psel1,Psel2,Pready,Pready1,Pready2,Prdata,
Prdata1,Prdata2);

input Pselx;
input [2:0]Paddr;
input [15:0]Prdata1,Prdata2;
input Pready1,Pready2;
output reg Pready,Psel1,Psel2;
output reg [15:0]Prdata;
parameter s1L=3'b000,s1H=3'b100,s2L=3'b101,s2H=3'b111;

always@(*)    begin
if(Pselx) begin
if(Paddr >= s1L && Paddr <= s1H ) begin
	Psel1=1'b1;
	Psel2=1'b0;
	end
if(Paddr >= s2L && Paddr <= s2H ) begin
	Psel2=1'b1;
	Psel1=1'b0;
	end
           end
if(Pready1 | Pready2)begin
	Pready=1;
	end
if(Prdata1>=0)begin
	Prdata=Prdata1;
	end
else if(Prdata2>=0)begin
	Prdata=Prdata2;
	end
else 
Prdata=1'bx;
               end
endmodule
