// Electrónica digital
// Valerie Valdez 19659

//                             Laboratorio #09
//                              Ejercicio 02


// Flip Flop D 1 bit
module FFD(input wire clk, EN, reset, input wire C, output reg D);
  always @ (posedge clk, posedge reset) begin

// Non-blockinf assigment
    if(reset) // Colocar todos los valores en 0
      D <= 1'b0;

    else if(EN == 1) // Enabled encendido cuenta cuenta cada flanco del reloj
      D <= C;
  end
endmodule

// Módulo flip flop tipo T
module FFT(input wire clk, EN, reset, output D);
    wire w;
    assign w = ~D;

    FFD A1(clk, EN, reset, w, D);
endmodule
