// Universidad del Valle de Guatemala
// Valerie Valdez

//                         Electrónica digital
//                            Laboratorio 8


// Implementar un contador de 12 bits con un enable y capaz de hacer un load

module contador(input wire clk, rst, en, blo,
  input wire [11:0]load,
  output reg [11:0]val);

// Non-blocking assigment
    always @(posedge clk or posedge rst or posedge blo) begin

      if(rst == 1) // Colocar todos los valores en 0
        val <= 12'b000000000000;

      else if(en == 1) //Enabled encendido cuenta en cada flanco de reloj
        val <= val + 1;

      else if(blo == 1) // Blo encendido entonces Load comienza a contar
        val <= load;

        end
endmodule
