// Universidad del Valle de Guatemala
// Valerie Valdez

//                    Electrónica digital
//                     Laboratorio No. 10
//                       Ejercicio No. 2


// Módulo acumulador: Flip Flop tipo D de 4 bits
module ACCUMULATOR(input wire clk, reset, EN,
  input wire [3:0]ALU,
  output reg [3:0]ACCU);

// Con always una sección del código estará siempre activado
  always @ (posedge clk, posedge reset) begin // Count on the rising edge of the clk

      if(reset) begin // En caso de reset colocar todas las salidas en 0
        ACCU <= 4'b0;
      end

      else if (EN) begin // Entrada igual a la salida
        ACCU <= ALU;
      end
  end
endmodule



// Módulo Buffer triestado
module BT(input wire EN,
  input wire [3:0]I,
  output wire [3:0]Y); // Salida de 4 bits del buffer

  assign Y = (EN) ? I : 4'bz; // Cuando EN = 0 la salida está en alta impedancia
endmodule



// Módulo ALU
module ALUU(input wire [3:0]ACCU,
  input wire [3:0]BUFFER,
  input wire [2:0]S,
  output wire [3:0]SAL,
  output wire C, ZERO);

  reg [4:0]OF; // el 5to bit es por si hay un overflow

  always @ (ACCU, BUFFER, S) begin
    case(S)
      3'b000: OF <= ACCU;
      3'b001: OF <= ACCU - BUFFER;
      3'b010: OF <= BUFFER;
      3'b011: OF <= ACCU + BUFFER;
      3'b100: OF <= (ACCU ~| BUFFER);
      default: OF <= 5'b00000; // Si no es alguna operación la salida es igual a 0
    endcase
  end
  assign SAL = OF[3:0];
  assign C = OF[4];
  assign ZERO = (OF == 5'B00000) ? 1:0;
endmodule



// Módulo para juntar la ALU, los buffers y el acumulador
module operacional(input wire clk, reset, ENA, ENB, ENC,
  input wire [2:0]S,
  input wire [3:0]OPRND,
  output wire [3:0]SAL,
  output wire [3:0]DATA,
  output wire [3:0]ALU_SAL,
  output wire [3:0]ACCUMULATOR,
  output wire C, ZERO); //Enable de los buffers y del acumulador

  wire [3:0]BUFFER;
  wire [3:0]ACCU;
  wire [3:0]ALU;

  // Instanciación de los módulos
  BT R2(ENB, OPRND, BUFFER);
  BT R3(ENC,ALU, SAL);
  ACCUMULATOR R4(clk, reset, ENA, ALU, ACCU);
  ALUU R1(ACCU, BUFFER, S, ALU, C, ZERO);

  assign DATA = BUFFER;
  assign ALU_SAL = ALU;
  assign ACCUMULATOR = ACCU;

endmodule
