//==============================
// AND
//==============================
module AND(a, b, c);
    input [31:0] a, b;
    output [31:0] c;

    assign c = a & b;
endmodule

//==============================
// OR
//==============================
module OR(a, b, c);
    input [31:0] a, b;
    output [31:0] c;

    assign c = a | b;
endmodule

//==============================
// XOR	
//==============================
module XOR(a,b,c);
	input [31:0] a,b;
	output [31:0] c;

	assign c= a ^ b;
endmodule

//==============================
// XOR	
//==============================
module NOT(a,c);
	input [31:0] a;
	output [31:0] c;

	assign c= ~a;
endmodule

//==============================
// NAND
//==============================
module NAND(a,b,c);
	input [31:0] a,b;
	output [31:0] c;

	assign c= a ~& b;
endmodule

//==============================
// NOR
//==============================
module NOR(a,b,c);
	input [31:0] a,b;
	output [31:0] c;

	assign c= a ~| b;
endmodule

//==============================
// XNOR	
//==============================
module XNOR(a,b,c);
	input [31:0] a,b;
	output [31:0] c;

	assign c= a ~^ b;
endmodule

//==============================
// NO-OP	
//==============================
module NOOP(a,c);
	input [31:0] a;
	output [31:0] c;

	assign c= ~(~a);
endmodule

//==============================
//
// Decoder
//
//==============================
module Dec4x16(binary, onehot);
	input [3:0] binary;
	output [15:0] onehot;

	assign onehot[ 0]=~binary[3]&~binary[2]&~binary[1]&~binary[0];
	assign onehot[ 1]=~binary[3]&~binary[2]&~binary[1]& binary[0];
	assign onehot[ 2]=~binary[3]&~binary[2]& binary[1]&~binary[0];
	assign onehot[ 3]=~binary[3]&~binary[2]& binary[1]& binary[0];
	assign onehot[ 4]=~binary[3]& binary[2]&~binary[1]&~binary[0];
	assign onehot[ 5]=~binary[3]& binary[2]&~binary[1]& binary[0];
	assign onehot[ 6]=~binary[3]& binary[2]& binary[1]&~binary[0];
	assign onehot[ 7]=~binary[3]& binary[2]& binary[1]& binary[0];
	assign onehot[ 8]= binary[3]&~binary[2]&~binary[1]&~binary[0];
	assign onehot[ 9]= binary[3]&~binary[2]&~binary[1]& binary[0];
	assign onehot[10]= binary[3]&~binary[2]& binary[1]&~binary[0];
	assign onehot[11]= binary[3]&~binary[2]& binary[1]& binary[0];
	assign onehot[12]= binary[3]& binary[2]&~binary[1]&~binary[0];
	assign onehot[13]= binary[3]& binary[2]&~binary[1]& binary[0];
	assign onehot[14]= binary[3]& binary[2]& binary[1]&~binary[0];
	assign onehot[15]= binary[3]& binary[2]& binary[1]& binary[0];

endmodule

//==============================
//
// Full Adder
//
//==============================
module FullAdder(A, B, C, carry, sum);
	input A;
	input B;
	input C;

	output carry;
	output sum;

	wire A;
	wire B;
	wire C;
	reg carry;
	reg sum;
//---------------------------------------------

always@(*)
  begin
	  sum= A ^ B ^ C;
	  carry= ((A ^ B) & C) | (A & B);
  end

//---------------------------------------------
endmodule

