// Universidad del Valle de Guatemala
// Electrónica digital sección 21
//Valerie Lorraine Sofia Valdez Trujillo

// ____________________________ Proyecto 01 ____________________________________
//_________ Diseño y construcción de una máquina es estados finitos ____________

module testbench();
// Lo que ve el usuario

wire Y1_1, Y1_0, Y2_1, Y2_0;
wire Y_1, Y_2, Y_3;
reg S, I_0, I_1, I_2, O;
reg clk, reset;

// Reloj de una unidad de tiempo con cambio en el flanco
always
  begin
    clk <= 1; #1 clk <= ~clk; #1;
end

//Instancia con entradas y salidas de la FSM
Join U(clk, reset, S, I_2, I_1, I_0, O, Y1_1, Y1_0, Y2_1, Y2_0, Y_1, Y_2, Y_3);


// Prueba para la FSM
initial begin
  #1
  $display("\n");
  $display(" ROBOT ");
  $display("\n");
  $display("clk Sensor I_2 I_1 I_0 O | Y_1, Y_2, Y_3, Y1_1, Y1_0, Y2_1, Y2_0");
  $display("-------------------------------------|-----------------------------------------");
  $monitor(" %b   %b    %b    %b     %b     %b    | %b    %b    %b    %b    %b    %b    %b", clk, S, I_2, I_1, I_0, O, Y1_1, Y1_0, Y2_1, Y2_0, Y1_1, Y_2, Y_3,);

  #2 reset = 1;
  #4 reset = 0;

  #4 S = 0; I_2 = 0; I_1 = 0 ; I_0 = 0; O = 0;
  #4 S = 0; I_2 = 0; I_1 = 0 ; I_0 = 0; O = 1;
  #4 S = 1; I_2 = 0; I_1 = 0 ; I_0 = 0; O = 0;
  #4 S = 1; I_2 = 0; I_1 = 0 ; I_0 = 0; O = 1;

  #4 S = 0; I_2 = 0; I_1 = 0 ; I_0 = 1; O = 0;
  #4 S = 0; I_2 = 0; I_1 = 0 ; I_0 = 1; O = 1;
  #4 S = 1; I_2 = 0; I_1 = 0 ; I_0 = 1; O = 0;
  #4 S = 1; I_2 = 0; I_1 = 0 ; I_0 = 1; O = 1;

  #4 S = 0; I_2 = 0; I_1 = 1 ; I_0 = 0; O = 0;
  #4 S = 0; I_2 = 0; I_1 = 1 ; I_0 = 0; O = 1;
  #4 S = 1; I_2 = 0; I_1 = 1 ; I_0 = 0; O = 0;
  #4 S = 1; I_2 = 0; I_1 = 1 ; I_0 = 0; O = 1;

  #4 S = 0; I_2 = 0; I_1 = 1 ; I_0 = 1; O = 0;
  #4 S = 0; I_2 = 0; I_1 = 1 ; I_0 = 1; O = 1;
  #4 S = 1; I_2 = 0; I_1 = 1 ; I_0 = 1; O = 0;
  #4 S = 1; I_2 = 0; I_1 = 1 ; I_0 = 1; O = 1;

  #4 S = 0; I_2 = 1; I_1 = 0 ; I_0 = 0; O = 0;
  #4 S = 0; I_2 = 1; I_1 = 0 ; I_0 = 0; O = 1;
  #4 S = 1; I_2 = 1; I_1 = 0 ; I_0 = 0; O = 0;
  #4 S = 1; I_2 = 1; I_1 = 0 ; I_0 = 0; O = 1;

  #4 S = 0; I_2 = 1; I_1 = 0 ; I_0 = 1; O = 0;
  #4 S = 0; I_2 = 1; I_1 = 0 ; I_0 = 1; O = 1;
  #4 S = 1; I_2 = 1; I_1 = 0 ; I_0 = 1; O = 0;
  #4 S = 1; I_2 = 1; I_1 = 0 ; I_0 = 1; O = 1;

  #4 S = 0; I_2 = 1; I_1 = 1 ; I_0 = 1; O = 0;
  #4 S = 0; I_2 = 1; I_1 = 1 ; I_0 = 1; O = 1;
  #4 S = 1; I_2 = 1; I_1 = 1 ; I_0 = 1; O = 0;
  #4 S = 1; I_2 = 1; I_1 = 1 ; I_0 = 1; O = 1;

end

initial
  #110 $finish;

// GTK wave
initial begin
  $dumpfile("Proyecto_digital_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
