// Universidad del Valle de Guatemala
// Valerie Valdez


//                      Electrónica digital
//                         Laboratorio 10
//                         Ejercicio No. 2


// Flip Flop 4 bits tipo D de 4 bits con reset síncrono y asíncrono
module FFD4(input wire clk, reset, EN,
  input wire [3:0]C,
  output reg [3:0]D);

// Con always una sección del código estará siempre activado
  always @ (posedge clk, posedge reset) begin // Count on the rising edge of the clk

      if(reset) begin // En caso de reset colocar todas las salidas en 0
        D <= 4'b0;
      end

      else if (EN) begin // Entrada igual a la salida
        D <= C;
      end
  end
endmodule


// Flip Flop tipo D de 8 bits
module FETCH(input wire clk, reset, EN, input wire [7:0]D, output wire[3:0]instr, oprnd);

  FFD4 A1(clk, reset, EN, D[7:4], instr); // bits más significativos
  FFD4 B1(clk, reset, EN, D[3:0], oprnd); // bits menos significativos
endmodule



// Implementar un contador de 12 bits con un enable y capaz de hacer un load
module contador(input wire clk, rst, EN, blo,
  input wire [11:0]load,
  output reg [11:0]val);


// Non-blocking assigment
    always @(posedge clk or posedge rst or posedge blo) begin

      if(rst == 1) // Colocar todos los valores en 0
        val <= 12'b0;

      else if(EN == 1) //Enabled encendido cuenta en cada flanco de reloj
        val <= val + 1;

      else if(blo == 1) // Blo encendido entonces Load comienza a contar
        val <= load;

        end
endmodule


// Implementación de la memoria ROM de 4Kx8
module Mrom(input wire [11:0]address,
  output wire [7:0]D); // Tamaño del dato de 8 bits

  reg[7:0] Mrom[0:4095]; // Ancho y localidades de memoria


// Inicializar la memoria
  initial begin
    $readmemb("Mrom.list", Mrom); // Leer los valores de la lista en binario
  end

  assign D = Mrom[address]; // Asignarle el valor en la dirección dada
endmodule



// Integrando todo
module integrador(input wire clk, reset, ENPC, ENF, blo, input wire [11:0]load, output wire [7:0]P_B, output wire [3:0]instr, output wire [3:0]oprnd);
  wire [11:0]PC;
  contador C1(clk, reset, ENPC, blo, load, PC);
  Mrom C2(PC, P_B);
  FETCH C3(clk, reset, ENF, P_B, instr, oprnd);

endmodule