//==============================
//
// Add/Subtract
//
//==============================
module ThirtyTwoBitAddSub(inputA, inputB, mode, sum, carry, overflow);
	input [31:0] inputA; // {32} NOTE: EVERYWHERE YOU SEE A '31' WAS PREVIOUSLY A '15'
	input [31:0] inputB;
    input mode;
    output [31:0] sum;
	output carry;
    output overflow;

	wire [31:0] inputA;
	wire [31:0] inputB;
	wire mode;

	//reg [3:0] sum;
	reg carry;
	reg overflow;

	// Local Variables
	wire c0; // Mode assigned to C0
    wire b0,b1,b2,b3; // XOR Interfaces
	wire c1,c2,c3,c4; // Carry Interfaces

	// {8} adding more wires for remaining carry over (to support 8 bit)
	wire b4, b5, b6, b7;
	wire c5, c6, c7, c8;

	// {16} adding more wires for remaining carry over (to support 16 bit)
	wire b8, b9, b10, b11, b12, b13, b14, b15;
	wire c9, c10, c11, c12, c13, c14, c15, c16;

	// {32} adding more wires for remaining carry over (to support 32 bit)
	wire b16, b17, b18, b19, b20, b21, b22, b23;
	wire b24, b25, b26, b27, b28, b29, b30, b31;

	wire c17, c18, c19, c20, c21, c22, c23, c24;
	wire c25, c26, c27, c28, c29, c30, c31, c32;

	assign c0=mode; // Mode=0, Addition; Mode=1, Subtraction

    assign b0 = inputB[0] ^ mode; // Flip the bit if mode is set to subtraction
    assign b1 = inputB[1] ^ mode;
    assign b2 = inputB[2] ^ mode;
    assign b3 = inputB[3] ^ mode;
	assign b4 = inputB[4] ^ mode;
	assign b5 = inputB[5] ^ mode;
	assign b6 = inputB[6] ^ mode;
	assign b7 = inputB[7] ^ mode;
	assign b8 	= inputB[8]  ^ mode;
	assign b9 	= inputB[9]  ^ mode;
	assign b10 	= inputB[10] ^ mode;
	assign b11 	= inputB[11] ^ mode;
	assign b12 	= inputB[12] ^ mode;
	assign b13 	= inputB[13] ^ mode;
	assign b14 	= inputB[14] ^ mode;
	assign b15 	= inputB[15] ^ mode;
	assign b16 	= inputB[16] ^ mode;
	assign b17 	= inputB[17] ^ mode;
	assign b18 	= inputB[18] ^ mode;
	assign b19 	= inputB[19] ^ mode;
	assign b20 	= inputB[20] ^ mode;
	assign b21 	= inputB[21] ^ mode;
	assign b22 	= inputB[22] ^ mode;
	assign b23 	= inputB[23] ^ mode;
	assign b24	= inputB[24] ^ mode;
	assign b25	= inputB[25] ^ mode;
	assign b26 	= inputB[26] ^ mode;
	assign b27 	= inputB[27] ^ mode;
	assign b28 	= inputB[28] ^ mode;
	assign b29 	= inputB[29] ^ mode;
	assign b30 	= inputB[30] ^ mode;
	assign b31 	= inputB[31] ^ mode;


	// Carry out the addition of all 32 bits one-by-one...
	FullAdder FA0(inputA[0],b0,  c0,c1,sum[0]);
	FullAdder FA1(inputA[1],b1,  c1,c2,sum[1]);
	FullAdder FA2(inputA[2],b2,  c2,c3,sum[2]);
	FullAdder FA3(inputA[3],b3,  c3,c4,sum[3]);
	FullAdder FA4(inputA[4],b4,  c4,c5,sum[4]);
	FullAdder FA5(inputA[5],b5,  c5,c6,sum[5]);
	FullAdder FA6(inputA[6],b6,  c6,c7,sum[6]);
	FullAdder FA7(inputA[7],b7,  c7,c8,sum[7]);
	FullAdder FA8(inputA[8],b8,  	c8,c9,sum[8]);
	FullAdder FA9(inputA[9],b9,  	c9,c10,sum[9]);
	FullAdder FA10(inputA[10],b10,  c10,c11,sum[10]);
	FullAdder FA11(inputA[11],b11,  c11,c12,sum[11]);
	FullAdder FA12(inputA[12],b12,  c12,c13,sum[12]);
	FullAdder FA13(inputA[13],b13,  c13,c14,sum[13]);
	FullAdder FA14(inputA[14],b14,  c14,c15,sum[14]);
	FullAdder FA15(inputA[15],b15,  c15,c16,sum[15]);
	FullAdder FA16(inputA[16],b16,	c16, c17,sum[16]);
	FullAdder FA17(inputA[17],b17,	c17, c18,sum[17]);
	FullAdder FA18(inputA[18],b18,	c18, c19,sum[18]);
	FullAdder FA19(inputA[19],b19,	c19, c20,sum[19]);
	FullAdder FA20(inputA[20],b20,	c20, c21,sum[20]);
	FullAdder FA21(inputA[21],b21,	c21, c22,sum[21]);
	FullAdder FA22(inputA[22],b22,	c22, c23,sum[22]);
	FullAdder FA23(inputA[23],b23,	c23, c24,sum[23]);
	FullAdder FA24(inputA[24],b24,	c24, c25,sum[24]);
	FullAdder FA25(inputA[25],b25,	c25, c26,sum[25]);
	FullAdder FA26(inputA[26],b26,	c26, c27,sum[26]);
	FullAdder FA27(inputA[27],b27,	c27, c28,sum[27]);
	FullAdder FA28(inputA[28],b28,	c28, c29,sum[28]);
	FullAdder FA29(inputA[29],b29,	c29, c30,sum[29]);
	FullAdder FA30(inputA[30],b30,	c30, c31,sum[30]);
	FullAdder FA31(inputA[31],b31,	c31, c32,sum[31]);

	always@(*)
	begin
		overflow = c32^c31;	// {32} Added this to support 32 bits
	end

