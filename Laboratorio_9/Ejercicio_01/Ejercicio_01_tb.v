// Electrónica digital
// Valerie Valdez 19659

//                             Laboratorio #09
//                              Ejercicio 01

//Testbench para los Flip Flop

module testbench();

  //inputs
  reg clk, EN, reset, reset1, reset2;
  reg C;
  reg [1:0]C1;
  reg [3:0]C2;

  //outputs
  wire D;
  wire [1:0]D1;
  wire [3:0]D2;


// Clock
  always
    #1 clk = ~clk;


// Llamar a los módulos
  FFD A1(clk, EN, reset, C, D); // Flitidiflop 1 bit
  FFD2 B1(clk, EN, reset1, C1, D1); // Flitidiflop 2 bits
  FFD4 R1(clk, EN, reset2, C2, D2); // Flitidiflop 4 bits


  initial begin
    #1
    $display("\n");
    $display("Flip Flop de 1 bit");
    $display("\n");
    $display("-------------------|-----|");
    $display(" clk  EN  reset  C  |  D  |");
    $display("-------------------|-----|");
    $monitor("%b    %b    %b    %b   |  %b  |", clk, EN, reset, C, D);

    #1 clk = 0; reset = 0; EN = 1; C = 0;
    #5 reset = 1; EN = 1; C = 0;
    #5 reset = 0; EN = 1; C = 0;
    #5 C = 1;
    #5 C = 0;
    #5 EN = 0;
    #5 C = 1;

  end


// Prueba del FFD de dos bits
  initial begin
    #34
    $display("\n");
    $display("Flip Flop de 2 bit");
    $display("\n");
    $display("-------------------|-----|");
    $display(" clk  EN  reset  C  |  D  |");
    $display("-------------------|-----|");
    $monitor("%b    %b    %b    %b  | %b  |", clk, EN, reset1, C1, D1);

    #1 clk = 0; reset1 = 0; EN = 0; C1 = 2'b00;
    #5 reset1 = 1; EN = 1; C1 = 2'b00;
    #5 reset1 = 0; EN = 1; C1 = 2'b00;
    #5 C1 = 2'b11;
    #5 C1 = 2'b00;
    #5 EN = 0;
    #5 C1 = 2'b11;

  end


// Prueba del FFD de 4 bits
initial begin
  #70
  $display("\n");
  $display("Flip Flop de 4 bit");
  $display("\n");
  $display("---------------------|-------|");
  $display(" clk  EN  reset   C   |   D   |");
  $display("---------------------|-------|");
  $monitor("%b    %b    %b    %b  | %b  | ", clk, EN, reset2, C2, D2);

  #1 clk = 0; reset2 = 1; EN = 1; C2 = 4'b0000;
  #5 reset2 = 0; EN = 1; C2 = 4'b0000;
  #5 reset2 = 0; EN = 1; C2 = 4'b0000;
  #5 C2 = 4'b1111;
  #5 C2 = 4'b0000;
  #5 EN = 0;
  #5 C2 = 4'b1111;

end


  initial
    #110 $finish;

// GTKwave para el diagrama de timing
  initial begin
    $dumpfile("Ejercicio_01_tb.vcd");
    $dumpvars(0, testbench);
  end
endmodule
