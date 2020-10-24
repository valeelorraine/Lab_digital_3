// Universidad del Valle de Guatemala
// Valerie Valdez

//                         Electrónica digital
//                            Laboratorio 8


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
