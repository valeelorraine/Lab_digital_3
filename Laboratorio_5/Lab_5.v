// Electrónica digital
// Laboratorio #5
// --------------------------Valerie Valdez 19659-------------------------------

// Muxes de uso general

// Mux 2:1
module MUX2_1(input wire S, D0, D1, output wire Y); //Generar y nombrar el módulo
    assign Y = S? D1 : D0; // Cuando S es = 0, toma el valor menos significativo. Cuando S es = 1, toma el valor más significativo

endmodule


// Mux 4:1
module MUX4_1(input wire D0, D1, D2, D3, input wire [1:0]S1, output wire Y);

  wire Y1, Y2;

  MUX2_1 m1(S1[0], D0, D1, Y1);
  MUX2_1 m2(S1[0], D2, D3, Y2);
  MUX2_1 m3(S1[1], Y1, Y2, Y);

endmodule


// Mux 8:1
module MUX8_1(input wire D0, D1, D2, D3, D4, D5, D6, D7, input wire [2:0]S1, output wire Y);

  wire Y1, Y2;

  MUX4_1 m1(D0, D1, D2, D3, S1[1:0], Y1);
  MUX4_1 m2(D4, D5, D6, D7, S1[1:0], Y2);
  MUX2_1 m3(S1[2], Y1, Y2, Y);

endmodule



// Tabla de verdad con MUX 2:1
module TABLA_1_MUX2(input wire A, B, C, output wire Y);

  assign Y1 = (B ^ C);
  assign Y2 = ~(B ^ C);
  MUX2_1 m1(A, Y1, Y2, Y);

endmodule


// Tabla de verdad con MUX 4:1

module TABLA_1_MUX4(input wire A, B, C, output wire Y);

  wire Y1;
  assign Y1 = ~C;
  wire [1:0]S1;
  assign S1[0] = B;
  assign S1[1] = A;
  MUX4_1 m1(C, ~C, ~C, C, S1[1:0], Y);

endmodule


// Tabla de verdad con MUX 8:1
module TABLA_1_MUX8(input wire A, B, C, V, G, output wire Y);

  wire [2:0]S1;
  assign S1[0] = C;
  assign S1[1] = B;
  assign S1[2] = A;
  MUX8_1 m1(G, V, V, G, V, G, G, V, S1[2:0], Y);

endmodule


// Tabla de verdad 2 con MUX 2:1
module TABLA_2_MUX2(input wire A, B, C, output wire Y);

  assign Y1 = (B ~| C);
  assign Y2 = ~(B & C);
  MUX2_1 m1(A, Y1, Y2, Y);

endmodule


// Tabla de verdad 2 con MUX 4:1
module TABLA_2_MUX4(input wire A, B, C, V, G, output wire Y);

  wire [1:0]S1;
  assign S1[0] = B;
  assign S1[1] = A;
  MUX4_1 m1(~C, G, V, ~C, S1[1:0], Y);

endmodule


// Tabla de verdad 2 con MUX 8:1
module TABLA_2_MUX8(input wire A, B, C, V, G, output wire Y);

  wire[2:0]S1;
  assign S1[0] = C;
  assign S1[1] = B;
  assign S1[2] = A;
  MUX8_1 m1(V, G, G, G, V, V, V, G, S1[2:0], Y);

endmodule
