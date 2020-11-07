// Universidad del Valle de Guatemala
// Valerie Valdez

//                    Electrónica digital
//                     Laboratorio No. 10
//                       Ejercicio No. 2


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



module ALU();
