/// Universidad del Valle de Guatemala
// Valerie Valde (19659)

//                      Electrónica digital
//                         Laboratorio 10
//                         Ejercicio No. 1


// Testbench del circuito mostrado en el diagrama

module testbench();
  reg clk, reset, ENPC, ENF, blo;
  reg [11:0]load;
  wire [7:0]P_B;
  wire[3:0]instr;
  wire [3:0]oprnd;


  // Reloj de una unidad de tiempo con cambio en el flanco
  always
      #1 clk = ~clk;

  // Iteración del módulo
  integrador U(clk, reset, ENPC, ENF, blo, load, P_B, instr, oprnd);


  // Prueba para el Flip Flop tipo D de 8 bits
  initial begin
    #1
    $display("\n");
    $display(" Programa ");
    $display("\n");
    $display("-----------------------------|--------------------------|");
    $display("Clk reset ENPC ENF blo load  |   P_B     instr    oprnd |");
    $display("-----------------------------|--------------------------|");
    $monitor("%b  %b  %b  %b  %b  %b  | %b   %b    %b  |", clk, reset, ENPC, ENF, blo, load, P_B, instr, oprnd);

    clk = 0; reset = 1; ENF = 0; ENPC = 0; blo = 0; load = 12'b000000000000;
    #2 reset = 0; ENF = 1; ENPC = 1; blo = 0;
    #2 reset = 0; ENF = 1; ENPC = 1; blo = 0;
    #2 reset = 0; load = 12'b000000000100;
    #2 reset = 0; ENF = 1; ENPC = 1; blo = 1;
    #3 reset = 0; ENF = 0; ENPC = 0; blo = 0;

  end


  initial
    #35 $finish;

// GTK wave
  initial begin
    $dumpfile("Lab10_tb.vcd");
    $dumpvars(0, testbench);
  end
endmodule
