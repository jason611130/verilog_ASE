module AES_tb();

	reg [127:0] in;
	reg [127:0] key;
	wire [127:0] out;
	
	AES aes1(in,key,out);
	initial begin
		in = 128'h32_43_f6_a8_88_5a_30_8d_31_31_98_a2_e0_37_07_34;
		key = 128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c;
	end	
endmodule
