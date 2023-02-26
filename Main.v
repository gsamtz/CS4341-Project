//=================================================================
//
//AND (32 bit AND) {NO NEED TO CHANGE}
//
//=================================================================
module AND(a, b, c);
    input [31:0] a, b;
    output [31:0] c;

    assign c = a & b;
endmodule

module OR(a, b, c);
    input [31:0] a, b;
    output [31:0] c;

    assign c = a | b;
endmodule

module XOR(a,b,c);
	input [31:0] a,b;
	output [31:0] c;

	assign c= a ^ b;
endmodule

module NOT(a,c);
	input [31:0] a;
	output [31:0] c;

	assign c= ~a;
endmodule

module NAND(a,b,c);
	input [31:0] a,b;
	output [31:0] c;

	assign c= a ~& b;
endmodule

module NOR(a,b,c);
	input [31:0] a,b;
	output [31:0] c;

	assign c= a ~| b;
endmodule

module XNOR(a,b,c);
	input [31:0] a,b;
	output [31:0] c;

	assign c= a ~^ b;
endmodule

module NOOP(a,c);
	input [31:0] a;
	output [31:0] c;

	assign c= ~(~a);
endmodule
//=================================================================
//
//Decoder {NO NEED TO CHANGE}
//
//=================================================================
module Dec4x16(binary, onehot);

	input [3:0] binary;
	output [15:0]onehot;

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


//=================================================================
//
//Full Adder {NO NEED TO CHANGE}
//
//=================================================================
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


//=================================================================
//
//Add/Subtract {DEFINITELY NEED TO CHANGE}
//
//=================================================================
module ThirtyTwoBitAddSub(inputA, inputB, mode, sum, carry, overflow);
// Parameters
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

	assign c0=mode; //Mode=0, Addition; Mode=1, Subtraction

	//        WIRE     WIRE     WIRE
    assign b0 = inputB[0] ^ mode;//Flip the Bit if Subtraction
    assign b1 = inputB[1] ^ mode;//Flip the Bit if Subtraction
    assign b2 = inputB[2] ^ mode;//Flip the Bit if Subtraction
    assign b3 = inputB[3] ^ mode;//Flip the Bit if Subtraction
	assign b4 = inputB[4] ^ mode;//Flip the Bit if Subtraction
	assign b5 = inputB[5] ^ mode;//Flip the Bit if Subtraction
	assign b6 = inputB[6] ^ mode;//Flip the Bit if Subtraction
	assign b7 = inputB[7] ^ mode;//Flip the Bit if Subtraction

	assign b8 	= inputB[8]  ^ mode;//Flip the Bit if Subtraction
	assign b9 	= inputB[9]  ^ mode;//Flip the Bit if Subtraction
	assign b10 	= inputB[10] ^ mode;//Flip the Bit if Subtraction
	assign b11 	= inputB[11] ^ mode;//Flip the Bit if Subtraction
	assign b12 	= inputB[12] ^ mode;//Flip the Bit if Subtraction
	assign b13 	= inputB[13] ^ mode;//Flip the Bit if Subtraction
	assign b14 	= inputB[14] ^ mode;//Flip the Bit if Subtraction
	assign b15 	= inputB[15] ^ mode;//Flip the Bit if Subtraction

	assign b16 	= inputB[16] ^ mode;//Flip the Bit if Subtraction
	assign b17 	= inputB[17] ^ mode;//Flip the Bit if Subtraction
	assign b18 	= inputB[18] ^ mode;//Flip the Bit if Subtraction
	assign b19 	= inputB[19] ^ mode;//Flip the Bit if Subtraction
	assign b20 	= inputB[20] ^ mode;//Flip the Bit if Subtraction
	assign b21 	= inputB[21] ^ mode;//Flip the Bit if Subtraction
	assign b22 	= inputB[22] ^ mode;//Flip the Bit if Subtraction
	assign b23 	= inputB[23] ^ mode;//Flip the Bit if Subtraction

	assign b24	= inputB[24] ^ mode;//Flip the Bit if Subtraction
	assign b25	= inputB[25] ^ mode;//Flip the Bit if Subtraction
	assign b26 	= inputB[26] ^ mode;//Flip the Bit if Subtraction
	assign b27 	= inputB[27] ^ mode;//Flip the Bit if Subtraction
	assign b28 	= inputB[28] ^ mode;//Flip the Bit if Subtraction
	assign b29 	= inputB[29] ^ mode;//Flip the Bit if Subtraction
	assign b30 	= inputB[30] ^ mode;//Flip the Bit if Subtraction
	assign b31 	= inputB[31] ^ mode;//Flip the Bit if Subtraction


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



