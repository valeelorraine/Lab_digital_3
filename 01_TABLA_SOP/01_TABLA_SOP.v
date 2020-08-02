// Electrónica digital, Laboratorio 3

// ---------- Valerie Valdez 19659 ----------
// Programación de la tabla SOP número uno.

module TABLA_SOP(); // Nombre del módulo

// Declaración de variables

reg A, B, C;
wire out0,out1,out2,out3,out4,out5,out6,out7,out8;


// Declaración de compuertas

not nai(out0, A);
not naiI(out1, B);
not naiII(out2, C);
and soshite(out3, out0,out1,out2);
and soshiteI(out4, out0,B,out2);
and soshiteII(out5, A,out1,out2);
and soshiteII(out6, A,out1,C);
and soshiteIV(out7, A,B,C);
or matawa(out8, out3,out4,out5,out6,out7);


// Establecer eventos a través del tiempo

initial begin
  $display("A B C | Y");
  $display("----------");
  $monitor("%b %b %b | %b",A, B, C, out8);


// Declaración de los valores en t = 0

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


  initial
    begin
      $dumpfile("01_TABLA_SOP_tb.vcd");
      $dumpvars(0, TABLA_SOP);
    end
endmodule 
