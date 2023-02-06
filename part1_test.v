//----------------------------------------------------------------------
module Breadboard (w, x, y, z, r0, r1, r2, r3, r4, r5, r6, r7, r9, r8);

input w, x, y, z;
output r0, r1, r2, r4, r5, r7, r3, r6,r9, r8;
reg r0, r1, r2, r4, r5, r7, r3, r6,r9, r8;
wire w, x, y, z;

always @ (w, x, y, z, r0, r1, r2, r3, r4, r5, r6, r7, r9, r8) begin

r0 = (w & z | w & y | x & ~y & z | ~w & ~x & ~y & ~z);  // f0 of the bookwork
r1 = (~x & z | ~y & z | ~y & ~w);
r2 = (y | ~w) & (x | y | z) & (~x | ~z) & (x | z | ~w) & (w | ~y | ~z) & (w | ~x | ~y);
r4 = (w & ~y) | (w & z & ~x) | (~x & ~y);
r5 = (x & y) | (x & ~z) | (y & ~w & ~z) | (z & ~w & ~x & ~y);
r7 = (~x & ~y & z)|(~w & x & y & ~z)|(w & ~x & y & ~z)|(w & x &y & z); 
r3 = (~y | x & z);
r6 = (w | ~y) & (~x | ~z) & (y | z | ~w); 
r9 = (~w & ~x & ~y & ~z) | (~y & z & x) | (w & y & ~z) | (w & y & ~x) | (w & z & x) | (w & z & ~y);
r8 = (x & ~z) | (~w & y & z) | (~x & ~y & z);

end

endmodule

//----------------------------------------------------------------------
module testbench();

reg [4:0] i;
reg w;
reg x;
reg y;
reg z;

wire f0, f1, f2, f4, f5, f7, f3, f6, f9, f8;


Breadboard bb8(w, x, y, z, f0, f1, f2, f3, f4, f5, f6, f7, f9, f8);

initial begin
    $display ("| ## | W | X | Y | Z | F0 | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 |");
    $display ("|====+===+===+===+===+====+====+====+====+====+====+====+====+====+====+");

    for (i = 0; i < 16; i++) begin
        w = (i / 8) % 2; //High bit
		x = (i / 4) % 2;
		y = (i / 2) % 2;
		z = (i / 1) % 2; //Low bit	

        #20;

        $display ("|%4d|%3d|%3d|%3d|%3d| %3d| %3d| %3d| %3d| %3d| %3d| %3d| %3d| %3d| %3d|", i, w, x, y, z, f0, f1, f2, f3, f4, f5, f6, f7, f8, f9);
		if (i % 4 == 3) //Every fourth row of the table, put in a marker for easier reading.
		  $write ("|----+---+---+---+---+----+----+----+----+----+----+----+----+----+----+\n");//Write acts a bit like a java System.print
    end

    #20;
    $finish;
end

endmodule