//=================================================================
//
//BehavioralDivision {DEFINITELY NEED TO CHANGE}
//
//=================================================================
module BehavioralDivision (dividend, divisor, quotient, remainder, error);
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



//=================================================================
//
//StructMux4 {DEFINITELY NEED TO CHANGE}
//
//=================================================================
module StructMux4(channels, select, b);
	parameter chansize=32; // {32} changed from 16 to 32.
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



//=================================================================
//
//StructMux2 {DEFINITELY NEED TO CHANGE}
//
//=================================================================
module StructMux2(channels, select, b);
parameter chansize=2;
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


//=================================================================
//
//Breadboard
//
//=================================================================
module breadboard(A,B,C,opcode,error);
//=======================================================
//
// Parameter Definitions
//
//========================================================
input [31:0] A; // {32} Changed from 15 to support 32 bits
input [31:0] B;
input [3:0] opcode;

output [31:0] C;
output [1:0]error;

wire [31:0] A;
wire [31:0] B;
wire [3:0] opcode;

// reg  [3:0] C;
reg  [31:0] C;
reg  [1:0] error;


//----------------------------------


//=======================================================
//
// CONTROL
//
//========================================================
wire [15:0] select;
Dec4x16 dec1(opcode,select);



wire [15:0][ 31:0] channels; // {32} changed from [15:0] to [31:0] for 32 bit support
wire       [ 31:0] b; 		 // {32} changed from [15:0] to [31:0] for 32 bit support
wire       [ 31:0] unknown;  // {32} changed from [3:0] to [31:0] bc these are probs. the AND, NOR, OR, XOR, etc.

wire [15:0][ 1:0]  chErr;
wire       [ 1:0]   bErr;
wire       [ 1:0] unkErr;

//=======================================================
//
// INTERFACES
//
//=======================================================

//----------
// AND
//----------
wire [31:0] outputAND;
wire [31:0] outputOR;
wire[31:0] outputXOR;
wire[31:0] outputNOT;
wire[31:0] outputNAND;
wire[31:0] outputNOR;
wire[31:0] outputXNOR;
wire[31:0] outputNOOP;

//----------
// ADDITION
//----------
wire [31:0] outputADDSUB; // {32} changed from 16 to support 32 bits
wire ADDerror;
wire Carry;

//------------
// SUBTRACTION
//------------
reg modeSUB;

//----------------
//DIVISION/MODULUS
//----------------
wire [31:0] outputQuotient; // {32} changed from 16 to support 32 bits
wire [31:0] outputRemainder; // {32} changed from 16 to support 32 bits
wire DIVerror;



//=======================================================
//
// Error Reporting
//
//=======================================================
reg errHigh;
reg errLow;

//=======================================================
//
// Connect the MUX to the OpCodes
//
// Channel 0, Opcode 0000, AND ((NEW ADDITION TO THE LIST))
// Channel 1, Opcode 0001, OR
// Channel 2, Opcode 0010, XOR
// Channel 3, Opcode 0011, NOT
// Channel 4, Opcode 0100, Addition
// Channel 5, Opcode 0101, Subtraction
// Channel 6, Opcode 0110, Mulitplication
// Channel 7, Opcode 0111, Division (Behavioral)
// Channel 8, Opcode 1000, Modulus (Behavioral)
// Channel 9, Opcode 1001, NAND
// Channel 10, Opcode 1010, NOR
// Channel 11, Opcode 1011, XNOR
// Channel 12, Opcode 1100, NOOP
//
//=======================================================
assign channels[ 0]=outputAND; // (before) -> assign channels[ 0]=unknown;
assign channels[ 1]=outputOR;
assign channels[ 2]=outputXOR; //map xor
assign channels[ 3]=outputNOT; //map not
assign channels[ 4]=outputADDSUB;
assign channels[ 5]=outputADDSUB;
assign channels[ 6]=unknown;
assign channels[ 7]=outputQuotient;
assign channels[ 8]=outputRemainder;
assign channels[ 9]=outputNAND;
assign channels[10]=outputNOR;
assign channels[11]=outputXNOR;
assign channels[12]=outputNOOP;
assign channels[13]=unknown;
assign channels[14]=unknown;
assign channels[15]=unknown;

