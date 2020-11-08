// Universidad del Valle de Guatemala
// Valerie Valdez

//                    Electrónica digital
//                     Laboratorio No. 10
//                       Ejercicio No. 2


// Testbench
module testbench();
  reg clk, reset, ENA, ENB, ENC;
  reg [2:0]S;
  reg [3:0]OPRND;
  wire [3:0]DATA;
  wire [3:0]SAL;
  wire [3:0]ALU_SAL;
  wire [3:0]ACCU;
  wire C, ZERO;


  // Reloj de una unidad de tiempo con cambio en el flanco
  always
    #1 clk = ~clk;

// Instanciación del módulo
operacional A1(clk, reset, ENA, ENB, ENC, S, OPRND, SAL, DATA, ALU_SAL, ACCU, C, ZERO);


initial begin
  #1
  $display("\n");
  $display(" Ejercicio No. 2 ");
  $display("\n");
  $display("----------------------------------|-----------------------------------|");
  $display("Clk reset ENA ENB ENC  S   OPRND  | SAL   DATA  SALIDA  ACCU  C  ZERO |");
  $display("----------------------------------|-----------------------------------|");
  $monitor(" %b     %b    %b   %b   %b  %b   %b  | %b   %b   %b   %b  %b   %b  |", clk, reset, ENA, ENB, ENC, S, OPRND, SAL, DATA, SAL, ACCU, C, ZERO);

#1 clk = 0; reset = 1; ENA = 1; ENB = 1; ENC = 1; S = 3'b000;
#2 reset = 0;
#2 OPRND = 4'b1010;
#2 S = 3'b010;
#2 S = 3'b001;
#2 S = 3'b011;
#2 S = 3'b100; ENC = 0; OPRND = 4'B1111;
#2 S = 3'b010;
#2 ENC = 1;
#2 S = 3'b000;
#2 ENB = 0; OPRND = 4'b0001;
#2 S = 3'b010;
#2 ENB = 1;

end

initial
  #30 $finish;

// GTK wave
initial begin
  $dumpfile("Ejercicio_2_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