endmodule

//==============================
//
// BehavioralDivision
//
//==============================
module BehavioralDivision(dividend, divisor, quotient, remainder, error);
    input [31:0] dividend; // {32} all values with '31' were changed from '15' for 32 bits
    input [31:0] divisor;
    output [31:0] quotient;
    output [31:0] remainder;
    output error;

    wire [31:0] dividend;
    wire [31:0] divisor;
    reg [31:0] quotient;
    reg [31:0] remainder;
    reg error;

    always @(dividend,divisor) begin
        quotient =dividend/divisor;
        remainder=dividend%divisor;

		// {32} Altered to support 32 bits (Below)
		error = ~(divisor[31] | divisor[30] | divisor[29] | divisor[28] |
				divisor[27] | divisor[26] | divisor[25] | divisor[24] |
				divisor[23] | divisor[22] | divisor[21] | divisor[20] |
				divisor[19] | divisor[18] | divisor[17] | divisor[16] |
				divisor[15] | divisor[14] | divisor[13] | divisor[12] |
				divisor[11] | divisor[10] | divisor[9] | divisor[8] |
				divisor[7] | divisor[6] | divisor[5] | divisor[4] |
				divisor[3] | divisor[2] | divisor[1] | divisor[0]);
    end

endmodule

//==============================
//
// BehavioralMultiplication
//
//==============================
module BehavioralMultiplication(inputA, inputB, outputC);
	parameter n = 32;
	input [n - 1 : 0] inputA, inputB;
	output [2 * n - 1 : 0] outputC;
	wire [n - 1 : 0] inputA, inputB;
	reg [2 * n - 1 : 0] outputC;

	always @(*) begin
		outputC = inputA * inputB;
	end
endmodule


//==============================
//
// StructMux4
//
//==============================
module StructMux4(channels, select, b);
	parameter n = 32;
	parameter chansize=2*n;
	input [15:0][chansize-1:0] channels;
	input [15:0]      select;
	output      [chansize-1:0] b;

	assign b = ({chansize{select[15]}} & channels[15]) |
               ({chansize{select[14]}} & channels[14]) |
			   ({chansize{select[13]}} & channels[13]) |
			   ({chansize{select[12]}} & channels[12]) |
			   ({chansize{select[11]}} & channels[11]) |
			   ({chansize{select[10]}} & channels[10]) |
			   ({chansize{select[ 9]}} & channels[ 9]) |
			   ({chansize{select[ 8]}} & channels[ 8]) |
			   ({chansize{select[ 7]}} & channels[ 7]) |
			   ({chansize{select[ 6]}} & channels[ 6]) |
			   ({chansize{select[ 5]}} & channels[ 5]) |
			   ({chansize{select[ 4]}} & channels[ 4]) |
			   ({chansize{select[ 3]}} & channels[ 3]) |
			   ({chansize{select[ 2]}} & channels[ 2]) |
               ({chansize{select[ 1]}} & channels[ 1]) |
               ({chansize{select[ 0]}} & channels[ 0]) ;

endmodule

//==============================
//
// StructMux2
//
//==============================
module StructMux2(channels, select, b);
	parameter chansize = 2;
	input [15:0][chansize-1:0] channels;
	input [15:0]               select;
	output      [chansize-1:0] b;

	assign b = ({chansize{select[15]}} & channels[15]) |
               ({chansize{select[14]}} & channels[14]) |
			   ({chansize{select[13]}} & channels[13]) |
			   ({chansize{select[12]}} & channels[12]) |
			   ({chansize{select[11]}} & channels[11]) |
			   ({chansize{select[10]}} & channels[10]) |
			   ({chansize{select[ 9]}} & channels[ 9]) |
			   ({chansize{select[ 8]}} & channels[ 8]) |
			   ({chansize{select[ 7]}} & channels[ 7]) |
			   ({chansize{select[ 6]}} & channels[ 6]) |
			   ({chansize{select[ 5]}} & channels[ 5]) |
			   ({chansize{select[ 4]}} & channels[ 4]) |
			   ({chansize{select[ 3]}} & channels[ 3]) |
			   ({chansize{select[ 2]}} & channels[ 2]) |
               ({chansize{select[ 1]}} & channels[ 1]) |
               ({chansize{select[ 0]}} & channels[ 0]) ;

