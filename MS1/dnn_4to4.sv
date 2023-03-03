module dnn_4to4 (
		 x0, x1, x2, x3, 
		 w04, w05, w06, w07, 
		 w14, w15, w16, w17, 
		 w24, w25, w26, w27, 
		 w34, w35, w36, w37, 
		 out0, out1, out2, out3, 
		 in_ready, 
		 out_ready, 
		 clk);

//Inputs
input signed [4:0] x0, x1, x2, x3;
input signed [4:0] w04, w05, w06, w07, w14, w15, w16, w17, w24, w25, w26, w27, w34, w35, w36, w37;

input in_ready;
input clk;

//Outputs
output logic signed [16:0] out0, out1, out2, out3;
output logic out_ready;

//Multiplying weights to inputs and adding them for each node
always_ff@(posedge clk)
begin
	out_ready <= in_ready;

	if(in_ready)
	begin
		out0 <= x0*w04 + x1*w14 + x2*w24 + x3*w34;
        out1 <= x0*w05 + x1*w15 + x2*w25 + x3*w35;
        out2 <= x0*w06 + x1*w16 + x2*w26 + x3*w36;
        out3 <= x0*w07 + x1*w17 + x2*w27 + x3*w37;
	end
end
endmodule

