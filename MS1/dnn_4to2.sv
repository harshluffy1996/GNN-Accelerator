module dnn_4to2 (
		 x4, x5, x6, x7,  
		 w48, w58, w68, w78, 
		 w49, w59, w69, w79, 
		 out0, out1,
		 in_ready, 
		 out0_ready,
		 out1_ready, 
		 clk);

//Inputs
input signed [16:0] x4, x5, x6, x7;
input signed [4:0] w48, w58, w68, w78, w49, w59, w69, w79;

input in_ready;
input clk;

//Outputs
output logic signed [16:0] out0, out1;
output logic out0_ready, out1_ready;

//Multiplying weights to inputs and adding them for each node
always_ff@(posedge clk)
begin
        out0_ready <= in_ready;
        out1_ready <= in_ready;

	if(in_ready)
	begin
            out0 <= x4 * w48 + x5 * w58 + x6 * w68 + x7 * w78;
            out1 <= x4 * w49 + x5 * w59 + x6 * w69 + x7 * w79;
            
    	end	
end
endmodule

