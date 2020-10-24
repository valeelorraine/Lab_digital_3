// Universidad del Valle de Guatemala
// Valerie Valdez

//                         Electrónica digital
//                            Laboratorio 8


// Módulo del la ALU
module ALU(input wire [3:0]D, Q,
            input wire [2:0]S,
            output reg [3:0]Y);

    always @ (D, Q, S) begin
      case (S)
        3'b000: Y <= D & Q ; // Función: A AND B
        3'b001: Y <= D | Q ; // Función: A OR B
        3'b010: Y <= D + Q ; // Función: A ADD B

        3'b011: Y <= Y ; // Colocar el valor pervio

        3'b100: Y <= D & (~Q) ; // Función A AND ~B
        3'b101: Y <= D | (~Q) ; // Función A OR ~B
        3'b110: Y <= D - Q ; // Función A LESS B
        3'b111: Y <= (D < Q) ? 1:0 ; // Función STL. (Comparación entre A y B, por lo que si A > B = 0000, si A < B = 0001)

      default: Y <= 4'b0000 ;// Todo en 0
    endcase
  end
endmodule
