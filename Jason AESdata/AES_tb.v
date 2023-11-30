
module AES_tb();

	reg [127:0] in;
	reg [127:0] key;
	wire [127:0] out;
	reg clk;
	reg data_vaild;
	reg rst;
	wire ready;

    wire [3:0]state;
    wire [127:0]internal_data;
    wire [127:0]subbyted;
    wire [127:0]shifted;
    wire [127:0]mixcolumned;
    wire [127:0]addroundkeyed;
    wire [4:0] nround;
    AES a(clk,rst,data_vaild,in,key,out,ready,state,internal_data,subbyted,shifted,mixcolumned,addroundkeyed,nround);

	
	
	
	initial begin
		clk = 0;
		rst = 1;
		#5
		rst = 0;
		#5
		data_vaild = 1;
		in = 128'h32_43_f6_a8_88_5a_30_8d_31_31_98_a2_e0_37_07_34;
		key = 128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c;
	end	
	always begin
		#5
		clk = ~clk;
	end
endmodule
