// Electrónica digital
// Hola auxi, sea bienvenido a mi programación

// ---------- Valerie Valdez 19659 ----------
// Programación de la tabla POS número tres.

module TABLA_POS_II(); // Generar y nombrar el módulo

// Declaración de variables

reg A, B, C, D; // Establecer las entradas
wire out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13;


// Declaración de compuertas

not nai(out, A);
not naiI(out1, B);
not naiII(out2, C);
not naiIII(out3, D);
or inu(out4, A,out1,C,D);
or inuI(out5, A,out1,C,out3);
or inuII(out6, A,out1,out2,D);
or inuIII(out7, A,out1,out2,out3);
or inuIV(out8, out,B,C,out3);
or inuV(out9, out,B,out2,out3);
or inuVI(out10, out,out1,C,D);
or inuVII(out11, out,out1,C,out3);
or inuVIII(out12, out,out1,out2,out3);
and neko(out13, out4,out5,out6,out7,out8,out9,out10,out11,out12);


// Establecer eventos a través del tiempo

initial begin
  $display("A B C D | Y");
  $display("----------");
  $monitor("%b %b %b %b | %b", A, B, C, D, out13);


// Declaración de los valores en el tiempo = 0

  A = 0;
  B = 0;
  C = 0;
  D = 0;


// Declaración de los valores en el tiempo restante

  #1 D = 1;
  #1 C= 1; D = 0;
  #1 D = 1;
  #1 B = 1; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 A = 1; B = 0; C = 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 B = 1; C= 0; D = 0;
  #1 D = 1;
  #1 C = 1; D = 0;
  #1 D = 1;
  #1 $finish;
end


// GTKwave
  initial
    begin
      $dumpfile("03_TABLA_POS_tb.vcd"); // Nombre del archivo
      $dumpvars(0, TABLA_POS_II); // Nombre del documento
    end
endmodule
