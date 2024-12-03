`include "Master.v"
`include "MUX.v"
`include "slave1.v"
`include "slave2.v"

module top(Pclk, Prst, Paddr, Pwdata,Pwrite);

input [15:0] Pwdata;
input Pclk;
input Prst;
input [2:0] Paddr; 
input Pwrite;

wire [15:0]s1m,s2m;
wire [15:0]Prdata2;
wire [15:0]Prdata1;
wire [1:0]stt;
wire [15:0]Prdata;
wire Psel1,Psel2;
wire Pselx,Pready,Penable,Pwrite;
wire [2:0]Paddro;
wire [2:0]Paddri;
wire Pwritei;
assign Pwritei=Pwrite;
assign Paddri=Paddr;

wire [15:0] Pwdata;
wire [2:0]Paddr;

wire Pready1,Pready2;


Master d1(
        .Pclk(Pclk), 
        .Prst(Prst), 
        .Paddri(Paddri),
        .Paddro(Paddro),
        .Pselx(Pselx),
        .Pwritei(Pwritei),
        .Pwriteo(Pwriteo), 
        .Pwdata(Pwdata), 
        .Pready(Pready),
        .stt(stt), 
        .Prdata(Prdata),
        .Penable(Penable)// Ensure Prdata is of correct size
    );




slave1 d2(
        .Pready1(Pready1), 
        .Psel1(Psel1), 
        .Pclk(Pclk), 
        .Paddr(Paddr), 
        .Prst(Prst), 
        .Penable(Penable), 
        .Pwrite(Pwrite), 
        .Pwdata(Pwdata), 
        .Prdata1(Prdata1),
        .s1m(s1m)
        
    );


slave2 d3(
        .Prdata2(Prdata2), 
        .Pready2(Pready2), 
        .Psel2(Psel2), 
        .Pclk(Pclk), 
        .Paddr(Paddr), 
        .Prst(Prst), 
        .Penable(Penable), 
        .Pwrite(Pwrite), 
        .Pwdata(Pwdata),
        .s2m(s2m)
    );
mux d4(.Paddr(Paddr),
.Pselx(Pselx),
.Psel1(Psel1),
.Psel2(Psel2),
.Pready(Pready),
.Pready1(Pready1),
.Pready2(Pready2),
.Prdata(Prdata),
.Prdata1(Prdata1),
.Prdata2(Prdata2)

);
endmodule







