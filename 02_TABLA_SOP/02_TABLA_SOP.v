//Electrónica digital, Laboratorio 3

// ---------- Valerie Valdez 19659 ----------
// Programación de la tabla SOP número dos.

module TABLA_SOP_I(); // Nombre del módulo

// Declaración de variables

reg A, B, C;  // Entradas
wire out0,out1,out2,out3,out4,out5,out6; // Cables


// Declaración de compuertas

not ari(out0, A);
not ariI(out1, B);
not ariII(out2, C);
and soshite(out3, out0,out1,C);
and soshiteI(out4, A,B,out2);
and soshiteII(out5, A,B,C);
or matawa(out6, out3,out4,out5);


// Establecer eventos a través del tiempo

initial begin
  $display("A B C | Y");
  $display("----------");
  $monitor("%b %b %b | %b",A, B, C, out6); // Monitorear cualquier cambio en las variables


// Declaración de los valores en el tiempo = 0

  A = 0;
  B = 0;
  C = 0;


// Declaración de los valores en el tiempo restante

  #1 C = 1;
  #1 B = 1; C = 0;
  #1 C = 1;
  #1 A = 1; B = 0; C = 0;
  #1 C = 1;
  #1 B = 1; C = 0;
  #1 C = 1;
  #1 $finish;
end


// GTKwave
  initial
    begin
      $dumpfile("02_TABLA_SOP_tb.vcd"); // Nombre del archivo
      $dumpvars(0, TABLA_SOP_I); // Nombre del documento
    end
endmodule
