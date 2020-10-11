// Universidad del Valle de Guatemala
// Electrónica digital sección 21
//Valerie Lorraine Sofia Valdez Trujillo

// ____________________________ Proyecto 01 ____________________________________
//_________ Diseño y construcción de una máquina es estados finitos ____________

module testbench();
// Lo que ve el usuario

wire M1_1, M1_0, M2_1, M2_0;
wire L_2, L_1, L_0;
reg S, I_0, I_1, I_2;
reg clk, reset

// Reloj de una unidad de tiempo con cambio en el flanco
always
  begin
    clk <= 1; #1 clk <= ~clk; #1;
end

//Instancia con entradas y salidas de la FSM
robot R(clk, reset, S, I_2, I_1, I_0, M1_1, M1_0, M2_1, M2_0, L_2, L_1, L_0);


// Prueba para la FSM
initial begin
  #1
  $display("\n");
  $display(" ROBOT ");
  $display("\n");
  $display(" clock Sensor I_2 I_1 I_1 | M1_1 M1_0 M2_1 M2_0 L_2 L_1 L_0"); //I _1
  $display("-----------------------------|---");
  $monitor(" %b   %b    %b    %b     %b  | %b    %b    %b    %b    %b    %b    %b", clk, S, I_0, I_1, I_2, M1_1, M1_0, M2_1, M2_0, L_2, L_1, L_0);



  #5 I_2 = 1; I_1 = 0; I_1 = 0;
  C[0] = 0; C[1] = 0; C[2] = 0; C[3] = 0; set = 0; reset = 1;
  #5 C[0] = 0; C[1] = 0; C[2] = 1; C[3] = 0; reset = 0;
  #5 C[0] = 0; C[1] = 1; C[2] = 0; C[3] = 1; reset = 0;
  #5 C[0] = 0; C[1] = 0; C[2] = 1; C[3] = 1; reset = 0;

end


initial
  # $finish;

// GTK wave
initial begin
  $dumpfile("testbench.vcd");
  $dumpvars(0, Testbench);
end
endmodule
