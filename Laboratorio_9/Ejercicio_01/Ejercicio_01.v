// Electrónica digital
// Valerie Valdez 19659

//                             Laboratorio #09
//                              Ejercicio 01



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




// Flip Flop 2 bits

module FFD2(input wire clk, EN, reset, input wire [1:0]C, output [1:0]D);

  FFD A1(clk, EN, reset, C[0], D[0]);
  FFD A2(clk, EN, reset, C[1], D[1]);

endmodule



// Flip Flop 4 bits

module FFD4(input wire clk, EN, reset, input wire [3:0]C, output [3:0]D);

    FFD2 B1(clk, EN, reset, C[3:2], D[3:2]);
    FFD2 B2(clk, EN, reset, C[1:0], D[1:0]);

endmodule
