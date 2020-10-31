// Electrónica digital
// Valerie Valdez 19659

//                             Laboratorio #09
//                              Ejercicio 04

// Testbench Buffer triestado

module testbench();
  reg EN;
  reg [3:0]S;
  wire [3:0]Q;

// Instanciar el módulo
  BT A1(EN, S, Q);

// Inicialización de la prueba del Buffer
  initial begin
    #1
    $display("\n");
    $display("Buffer triestado de 4 bits");
    $display("\n");
    $display("------------|--------|");
    $display(" EN   S      |   Q    |");
    $display("------------|--------|");
    $monitor("%b   %b    |  %b  |", EN, S, Q);

    #1 EN = 0; S = 4'b0000;
    #5 EN = 1;
    #5 S = 4'b1111;
    #5 EN = 0;

    end

    initial
      #25 $finish;

  // GTKwave para el diagrama de timing
  initial begin
    $dumpfile("Ejercicio_4_tb.vcd");
    $dumpvars(0, testbench);
  end
endmodule
