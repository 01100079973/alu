
module test; 

reg [103:0] Mem [0:22]; 

reg  [31:0]a;
reg  [31:0]b;
reg  [2:0]f;
wire [31:0]y;
wire  zero;

ALU32Bit alu (.ALUControl(f),.A(a),.B(b),.ALUResult(y),.Zero(zero)); 



initial $readmemh("testcases.txt",Mem); 
 
integer k=0; 

initial begin 

for (k='d0;k<'d22;k=k+'d1)  begin


a=Mem[k][99:68];
b=Mem[k][67:36];
f=Mem[k][102:100];


#1;
if(y==Mem[k][35:4]&(zero==Mem[k][0:0]))
  $display("right ");
else 
    $display("something wrong !");
 end
end


endmodule 

