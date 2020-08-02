// ---------- Valerie Valdez 19659 ----------
// Programación de la tabla SOP número tres.

module TABLA_SOP_II();

// Declaración de variables

reg A, B, C, D;  // Nombres de las variables de entrada
wire out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11; // Nombres de los cables


// Declaración de compuertas

not tori(out0, A);
not toriI(out1, B);
not toriII(out2, C);
not toriIII(out3, D);
and haku(out4, out0,out1,out2,out3);
and hakuI(out5, out0,out1,out2,D);
and hakuII(out6, out0,out1,C,out3);
and hakuI(out7, out0,out1,C,D);
and hakuII(out8, A,out1,out2,out3);
and hakuI(out9, A,out1,C,out3);
and hakuII(out10, A,B,C,out3);
or nande(out11, out4,out5,out6,out7,out8,out9,out10);


// Establecer eventos a través del tiempo

initial begin
  $display("A B C D | Y");
  $display("----------");
  $monitor("%b %b %b %b | %b", A, B, C, D, out11);


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


  initial
    begin
      $dumpfile("03_TABLA_SOP_tb.vcd");
      $dumpvars(0, TABLA_SOP_II);
    end
endmodule
