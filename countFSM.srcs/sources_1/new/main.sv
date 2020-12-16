`timescale 1 ns/10 ps
module countFSM_tb();
logic clock, inp, reset;
countFSM dut(reset, clock, inp);
initial begin 
#5
clock = 1;
inp = 1;
reset = 1;
#5 
clock = 0;
inp = 0;
reset = 0;

#5 
clock = 1;
inp = 0;
reset = 0;
end 
endmodule

module countFSM(input logic reset, clk, data, output logic [31:0] count);
typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
statetype state, newstate;
always_ff@ (posedge clk)
begin 
state = newstate;
end
always_comb
case(state)
S0: if(reset) newstate = S1;
    else if(!reset) newstate = S0;
S1: if(reset) newstate = S0;
    else if(data) newstate = S2;
    else if (!data) newstate = S1;
S2: if(reset) newstate = S0;
    else if (data) newstate = S2;
    else if(!data) newstate = S1;
endcase
endmodule
