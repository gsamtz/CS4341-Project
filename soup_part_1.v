// Software discovery:
// Language: We are using Icarus/iVerilog
// Editor: We are using VSCode 
//----------------------------------------------------------------------
module Breadboard (w, x, y, z, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9);

input w, x, y, z;
output r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

reg r0, r1, r2, r3, r4, r5, r6, r7, r8, r9,
    minT_0, minT_1, minT_2, minT_3, minT_4, minT_5, 
    minT_6, minT_7, minT_8, minT_9, minT_A, minT_B, 
    minT_C, minT_D, minT_E, minT_F;

wire w, x, y, z;

always @ (w, x, y, z, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9) begin

    minT_0 = (~w & ~x & ~y & ~z);
    minT_1 = (~w & ~x & ~y & z);
    minT_2 = (~w & ~x & y & ~z);
    minT_3 = (~w & ~x & y & z);

    minT_4 = (~w & x & ~y & ~z);
    minT_5 = (~w & x & ~y & z);
    minT_6 = (~w & x & y & ~z);
    minT_7 = (~w & x & y & z);

    minT_8 = (w & ~x & ~y & ~z);
    minT_9 = (w & ~x & ~y & z);
    minT_A = (w & ~x & y & ~z);
    minT_B = (w & ~x & y & z);

    minT_C = (w & x & ~y & ~z);
    minT_D = (w & x & ~y & z);
    minT_E = (w & x & y & ~z);
    minT_F = (w & x & y & z);

    r0 = (minT_0 | minT_5 | minT_9 | minT_A | minT_B | minT_D | minT_E | minT_F);
    r1 = (minT_0 | minT_1 | minT_3 | minT_4 | minT_5 | minT_9 | minT_B | minT_D);
    r2 = (minT_1 | minT_2 | minT_4 | minT_B | minT_E);
    r3 = (minT_0 | minT_1 | minT_4 | minT_5 | minT_7 | minT_8 | minT_9 | minT_C | minT_D | minT_F);
    r4 = (minT_0 | minT_1 | minT_8 | minT_9 | minT_B | minT_C | minT_D);
    r5 = (minT_1 | minT_2 | minT_4 | minT_6 | minT_7 | minT_C | minT_E | minT_F);
    r6 = (minT_0 | minT_1 | minT_4 | minT_9 | minT_A | minT_B | minT_E);
    r7 = (minT_1 | minT_6 | minT_9 | minT_A | minT_F);
    r8 = (minT_1 | minT_3 | minT_4 | minT_6 | minT_7 | minT_9 | minT_C | minT_E);
    r9 = (minT_0 | minT_5 | minT_9 | minT_A | minT_B | minT_D | minT_E | minT_F);

end
endmodule

// Software discovery:
// Language: We are using Icarus/iVerilog
// Editor: We are using VSCode 
//----------------------------------------------------------------------
module testbench();

// inputs
reg [4:0] i;
reg w;
reg x;
reg y;
reg z;

// outputs
wire f0, f1, f2, f3, f4, f5, f6, f7, f8, f9;

Breadboard bb8(w, x, y, z, f0, f1, f2, f3, f4, f5, f6, f7, f8, f9);

initial begin
    $display ("| ## | W | X | Y | Z | F0 | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 |");
    $display ("|====+===+===+===+===+====+====+====+====+====+====+====+====+====+====+");

    for (i = 0; i < 16; i++) begin
        w = (i / 8) % 2; //High bit
		x = (i / 4) % 2;
		y = (i / 2) % 2;
		z = (i / 1) % 2; //Low bit	

        #20;

        $display ("|%4d|%3d|%3d|%3d|%3d| %3d| %3d| %3d| %3d| %3d| %3d| %3d| %3d| %3d| %3d|", 
                    i, w, x, y, z, f0, f1, f2, f3, f4, f5, f6, f7, f8, f9);

		if (i % 4 == 3) //Every fourth row of the table, put in a marker for easier reading.
		  $write ("|----+---+---+---+---+----+----+----+----+----+----+----+----+----+----+\n");
          
    end

    #20;
    $finish;

end
endmodule