module AES_encrypt#(parameter N=128,parameter nr=10,parameter nk =4)(in,key,out);

input [127:0]in;
input [N-1:0]key;
output [127:0]out;

wire [128*(nr+1)-1:0]fullkeys;
wire [127:0] states[nr+1:0];
wire [127:0] aftersubbytes;
wire [127:0] aftershiftrows;

keyexpansion #(nr,nk)k1(key,fullkeys);
addroundkey addk1 (in,fullkeys[((128*(nr+1))-1)-:128],states[0]);

genvar i ;
generate
    for(i=1;i<nr;i=i+1)begin
        encryptRound er(states[i-1],fullkeys[(((128*(nr+1))-1)-128*i)-:128],states[i]);
    end
    subbyte sb(states[nr-1],aftersubbytes);
    shiftrows sr(aftersubbytes,aftershiftrows);
    addroundkey addk2 (aftershiftrows,fullkeys[127:0],states[nr]);
    assign out = states[nr];
endgenerate
endmodule












