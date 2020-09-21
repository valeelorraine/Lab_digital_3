// Universidad del Valle de Guatemala
// Valerie Valdez (19659)
// Electrónica digital

// ------------------------- Laboratorio No. 6 --------------------------------

// Testbench

module Testbench();
  reg clk, reset, reset1, set;
  reg [3:0]C;
  reg A, B, P;
  wire S0, S1, S2, S00, S11, S22;
  wire [3:0]D;
  wire Y;
  wire Y0, Y1, Y2;

// Reloj de una unidad de tiempo con cambio en el flanco
always
  begin
    clk <= 1; #1 clk <= ~clk; #1;
end

FFD U(clk, reset, set, C, D);
MF U1(A, B, clk, reset, Y);
MF1 U2(P, clk, reset1, Y0, Y1, Y2);

// Prueba para el Flip Flop tipo D de 4 bits
initial begin
  #1
  $display("\n");
  $display(" FLIP FLOP D de 4 bits ");
  $display("\n");
  $display("C1  R  S  C  | D");
  $display("------------|---");
  $monitor("%b %b %b %b  | %b", clk, reset, set, C, D[3:0]);

    set = 1;

  #5 C[0] = 0; C[1] = 0; C[2] = 0; C[3] = 0; set = 0; reset = 1;
  #5 C[0] = 0; C[1] = 0; C[2] = 1; C[3] = 0; reset = 0;
  #5 C[0] = 0; C[1] = 1; C[2] = 0; C[3] = 1; reset = 0;
  #5 C[0] = 0; C[1] = 0; C[2] = 1; C[3] = 1; reset = 0;

end


initial begin
  #25
  $display("\n");
  $display("Maquina de estados finitos Ej01");
  $display("\n");
  $display(" A B | Y");
  $display("-----|---");
  $monitor("%b %b | %b ", A, B, Y);

      A = 0; B = 0;
   #2 A = 1; B = 0;
   #2 A = 1; B = 1;
   #2 A = 1; B = 1;
   #2 A = 1; B = 1;
   #2 A = 0; B = 0;
   #2 A = 1; B = 0;
   #2 A = 0; B = 0;

 end

initial begin
  #40
      reset1 = 1;
  #1  reset1 = 0;
  $display("\n");
  $display(" Maquina de estados finitos Ej03");
  $display("\n");
  $display("P | Y0 Y1 Y2");
  $display("--|---------");
  $monitor("%b | %b %b %b ", P, Y0, Y1, Y2);
      P = 1;
   #2 P = 1;
   #2 P = 1;
   #2 P = 1;
   #2 P = 0;
   #2 P = 1;
   #2 P = 1;
   #2 P = 1;
   #2 P = 1;
   #2 P = 1;
   #2 P = 1;
   #2 P = 0;
   #2 P = 0;
   #2 P = 0;
   #2 P = 0;

  end

  initial
    #70 $finish;

// GTK wave
  initial begin
    $dumpfile("Lab06_tb.vcd");
    $dumpvars(0, Testbench);
  end
endmodule