endmodule

//==============================
//
// DFF - Memory Register
//
//==============================
module DFF(clk, in, out);
	parameter n=1; //width

	input clk;
	input [n-1:0] in;
	output [n-1:0] out;
	reg [n-1:0] out;

	always @(posedge clk)
	out = in;
endmodule

//==============================
//
// Breadboard
//
//==============================
module breadboard(clk, rst, A, B, C, opcode, error);
	//==============================
	//
	// Parameter Definitions
	//
	//==============================
	input clk;
	input rst;
	input [31:0] A;
	input [31:0] B;
	input [3:0] opcode;

	output [31:0] C;
	output [1:0]error;

	wire clk;
	wire rst;

	wire [31:0] A;
	wire [31:0] B;
	wire [3:0] opcode;

	reg  [31:0] C;
	reg  [1:0] error;

	reg [31:0] regA;
	reg [31:0] regB;

	reg [63:0] next;
	wire [63:0] cur;


	//==============================
	//
	// CONTROL
	//
	//==============================
	wire [15:0] select;
	Dec4x16 dec1(opcode, select);

	wire [15:0][ 63:0] channels;
	wire       [ 63:0] b;
	wire       [ 31:0] unknown;

	wire [15:0][ 1:0]  chErr;
	wire       [ 1:0]   bErr;
	wire       [ 1:0] unkErr;

	//==============================
	//
	// INTERFACES
	//
	//==============================
	wire [31:0] outputAND;
	wire [31:0] outputOR;
	wire [31:0] outputXOR;
	wire [31:0] outputNOT;
	wire [31:0] outputNAND;
	wire [31:0] outputNOR;
	wire [31:0] outputXNOR;
	wire [31:0] outputNOOP;

	//----------
	// ADDITION
	//----------
	wire [31:0] outputADDSUB;
	wire ADDerror;
	wire Carry;

	//------------
	// SUBTRACTION
	//------------
	reg modeSUB;

	//-----------------
	// DIVISION/MODULUS
	//-----------------
	wire [31:0] outputQuotient;
	wire [31:0] outputRemainder;
	wire DIVerror;

	//----------------
	// Multiplication
	//----------------
	wire [63:0] outputProduct; // 32 * 32 = 64-bit product

	//==============================
	//
	// Error Reporting
	//
	//==============================
	reg errHigh;
	reg errLow;

	//==============================
	// Connect the MUX to the OpCodes
	//==============================
	assign channels[ 0]={{32'b00000000000000000000000000000000}, outputAND}; // (before) -> assign channels[ 0]=unknown;
	assign channels[ 1]={{32'b00000000000000000000000000000000}, outputOR};
	assign channels[ 2]={{32'b00000000000000000000000000000000}, outputXOR};
	assign channels[ 3]={{32'b00000000000000000000000000000000}, outputNOT};
	assign channels[ 4]={{32'b00000000000000000000000000000000}, outputADDSUB};
	assign channels[ 5]={{32'b00000000000000000000000000000000}, outputADDSUB};
	assign channels[ 6]={outputProduct};
	assign channels[ 7]={{32'b00000000000000000000000000000000}, outputQuotient};
	assign channels[ 8]={{32'b00000000000000000000000000000000}, outputRemainder};
	assign channels[ 9]={{32'b00000000000000000000000000000000}, outputNAND};
	assign channels[10]={{32'b00000000000000000000000000000000}, outputNOR};
	assign channels[11]={{32'b00000000000000000000000000000000}, outputXNOR};
	assign channels[12]=cur;
	assign channels[13]=0;
	assign channels[14]=0;
	assign channels[15]=0;

	// CONNECT ERROR CHANNELS
	assign chErr[ 0]=unkErr;
	assign chErr[ 1]=unkErr;
	assign chErr[ 2]=unkErr;
	assign chErr[ 3]=unkErr;
	assign chErr[ 4]={1'b0, errLow};
	assign chErr[ 5]={1'b0, errLow};
	assign chErr[ 6]=unkErr;
	assign chErr[ 7]={errHigh, 1'b0};
	assign chErr[ 8]={errHigh, 1'b0};
	assign chErr[ 9]=unkErr;
	assign chErr[10]=unkErr;
	assign chErr[12]=unkErr;
	assign chErr[11]=unkErr;
	assign chErr[13]=unkErr;
	assign chErr[14]=unkErr;
	assign chErr[15]=unkErr;

	//==============================
	//
	// INSTANTIATE MODULES
	//
	//==============================
	AND and1(regA, regB, outputAND); // ADDED THIS MODULE INSTANCE TO TEST IT OUT (IT WORKS!)
	OR or1(regA, regB, outputOR);
	XOR xor1(regA, regB, outputXOR);
	NOT not1(regA, outputNOT);
	NAND nand1(regA, regB, outputNAND);
	NOR nor1(regA, regB, outputNOR);
	XNOR xnor1(regA, regB, outputXNOR);
	NOOP noop1(regA, outputNOOP); // something tells me A should be swapped out with cur per assignment instr
	ThirtyTwoBitAddSub add1(regA, regB, modeSUB, outputADDSUB, Carry, ADDerror);
	BehavioralDivision div1(regA, regB, outputQuotient, outputRemainder, DIVerror);
	BehavioralMultiplication mult1(regA, regB, outputProduct);
	StructMux4 muxOps(channels, select, b);
	StructMux2 muxErr(chErr, select, bErr);

	//---------------------
	// Accumulator Register
	//---------------------
	DFF ACC1 [63:0] (clk, next, cur);

	//==================================
	//
	// Perform the gate-level operations
	//
	//==================================
	always@(*) begin
		// regA is normal 32-bit input
		// regB is lower 32-bits from memory feedback loop
		regA = cur[31:0]; // regA is feedback loop being fed back into all other modules
		regB = A;

		// Toggle subtraction if necessary
		modeSUB=~opcode[3]& opcode[2]&~opcode[1]& opcode[0];

		// Set output of operations to 'C'
		// C=b;
		C = cur;
		next=b;
		errHigh=DIVerror;
		errLow=ADDerror;

		// Set errors of rperations to 'error'
		error=bErr;
	end

endmodule

//==============================
//
// TEST BENCH
//
//==============================
module testbench();
	//==============================
	//
	// Local Variables
	//
	//==============================
	reg clk;
	reg rst;
	reg  [3:0] opcode;
	reg  [31:0] inputB;
	reg  [31:0] inputA;
	wire [31:0] outputC;

	wire [1:0] error;

	//==============================
	//
	// Create Breadboard
	//
	//==============================
	breadboard bb8(clk, rst, inputA, inputB, outputC, opcode, error);

	//==============================
	// CLOCK Thread
	//==============================
	initial begin// Start Stimulous Thread
		forever
			begin
				clk=0; // low square wave
				#5;
				clk=1;
				#5;
				$display("Tick");
			end
	end

	//==============================
	// Display Thread
	//==============================
	initial begin // Start output thread
		forever
			begin
				case (opcode)
				0:  $display("%32b AND %32b = %32b, AND", bb8.cur[31:0], inputA, bb8.b);
				1:  $display("%32b  OR %32b = %32b, OR", bb8.cur[31:0], inputA, bb8.b);
				2:  $display("%32b XOR %32b = %32b, XOR", bb8.cur[31:0], inputA, bb8.b);
				3:  $display("%32b ==> %32b, NOT", bb8.cur[31:0], bb8.b);
				4:	$display("%32b  +  %32b = %32b, ADDITION", bb8.cur[31:0], inputA, bb8.b);
				5:	$display("%32b  -  %32b = %32b, SUBTRACTION", bb8.cur[31:0], inputA, bb8.b);
				6:	$display("%32b  *  %32b = %32b, MULTIPLICATION", bb8.cur[31:0], inputA, bb8.b);
				7:	$display("%32b  /  %32b = %32b, DIVISION", bb8.cur[31:0], inputA, bb8.b);
				8:	$display("%32b  %%  %32b = %32b, MODULUS", bb8.cur[31:0], inputA, bb8.b);
				9:	$display("%32b NAND %32b = %32b, NAND", bb8.cur[31:0], inputA, bb8.b);
				10:	$display("%32b NOR %32b = %32b, NOR", bb8.cur[31:0], inputA, bb8.b);
				11:	$display("%32b XNOR %32b = %32b, XNOR", bb8.cur[31:0], inputA, bb8.b);
				12: $display("%32b ==> %32b, NO-OP", bb8.cur[31:0], bb8.b);
				15: $display("%32b ==> %32b, RESET", 32'b00000000000000000000000000000000, bb8.b);
				endcase

				#10;
			end
	end

	//==============================
	//STIMULOUS Thread
	//==============================
	initial begin // start stimulous thread
		#6;
		//---------------------------------
		inputA=32'b00000000000000000000000000000000;
		opcode=4'b1100; // NO-OP
		#10; 
		//---------------------------------
		inputA=32'b00000000000000000000000000000000;
		opcode=4'b1111; // RESET
		#10;
		//---------------------------------	
		inputA=32'b00000000000000000001110001100100;
		opcode=4'b0100; //ADD
		#10;
		//---------------------------------	
		inputA=32'b00000000000000000000000000000111;
		opcode=4'b0101; // SUBTRACT
		#10;
		//---------------------------------	
		inputA=32'b00000000001000100000000000000001;
		opcode=4'b0100; // ADD
		#10;
		//---------------------------------	
		inputA=32'b00000100100000110000000110000000;
		opcode=4'b0110; // MULTIPLY
		#10;
		//---------------------------------	
		inputA=32'b11101111010001001000110100000000;
		opcode=4'b0000; // AND
		#10;
		//---------------------------------	
		inputA=32'b00000000000000000000000000000000;
		opcode=4'b1100; // NOOP
		#10;
		//---------------------------------	
		inputA=32'b00000000000000000000000000000000;
		opcode=4'b1111; // RESET
		#10;
		//---------------------------------	
		inputA=32'b11111111111111111111111111111111;
		opcode=4'b0100; // ADD
		#10;
		//---------------------------------	
		inputA=32'b00000000000000000000000000000000;
		opcode=4'b1100; // NOOP
		#10;
		//---------------------------------	
		inputA=32'b00000001001000000000000000001011;
		opcode=4'b0000; // AND
		#10;
		//---------------------------------	
		inputA=32'b00000001001000000000000000001011;
		opcode=4'b0011; // NOT
		#10;
		//---------------------------------	
		inputA=32'b00000001001000000000000000001011;
		opcode=4'b0111; // DIVIDE
		#10;
		//---------------------------------	
		inputA=32'b00000000000000000000000000000011;
		opcode=4'b1000; // MODULUS
		#10;
		//---------------------------------	
		inputA=32'b11111111111111111111111111111111;
		opcode=4'b1001; // NAND
		#10;
		//---------------------------------	
		inputA=32'b00000000000000000000000000000000;
		opcode=4'b1100; // NOOP
		//---------------------------------	
		#5;
		$display("Left in Ready State...OOPS!");
		#3;
		#50;
		//---------------------------------	
		inputA=32'b00000000000000000000000000000000;
		opcode=4'b1111; // Reset
		#10;
		//---------------------------------	
		inputA=32'b00;
		opcode=4'b1100; // NOOP
		#10;
		//---------------------------------	
		inputA=32'b0000000010000000001000110000001;
		opcode=4'b0100; // ADD
		#5;
		$display("Left in ADD State...OOPS!");
		#5;
		// Uh-oh...it was left in the ADD operation...its an addtion STATE!
		#50;
		//---------------------------------
		inputA=32'b00000000000000000000000000000000;
		opcode=4'b1111; // RESET
		#10;
		//---------------------------------
		inputA=32'b00100010001000111100001100110101;
		opcode=4'b0100; // ADD
		#10;
		//---------------------------------
		inputA=32'b00000000000010000000100000001010;
		opcode=4'b0001; // OR
		#10;
		//---------------------------------
		inputA=32'b00000000000000000000000000001111;
		opcode=4'b0010; // XOR
		#10;
		//---------------------------------
		inputA=32'b00010111010001011101100011010100;
		opcode=4'b1011; // XNOR
		#10;
		//---------------------------------
		inputA=32'b11110100000111010111010001001101;
		opcode=4'b1010; // NOR
		#10;
		//---------------------------------
		inputA=32'b00000000000000000000000000000000;
		opcode=4'b1111; // RESET
		#10;

		$finish;
	end
endmodule
