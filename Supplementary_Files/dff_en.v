module dff_en(
	input in_D, in_EN, in_CLK,
	output reg data_out
);

always @ (posedge in_CLK)
	if(in_EN)
		data_out<=in_D;
endmodule