assign chErr[ 0]=unkErr;
assign chErr[ 1]=unkErr;
assign chErr[ 2]=unkErr;
assign chErr[ 3]=unkErr;
assign chErr[ 4]={1'b0,errLow};
assign chErr[ 5]={1'b0,errLow};
assign chErr[ 6]=unkErr;
assign chErr[ 7]={errHigh,1'b0};
assign chErr[ 8]={errHigh,1'b0};
assign chErr[ 9]=unkErr;
assign chErr[10]=unkErr;
assign chErr[12]=unkErr;
assign chErr[11]=unkErr;
assign chErr[13]=unkErr;
assign chErr[14]=unkErr;
assign chErr[15]=unkErr;



//===========================================================
//
// INSTANTIATE MODULES
//
//===========================================================
// If you're reading this you'll probs have to create an output wire here in the breadboard
// for every new module that is added. For ex, I created "wire [31:0] outputAND" here to match
// "output [31:0] c" in the original AND module so that the output could be mapped back here
AND and1(B, A, outputAND); // ADDED THIS MODULE INSTANCE TO TEST IT OUT (IT WORKS!)
OR or1(B, A, outputOR);
XOR xor1(B, A, outputXOR);
NOT not1(A, outputNOT);
NAND nand1(B, A, outputNAND);
NOR nor1(B, A, outputNOR);
XNOR xnor1(B, A, outputXNOR);
NOOP noop1(A, outputNOOP);
ThirtyTwoBitAddSub add1(B, A, modeSUB, outputADDSUB, Carry, ADDerror);
BehavioralDivision div1(B, A, outputQuotient, outputRemainder, DIVerror);
StructMux4 muxOps(channels, select, b);
StructMux2 muxErr(chErr, select, bErr);


//====================================================
//
//Perform the gate-level operations in the Breadboard
//
//====================================================
always@(*)
begin

  //Check for Subtraction Mode
  modeSUB=~opcode[3]& opcode[2]&~opcode[1]& opcode[0];	// 0101, Channel 5

  // Set output of Operations to C
  C=b; //Just a jumper
  errHigh=DIVerror;
  errLow=ADDerror;

  // Set Errors of Operations to Error
  error=bErr;

end

endmodule


//====================================================
//
//TEST BENCH
//
//====================================================
module testbench();

//====================================================
//
//Local Variables
//
//====================================================
	reg  [3:0] opcode;
	reg  [31:0] inputB; // {32} changed from 32 to support 32 bits
	reg  [31:0] inputA; // {32} changed from 32 to support 32 bits
	wire [31:0] outputC; // {32} changed from 32 to support 32 bits

	wire [1:0] error;

//====================================================
//
// Create Breadboard
//
//====================================================
	breadboard bb8(inputA, inputB, outputC, opcode, error);

//====================================================
//
// STIMULOUS
//
//====================================================
	initial begin// Start Stimulous Thread
	#2;

	// VALUES USED:
	// A = 1212172352, In binary: 01001000010000000100100001000000
	// B =  138412306, In binary: 00001000010000000000000100010010
	//---------------------------------
	$write("[   B]");
	$write("                            [   A]");
	$write("                            [  OP]");
	$write("[   C]");
	$write("                            [ E]");
	$display(";");
	//---------------------------------
	// Expected output: 01010000100000000100100101010010
	inputB=32'b01001000010000000100100001000000; // {32} changed to support 32 bits
	inputA=32'b00001000010000000000000100010010; // {32} changed to support 32 bits
	opcode=4'b0100; //ADD
	#10;
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":Addition");
	$display(";");
	//---------------------------------
	// Expected output: 01000000000000000100011100101110
	inputB=32'b01001000010000000100100001000000;
	inputA=32'b00001000010000000000000100010010;
	opcode=4'b0101; //SUB
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":Subtraction");
	$display(";");
	//---------------------------------
	// Expected output: 00000000000000000000000000001101 (Some online tools truncate leading zeros)
	inputB=32'b00111000010000000100100001000000;
	inputA=32'b00000100001001100010010000100101;
	opcode=4'b0111; //DIV
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":Division");
	$display(";");
	//---------------------------------
	// Expected output: 00000010010100000111001001011111
	inputB=32'b00111000010000000100100001000000;
	inputA=32'b00000100001001100010010000100101;
	opcode=4'b1000; //MOD
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":Modulus");
	$display(";");
	//---------------------------------
	// Expected output: 011011100011001100110110001100101 <-- Result has 33 bits, hence the error
	inputB=32'b01111000010000000100100001000000;
	inputA=32'b01100100001001100010010000100101;
	opcode=4'b0100; //Addition with Error -- OVERFLOW ERROR
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":Addition with Error");
	$display(";");
	//---------------------------------
	inputB=32'b10000000000000000000000000000000;
	inputA=32'b01111000010000000100100001000000;
	opcode=4'b0101; //Subtraction with Error -- OVERFLOW ERROR
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":Subtraction with Error");
	$display(";");
	//---------------------------------
	// Expected output: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	inputB=32'b00001011100000000000000000000000;
	inputA=32'b00000000000000000000000000000000;
	opcode=4'b0111; //Division with Error -- (DIVIDE BY ZERO ERROR)
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":Division with Error");
	$display(";");
	//---------------------------------
	// Expected output: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	inputB=32'b0100;
	inputA=32'b0000;
	opcode=4'b1000; //Modulus with Error -- Mod by 0 is undefined
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":Modulus with Error");
	$display(";");
	//---------------------------------
	// Expected output: 00001000010000000000000001010000
	inputB=32'b01001000010000000100100001010000;
	inputA=32'b00001000010000000000000101010010;
	//         00001000010000000000000001010000
	opcode=4'b0000; // <-- If you look at the breadboard where channels are mapped you'll see how I mapped the AND to channel 0000
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":AND two Integers");
	$display(";");

	//---------------------------------
	// Expected output: 01001000010000000100100101010010
	inputB=32'b01001000010000000100100001010000;
	inputA=32'b00001000010000000000000101010010;
	//         00001000010000000000000001010000
	opcode=4'b0001;
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":OR two Integers");
	$display(";");

	//---------------------------------
	// Expected output: 01001000010000000100100101010010
	inputB=32'b01001000010000000100100001010000;
	inputA=32'b00001000010000000000000101010010;
	//         00001000010000000000000001010000
	opcode=4'b0010;
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":XOR two Integers");
	$display(";");

	//---------------------------------
	// Expected output: 01001000010000000100100101010010
	inputB=32'b01001000010000000100100001010000;
	inputA=32'b00001000010000000000000101010010;
	//         00001000010000000000000001010000
	opcode=4'b0011;
	#10
	//$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":Negate One Integer");
	$display(";");

	//---------------------------------
	// Expected output: 01001000010000000100100101010010
	inputB=32'b01001000010000000100100001010000;
	inputA=32'b00001000010000000000000101010010;
	//         00001000010000000000000001010000
	opcode=4'b1001;
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":NAND two Integers");
	$display(";");

	//---------------------------------
	// Expected output: 01001000010000000100100101010010
	inputB=32'b01001000010000000100100001010000;
	inputA=32'b00001000010000000000000101010010;
	//         00001000010000000000000001010000
	opcode=4'b1010;
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":NOR two Integers");
	$display(";");

	//---------------------------------
	// Expected output: 01001000010000000100100101010010
	inputB=32'b01001000010000000100100001010000;
	inputA=32'b00001000010000000000000101010010;
	//         00001000010000000000000001010000
	opcode=4'b1011;
	#10
	$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":XNOR two Integers");
	$display(";");

//---------------------------------

	opcode=4'b1100;
	#12
	//$write("[%32b]",inputB);
 	$write("[%32b]",inputA);
 	$write("[%4b]",opcode);
 	$write("[%32b]",outputC);
 	$write("[%2b]",error);
	$write(":No Op an integer");
	$display(";");

	$finish;
	end

endmodule