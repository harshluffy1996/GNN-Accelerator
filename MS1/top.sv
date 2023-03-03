module top (   
       		x0, x1, x2, x3,
                w04, w14, w24, w34,
                w05, w15, w25, w35,
                w06, w16, w26, w36,
                w07, w17, w27, w37,
                w48, w58, w68, w78,
                w49, w59, w69, w79,
                out0, out1,
                in_ready,
                out10_ready, out11_ready,
                clk
	);
    //Inputs
    input signed [4:0] x0, x1, x2, x3;
    input signed [4:0] w04, w14, w24, w34;
    input signed [4:0] w05, w15, w25, w35;
    input signed [4:0] w06, w16, w26, w36;
    input signed [4:0] w07, w17, w27, w37;
    input signed [4:0] w48, w58, w68, w78;
    input signed [4:0] w49, w59, w69, w79;
    
    input clk, in_ready;
    
    //Outputs
    output logic signed [16:0] out0, out1;
    
    output logic out10_ready, out11_ready;

	//Wires and Registers
    logic dnn_ready_out, relu_ready_out;

    logic signed [16:0]   x4, x5, x6, x7;

    logic signed [16:0]   x4_relu, x5_relu, x6_relu, x7_relu;
    
//Hidden Layer with 4 inputs and 4 outputs	
dnn_4to4 i_dnn_4to4_0 (
		.x0(x0), .x1(x1), .x2(x2), .x3(x3),
		.w04(w04), .w05(w05), .w06(w06), .w07(w07),
                .w14(w14), .w15(w15), .w16(w16), .w17(w17),
                .w24(w24), .w25(w25), .w26(w26), .w27(w27),
                .w34(w34), .w35(w35), .w36(w36), .w37(w37),
		.out0(x4), .out1(x5), .out2(x6), .out3(x7),
		.in_ready(in_ready),
		.out_ready(dnn_ready_out),
		.clk(clk)
	);

//ReLU Layer with 4 inputs and 4 outputs
reLU i_reLU_0 (
		.clk(clk), .ready_in(dnn_ready_out),
		.in0(x4), .in1(x5), .in2(x6), .in3(x7),
		.out0(x4_relu), .out1(x5_relu), .out2(x6_relu), .out3(x7_relu),
		.ready_out(relu_ready_out)
	);

//Final Layer with 4 inputs and 2 outputs
dnn_4to2 i_dnn_4to2_0 (
		.x4(x4_relu), .x5(x5_relu), .x6(x6_relu), .x7(x7_relu),  
		.w48(w48), .w58(w58), .w68(w68), .w78(w78), 
		.w49(w49), .w59(w59), .w69(w69), .w79(w79), 
		.out0(out0), .out1(out1),
		.in_ready(relu_ready_out), 
		.out0_ready(out10_ready),
		.out1_ready(out11_ready), 
		.clk(clk)
	);

endmodule

