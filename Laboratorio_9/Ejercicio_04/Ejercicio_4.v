// Electrónica digital
// Valerie Valdez 19659

//                             Laboratorio #09
//                              Ejercicio 04


// Módulo Buffer triestado

module BT(input wire EN,
  input wire [3:0]S, // Entradas
  output wire [3:0]Q); // Salidas

    assign Q = (EN) ? S : 4'bz; // Cuando EN = 0 la salida está en alta impedancia
endmodule
