// Universidad del Valle de Guatemala
// Valerie Valdez

//                         Electrónica digital
//                            Laboratorio 8

//Módulo
module testbench();

  reg [3:0]D, Q; // Input de la ALU
  reg [2:0]S; // Variable de selección
  wire [3:0]Y;// Salida de 4 bits

// Llamar al módulo
  ALU A3(D, Q, S, Y);

// Inicializar el módulo
  initial begin
  #30
  $display("\n");
  $display("  A L U  ");
  $display("\n");
  $display("|----------------|------|");
  $display("|  D    Q     S  |  Y   |");
  $display("|----------------|------|");
  $monitor("|%b  %b  %b | %b |", D, Q, S, Y);

// Funciones a realizar
  D = 4'b1010; Q = 4'b0011; S = 3'b000; //FUNCION  D AND Q
  #1 S = 3'b001; // Función D OR Q
  #1 S = 3'b010; // Función D ADD Q
  #1 S = 3'b010; // Función D ADD Q

  #1 S = 3'b011; //Colocar el valor previo

  #1 S = 3'b100; // Función D AND ~Q
  #1 S = 3'b101; // Función D OR ~Q
  #1 S = 3'b110; // Función D LESS Q
  #1 S = 3'b111; // Función STL
  #1 D = 4'b010; Q = 4'b0011; // Colocar todo en 0

  #2 $finish;
  end

//GTKwave
  initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, testbench);
      end

endmodule
