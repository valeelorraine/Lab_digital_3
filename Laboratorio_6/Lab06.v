// Universidad del Valle de Guatemala
// Valerie Valdez (19659)
// Electrónica digital

// ------------------------- Laboratorio No. 6 --------------------------------


// Ejercicio 05
// Flip Flop tipo D de 4 bits con reset síncrono y asíncrono

module FFD(input wire clk, reset, set, input wire [3:0]C, output reg[3:0]D);

// Con always una sección del código estará siempre activado
  always @ (posedge clk, posedge set, posedge reset) begin // Count on the rising edge of the clk

    if(reset) begin  // En caso de reset colocar todas las salidas en 0
      D <= 4'b0;
    end

    else if (set) begin  // En caso de set colocar todas las salidas en 1
      D <= 4'b1111;
    end

    else  // De lo contrario la salida será igual a la entrada
      D <= C;
    end
endmodule



// Ejercicio 06

// Flip Flop tipo D de 2 bits

module FFD2(input wire clk, reset, input wire C, output reg D);
  always @ (posedge clk, posedge reset) begin
    if (reset) begin
      D <= 1'b0;
    end

    else
      D <= C;
    end
endmodule



// Máquina de estados finitos Ejercicio 1

module MF(input wire A, B, clk, reset, output wire Y);
wire S1, S0, S11, S00;

// Ecuaciones booleanas de transiciones
  assign S11 = (S0 & B) | (S1 & A & B);
  assign S00 = (~S1 & ~S0 & A);
  assign Y = (S1 & A & B);

// Utilizar el Flip FLop de 2 bits
  FFD2 U(clk, reset, S11, S1);
  FFD2 U1(clk, reset, S00, S0);

endmodule



// Máquina de estados finitos Ejercicio 3

module MF1(input wire P, clk, reset, output wire Y0, Y1, Y2);
wire S2, S1, S0, S22, S11, S00;

// Ecuaciones booleanas de transiciones
  assign S22 = (~S2 & S1 & S0 & P) | (~S2 & ~S1 & ~S0 & ~P) | (S2 & ~S1 & S0) | (S2 & ~S0 & P) | (S2 & S1 & ~P);
  assign S11 = (~S1 & S0 & P) | (S1 & ~S0 & P) | (S1 & S0 & ~P) | (~S1 & ~S0 & ~P);
  assign S00 = ~S0;

// Utilizar el Flip FLop de 2 bits
  FFD2 U2(clk, reset, S00, S0);
  FFD2 U3(clk, reset, S11, S1);
  FFD2 U4(clk, reset, S22, S2);

// Ecuaciones para las salidas
  assign Y2 = S2;
  assign Y1 = (~S2 & S1) | (S2 & ~S1);
  assign Y0 = (~S1 & S0) | (S1 & ~S0);

endmodule
