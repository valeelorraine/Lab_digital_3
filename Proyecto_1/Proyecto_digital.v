// Universidad del Valle de Guatemala
// Electrónica digital sección 21
//Valerie Lorraine Sofia Valdez Trujillo

// ____________________________ Proyecto 01 ____________________________________
//_________ Diseño y construcción de una máquina es estados finitos ____________

// Flip Flop tipo D de tres bits
// Con always una sección del código siempre estará activado

module FFD3(input wire clk, reset, input wire [2:0]D, output reg [2:0]Q);
  always @ (posedge clk, posedge set, posedge reset) begin // Count on the rising edge of the clk
    if (reset) begin
    Q <= 3'b0;
    end

    else
      Q <= D;
        end
endmodule


//Flip Flop tipo D de 4 bits
module FFD4(input wire clk, reset, input wire [3:0]D, output reg [3:0]Q);
  always @ (posedge clk, posedge set, posedge reset) begin // Count on the rising edge of the clk
    if (reset) begin
    Q <= 4'b0;
    end

    else
      Q <= D;
        end
endmodule


//Módulo del timer 1
module timer(input wire EN, output wire timerDone);
    always @ (EN)
        if (EN == 1) begin
            timerDone = 0;
            #10 // este es el delay que necesitas
            timerDone = 1;
        end
        else
            timerDone = 0;

endmodule


//Módulo del timer 2
module timer2(input wire EN, output wire timerDone);
    always @ (EN)
        if (EN == 1) begin
            timerDone = 0;
            #5 // este es el delay que necesitas
            timerDone = 1;
        end
        else
            timerDone = 0;

endmodule



// Máquina de motores

