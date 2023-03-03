module reLU (
		in0, in1, in2, in3,
		ready_in,clk,
		out0, out1, out2, out3,
		ready_out
	);

input signed [16:0] in0, in1, in2, in3;
		
input ready_in,clk;
		
output logic signed [16:0] out0, out1, out2, out3;
		
output logic ready_out;

always_ff@(posedge clk)
begin
	ready_out <= ready_in;
	if(ready_in)
	begin
		out0 <= (in0>0) ? in0 : 21'd0;
		out1 <= (in1>0) ? in1 : 21'd0;
		out2 <= (in2>0) ? in2 : 21'd0;
		out3 <= (in3>0) ? in3 : 21'd0;
	end
end
endmodule
