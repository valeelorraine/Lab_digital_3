// Electrónica digital
// Valerie Valdez 19659

//                             Laboratorio #09
//                              Ejercicio 05

// Testbench

module testbench();

  reg EN;
  reg [6:0]entori;
  wire [12:0]shuppatsu;

  // Instanciar el módulo
  MROM A1(EN, entori, shuppatsu);

  initial begin
    #1
    $display("\n");
    $display("Memoria ROM");
    $display("\n");
    $display("---------------|-----------------|");
    $display(" EN    entori   |   shuppatsu     |");
    $display("---------------|-----------------|");
    $monitor("%b   %b    |  %b  |", EN, entori, shuppatsu);

    #1 EN = 0; entori = 7'b0000000;
    #1 EN = 1;
    #3 entori = 7'bxxxxxx0;
    #3 entori = 7'b00001x1;
    #3 entori = 7'b00000x1;
    #3 entori = 7'b00011x1;
    #3 entori = 7'b00010x1;
    #3 entori = 7'b0010xx1;
    #3 entori = 7'b0011xx1;
    #3 entori = 7'b0100xx1;
    #3 entori = 7'b0101xx1;
    #3 entori = 7'b0110xx1;
    #3 entori = 7'b0111xx1;
    #3 entori = 7'b1000x11;
    #3 entori = 7'b1000x01;
    #3 entori = 7'b1001x11;
    #3 entori = 7'b1001x01;
    #3 entori = 7'b1010xx1;
    #3 entori = 7'b1011xx1;
    #3 entori = 7'b1100xx1;
    #3 entori = 7'b1101xx1;
    #3 entori = 7'b1110xx1;
    #3 entori = 7'b1111xx1;

    end

    initial
      #69 $finish;

  // GTKwave para el diagrama de timing
  initial begin
  $dumpfile("Ejercicio_5_tb.vcd");
  $dumpvars(0, testbench);
  end
  endmodule
