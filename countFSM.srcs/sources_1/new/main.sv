module countFSM(input logic clk, reset, inp, output logic [31:0] result, output logic ended);
typedef enum logic [1:0] {S0, S1, S2} state;
state current;
state next = S0;
always_ff@ (posedge clk) 
begin
current <= next;
end
always_ff@ (posedge clk)

case(current)

S0:
begin
if(!reset) next = S0;
else if(inp) next = S1;
end
S1: 
begin
if(!reset) next = S0;
else if(!inp) next = S2;
end
S2:
if(!reset) next = S0;
endcase

always_ff@ (posedge clk)
case(current)
S0: 
begin
ended = 0;
result = 0;
end
S1:
begin
result = result + 1'd1;
end
S2:
begin
ended = 1;
end
endcase
endmodule
/*

module countFSM(input logic clk, reset, inp, output logic [31:0] result, output logic ended);
typedef enum logic [1:0] {S0, S1, S2} state;
state current;
state next = S0;
always_ff@ (posedge clk) 
begin
current <= next;
end
always_ff@ (posedge clk)

case(current)

S0:
begin
if(!reset) next = S0;
else if(inp) next = S1;
end
S1: 
begin
if(!reset) next = S0;
else if(!inp) next = S2;
end
S2:
if(!reset) next = S0;
endcase

always_ff@ (posedge clk)
case(current)
S0: 
begin
ended = 0;
result = 0;
end
S1:
begin
result = result + 1'd1;
end
S2:
begin
ended = 1;
end
endcase
endmodule
*/