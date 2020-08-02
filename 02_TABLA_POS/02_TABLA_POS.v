// Electrónica digital, Laboratorio 3

// ---------- Valerie Valdez 19659 ----------
// Programación de la tabla POS número dos.

module TABLA_POS_I(); // Nombre del módulo

// Declaración de variables

reg A, B, C; 
wire out0,out1,out2,out3,out4,out5,out6,out7,out8;


// Declaración de compuertas

not iie(out, A);
not iieI(out1, B);
not iieII(out2, C);
or soretomo(out3, A,B,C);
or soretomoI(out4, A,out1,C);
or soretomoII(out5, A,out1,out2);
or soretomoIII(out6, out,B,C);
or soretomoIV(out7, out,B,out2);
and soshite(out8, out3,out4,out5,out6,out7);


// Establecer eventos a través del tiempo

initial begin
  $display("A B C | Y");
  $display("----------");
  $monitor("%b %b %b | %b", A, B, C, out8);


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
      $dumpfile("02_TABLA_POS_tb.vcd"); // Nombre del archivo
      $dumpvars(0, TABLA_POS_I); // Nombre del documento
    end
endmodule
