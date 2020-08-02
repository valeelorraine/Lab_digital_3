// ---------- Valerie Valdez 19659 ----------
// Programación de la tabla POS número uno.

module TABLA_POS(); // Generar y nombrar el módulo

// Declaración de variables

reg A, B, C;  // Nombres de las entradas
wire out0,out1,out2,out3,out4,out5,out6; //Nombres de los cables


// Declaración de compuertas

not nai(out, A);
not naiI(out1, B);
not naiII(out2, C);
or matawa(out3, A,B,out2);
or matawaI(out4, A,out1,out2);
or matawaII(out5, out,out1,C);
and soshite(out6, out3,out4,out5);


// Establecer eventos a través del tiempo

initial begin
  $display("A B C | Y"); // Darle forma a la tabla de verdad
  $display("----------");
  $monitor("%b %b %b | %b", A, B, C, out6); // Monitorear cualquier cambio en las variables


// Declaración de los valores en el tiempo = 0

  A = 0;
  B = 0;
  C = 0;


// Declaración de los valores en el tiempo restante
// Nótese que #1 significa el retardo de una unidad de tiempo

  #1 C = 1;
  #1 B = 1; C = 0;
  #1 C = 1;
  #1 A = 1; B = 0; C = 0;
  #1 C = 1;
  #1 B = 1; C = 0;
  #1 C = 1;
  #1 $finish; //termina la simulación
end


// GTKwave
  initial
    begin
      $dumpfile("01_TABLA_POS_tb.vcd"); // Nombre del archivo
      $dumpvars(0, TABLA_POS); // Nombre del documento
    end

endmodule // Fin del módulo
