// ---------- Valerie Valdez 19659 ----------
// Programación de la tabla POS número cuatro.

module TABLA_POS_III(); // Generar y nombrar el módulo

// Declaración de variables

reg A, B, C, D;  // Nombres de las entradas
wire out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13; //Nombres de los cables


// Declaración de compuertas

not nai(out, A);
not nai1(out1, B);
not nai2(out2, C);
not nai3(out3, D);
or matawa(out4, A,B,C,out3);
or matawaI(out5, A,out1,C,D);
or matawaII(out6, A,out1,C,out3);
or matawaIII(out7, out,B,C,out3);
or matawaIV(out8, out,B,out2,out3);
or matawaV(out9, out,out1,C,D);
or matawaVI(out10, out,out1,C,out3);
or matawaVII(out11, out,out1,out2,D);
or matawaVIII(out12, out,out1,out2,out3);
and soshite(out13, out4,out5,out6,out7,out8,out9,out10,out11,out12);


// Establecer eventos a través del tiempo

initial begin
  $display("A B C D | Y"); // Darle forma a la tabla de verdad
  $display("----------");
  $monitor("%b %b %b %b | %b", A, B, C, D, out13); // Monitorear cualquier cambio en las variables


// Declaración de los valores en el tiempo = 0

  A = 0;
  B = 0;
  C = 0;
  D = 0;


// Declaración de los valores en el tiempo restante
// Nótese que #1 significa el retardo de una unidad de tiempo

  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 B = 1; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 A = 1; B = 0; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 B = 1; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 $finish; //termina la simulación
end


// GTKwave
  initial
    begin
      $dumpfile("04_TABLA_POS_tb.vcd"); // Nombre del archivo
      $dumpvars(0, TABLA_POS_III); // Nombre del documento
    end
endmodule // Fin del módulo
