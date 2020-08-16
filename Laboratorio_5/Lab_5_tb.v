// Electrónica digital
// Laboratorio 5
//----------------------------Valerie Valdez------------------------------------

module testbench();

reg v1, v2, v3;
wire led1, led2, led3, led4, led5, led6;
wire V;
wire G;
assign V = 1;
assign G = 0;

TABLA_1_MUX2 G1(v1,v2,v3, led1);
TABLA_1_MUX4 G2(v1,v2,v3, led2);
TABLA_1_MUX8 G3(v1,v2,v3,V,G, led3);
TABLA_2_MUX2 G4(v1,v2,v3, led4);
TABLA_2_MUX4 G5(v1,v2,v3,V,G, led5);
TABLA_2_MUX8 G6(v1,v2,v3,V,G, led6);

initial begin
  $display("\n");
  $display("TABLA 1, MUX 2:1");
  $display("\n");
  $display("A B C | Y");
  $display("------|--");
  $monitor("%b %b %b | %b", v1,v2,v3, led1);

      v1 = 0; v2 = 0; v3 = 0;
      #1 v1 = 0; v2 = 0; v3 = 1;
      #1 v1 = 0; v2 = 1; v3 = 0;
      #1 v1 = 0; v2 = 1; v3 = 1;
      #1 v1 = 1; v2 = 0; v3 = 0;
      #1 v1 = 1; v2 = 0; v3 = 1;
      #1 v1 = 1; v2 = 1; v3 = 0;
      #1 v1 = 1; v2 = 1; v3 = 1;

end


initial begin
  #8
  $display("\n");
  $display("TABLA 1, MUX 4:1");
  $display("\n");
  $display("A B C | Y");
  $display("------|--");
  $monitor("%b %b %b | %b", v1,v2,v3, led2);

      v1 = 0; v2 = 0; v3 = 0;
      #1 v1 = 0; v2 = 0; v3 = 1;
      #1 v1 = 0; v2 = 1; v3 = 0;
      #1 v1 = 0; v2 = 1; v3 = 1;
      #1 v1 = 1; v2 = 0; v3 = 0;
      #1 v1 = 1; v2 = 0; v3 = 1;
      #1 v1 = 1; v2 = 1; v3 = 0;
      #1 v1 = 1; v2 = 1; v3 = 1;

end


initial begin
  #16
  $display("\n");
  $display("TABLA 1, MUX 8:1");
  $display("\n");
  $display("A B C | Y");
  $display("------|--");
  $monitor("%b %b %b | %b", v1,v2,v3, led3);

      v1 = 0; v2 = 0; v3 = 0;
      #1 v1 = 0; v2 = 0; v3 = 1;
      #1 v1 = 0; v2 = 1; v3 = 0;
      #1 v1 = 0; v2 = 1; v3 = 1;
      #1 v1 = 1; v2 = 0; v3 = 0;
      #1 v1 = 1; v2 = 0; v3 = 1;
      #1 v1 = 1; v2 = 1; v3 = 0;
      #1 v1 = 1; v2 = 1; v3 = 1;

end



initial begin
  #24
  $display("\n");
  $display("TABLA 2, MUX 2:1");
  $display("\n");
  $display("A B C | Y");
  $display("------|--");
  $monitor("%b %b %b | %b", v1,v2,v3, led4);

      v1 = 0; v2 = 0; v3 = 0;
      #1 v1 = 0; v2 = 0; v3 = 1;
      #1 v1 = 0; v2 = 1; v3 = 0;
      #1 v1 = 0; v2 = 1; v3 = 1;
      #1 v1 = 1; v2 = 0; v3 = 0;
      #1 v1 = 1; v2 = 0; v3 = 1;
      #1 v1 = 1; v2 = 1; v3 = 0;
      #1 v1 = 1; v2 = 1; v3 = 1;

end


initial begin
  #32
  $display("\n");
  $display("TABLA 2, MUX 4:1");
  $display("\n");
  $display("A B C | Y");
  $display("------|--");
  $monitor("%b %b %b | %b", v1,v2,v3, led5);

      v1 = 0; v2 = 0; v3 = 0;
      #1 v1 = 0; v2 = 0; v3 = 1;
      #1 v1 = 0; v2 = 1; v3 = 0;
      #1 v1 = 0; v2 = 1; v3 = 1;
      #1 v1 = 1; v2 = 0; v3 = 0;
      #1 v1 = 1; v2 = 0; v3 = 1;
      #1 v1 = 1; v2 = 1; v3 = 0;
      #1 v1 = 1; v2 = 1; v3 = 1;

end


initial begin
  #40
  $display("\n");
  $display("TABLA 2, MUX 8:1");
  $display("\n");
  $display("A B C | Y");
  $display("------|--");
  $monitor("%b %b %b | %b", v1,v2,v3, led6);

      v1 = 0; v2 = 0; v3 = 0;
      #1 v1 = 0; v2 = 0; v3 = 1;
      #1 v1 = 0; v2 = 1; v3 = 0;
      #1 v1 = 0; v2 = 1; v3 = 1;
      #1 v1 = 1; v2 = 0; v3 = 0;
      #1 v1 = 1; v2 = 0; v3 = 1;
      #1 v1 = 1; v2 = 1; v3 = 0;
      #1 v1 = 1; v2 = 1; v3 = 1;

end



initial
  #71 $finish;

initial begin
  $dumpfile("Lab_5_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule
