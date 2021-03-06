`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: NTU
// Engineer:Dr. Smitha K G

// 
////////////////////////////////////////////////////////////////////////////////

module test_bench_4_stage_pipeline;

	// Inputs
	reg clk;
	reg rst;
	reg fileid;
	
	// Outputs
	wire [15:0] PCOUT;
	wire [15:0] INST;
	wire [3:0] aluop;
	wire [15:0] rdata1;
	wire [15:0] rdata2;
	wire [15:0] rdata1_ID_EXE;
	wire [15:0] rdata2_ID_EXE_mux;
	wire [15:0] rdata2_ID_EXE_pure;
	wire [3:0] aluop_ID_EXE;
	wire [3:0] waddr_out_ID_EXE;
	wire [15:0] aluout;
	wire [3:0] waddr_out_EXE_DM;
	wire [15:0] aluout_EXE_DM;

	// Instantiate the Unit Under Test (UUT)
	pipelined_regfile_4stage uut (
		.clk(clk), 
		.rst(rst), 
		.fileid(fileid), 
		.PCOUT(PCOUT), 
		.INST(INST), 
		.aluop(aluop), 
		.rdata1(rdata1), 
		.rdata2(rdata2), 
		.rdata1_ID_EXE(rdata1_ID_EXE), 
		.rdata2_ID_EXE_mux(rdata2_ID_EXE_mux), 
		.rdata2_ID_EXE_pure(rdata2_ID_EXE_pure), 
		.aluop_ID_EXE(aluop_ID_EXE), 
		.waddr_out_ID_EXE(waddr_out_ID_EXE), 
		.aluout(aluout),
		.waddr_out_EXE_DM(waddr_out_EXE_DM), 
		.aluout_EXE_DM(aluout_EXE_DM)
	);

always #15 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		fileid = 0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
#25 rst =1;
#25 rst=0;

	end
      
endmodule