module R1(input wire clk, reset, T1, T2, S, I_2, I_1, I_0; output wire EN1, EN2, Y1_1, Y1_0, Y2_1, Y2_0);
  wire [3:0]M1;
  wire [3:0]M1';

  M1[0]' = M1_0';
  M1[1]' = M1_1';
  M1[2]' = M2_0';
  M1[3]' = M2_1';

  M1[0] = M1_0;
  M1[1] = M1_1;
  M1[2] = M2_0;
  M1[3] = M2_1;

  FFD4 F1(clk, reset, M1', M1);

// Ecuaciones booleanas de transiciones
   assign M1_1' = (M1_1 & ~ M1_0 & ~ M2_1 & M2_0 & ~S & ~T) | (M1_1 & ~M1_0 & ~M2_0 & ~S & ~T & ~T2) | (~M1_1 & ~M1_0 & ~M2_1 & ~M2_0 & I_2 & ~I_1 & ~S)  | (~M1_1 & ~M1_0 & ~M2_1 & ~M2_0 & ~I_1 & I_0 & ~S)  | (~M1_1 & M1_0 & M2_1 & ~M2_0 & ~S & ~T & T2);
   assign M1_0' = (~M1_1 & M1_0 & ~M2_1 & ~S & ~T & ~T2) | (~M1_1 & M1_0 & ~M2_0 & ~S & ~T & ~T2) | (~M1_1 & ~M1_0 & ~M2_1 & ~M2_0 & ~I_2 & I_1 & ~S)  | (~M1_1 & ~M1_0 & ~M2_1 & ~M2_0 & I_1 & ~I_0 & ~S);
   assign M2_1' = (~M1_1 & M1_0 & M2_1 & ~M2_0 & ~S & ~T) | (~M1_1 & ~M1_0 & ~M2_1 & ~M2_0 & ~I_2 & I_0 & ~S)  | (M1_1 & ~M1_0 & ~M2_1 & M2_0 & ~S & ~T & T2) | (M1_1 & ~M1_0 & M2_1 & ~M2_0 & ~S & ~T & ~T2);
   assign M2_0' = (~M1_1 & M1_0 & ~M2_1 & M2_0 & ~S & ~T & ~T2) | (M1_1 & ~M1_0 & ~M2_1 & M2_0 & ~S & ~T & ~T2) | (~M1_1 & ~M1_0 & ~M2_1 & ~M2_0 & ~I_2 & I_1 & ~I_0 & ~S) | (~M1_1 & ~M1_0 & ~M2_1 & ~M2_0 & I_2 & ~I_1 & ~I_0 & ~S);

// Ecuaciones booleanas de salida
  assign Y1_1 = (M1_1 & ~M1_0 & ~M2_1) | (M1_1 & ~M1_0 & ~M2_0);
  assign Y1_0 = (~M1_1 & M1_0 & ~M2_1) | (~M1_1 & M1_0 & ~M2_0);
  assign Y2_1 = (~M1_1 & M1_0 & M2_1 & ~M2_0) | (M1_1 & ~M1_0 & M2_1 & ~M2_0);
  assign Y2_0 = (~M1_1 & M1_0 & ~M2_1 & M2_0) | (M1_1 & ~M1_0 & ~M2_1 & M2_0);
  assign E1 = (~M1_1 & M1_0 & ~M2_1) | (M1_1 & ~M1_0 & ~M2_0) | (~M1_0 & ~M2_1 & ~M2_0);
  assign E2 = (M1_1 & ~M1_0 & ~M2_1 & M2_0) | (~M1_1 & M1_0 & M2_1 & ~M2_0);

endmodule



// Máquina de LEDS

module R2(input wire clk, reset, T1, T2, S, I_2, I_1, I_0, output wire Timer1, Timer2, Y_1, Y_2, Y_3);
  wire [2:0]L1;
  wire [2:0]L1';

  L1[0]' = L1_0';
  L1[1]' = L1_1';
  L1[2]' = L2_0';

  L1[0] = L1_0;
  L1[1] = L1_1;
  L1[2] = L2_0;


  FFD3 F2(clk, reset, L1', L1); //Utilizar el FF de 3 bits

// Ecuaciones booleanas de LEDS
   assign L_2' = (L_2 & ~L_1 & ~L_0 & O & ~S & ~T & T2) | (L_2 ~L_1 & ~L_0 & O & ~S & T & ~T2) | (~L_2 & ~L_1 & L_0 & ~I_2 & I_1 & O & ~S)  | (~L_2 & ~L_1 & L_0 & ~I_1 & I_0 & O & ~S)  | (~L_2 & ~L_1 & L_0 & I_2 & ~I_0 & O & ~S) ;
   assign L_1' = (~L_2 & L_1 & O & S)  | (~L_2 & L_0 & O & S)  | (L_2 & ~L_1 & ~L_0 & O  & S)  | (~L_2 & L_1 & ~L_0 & O & ~T & ~T2) | (~L_2 & ~L_1 & L_0 & I_2 & I_1 & I_0 & O) ;
   assign L_0' = (~L_2 & O & S)  | (~L_2 & L_1 & L_0 & O)  | (~L_2 & ~L_1 & ~L_0 & O)  | (~L_1 & ~L_0 & O & S)  | (~L_1 & ~L_0 & O & T & T2) | (~L_2 & ~L_0 & O & T & ~T2);

// Ecuaciones booleanas de salida de LEDS
  assign Y_1 = (L_2 & ~L_1 & ~L_0);
  assign Y_2 = (~L_2 & L_1);
  assign Y_3 = (~L_2 & L_0);
  assign Timer = (~L_2 & L_1 & ~L_0) | (L_2 & ~L_1 & ~L_0);
  assign Timer2 = (L_2 & ~L_1 & ~L_0);

endmodule



// Juntador de todo
module juntador(input wire clk, reset, S, I_2, I_1, I_0, output wire M1_1, M1_0, M2_1, M2_0, L_2, L_1, L_0);
wire EN1, EN2, T1, T2, Timer1, Timer2;

R1 M1(clk, reset, T1, T2, S, I_2, I_1, I_0, EN1, EN2, Y1_1, Y1_0, Y2_1, Y2_0);
R2 L1(clk, reset, T1, T2, S, I_2, I_1, I_0, Timer1, Timer2, L_0, L_1, L_2);
timer U(EN1, T1);
timer2 W(EN2, T2);

endmodule
