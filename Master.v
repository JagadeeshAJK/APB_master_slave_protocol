

module Master(Pclk,Prst,Pwritei,Pwriteo,Paddri,Paddro,Pselx,Prdata,Pready,Penable,Pwdata,stt);
//input signals of APB Slave
input Pclk,Prst;
 
input [15:0]Prdata;
output [15:0]Pwdata;
output [2:0]Paddro;
input [2:0]Paddri;
input Pwritei;
output reg Penable;
output Pwriteo;
input Pready;
output reg [1:0]stt;
output reg Pselx;

assign Paddro=Paddri;
assign Pwriteo=Pwritei;
//state declaration
parameter [1:0] idle=2'b00;
parameter [1:0] setup=2'b01;
parameter [1:0] access=2'b10;
//state declaration of present and next




parameter s1L=3'b000,s2H=3'b111;

reg [1:0] present_state, next_state;




always@(posedge Pclk or posedge Prst) // async active low reset

begin



if (Prst==1) begin
 present_state <= idle; 
 next_state <=present_state;
end

else 
present_state <= next_state;
end






always@(*) begin 
case (present_state)

//Idle phase

idle:begin
stt=00;
//Penable=1'b0;
Pselx=0;

if (Paddri>=s1L && Paddri<=s2H) begin //penable =1 and psel =1 
 
next_state = setup; end 
else begin next_state = idle;

end


end



//setup phase

setup:begin
stt=01;
Penable=1'b0;
Pselx=1'b1;
//if (Pselx) begin //penable =1 and psel =1 
 
next_state = access;
// end 
//else next_state = idle;

end


access:begin
stt=10;
Penable=1'b1;
Pselx=1'b1;





if(!Penable) begin
next_state = idle; 
//Pready =0;

end


end

endcase
end
endmodule

