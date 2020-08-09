// ---------- Valerie Valdez 19659 ----------
// Programación de la tabla SOP número cuatro.

module TABLA_SOP_III();

// Declaración de variables

reg A, B, C, D;
wire out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11;


// Declaración de compuertas

not doko(out0, A);
not dokoI(out1, B);
not dokoII(out2, C);
not dokoIII(out3, D);
and naku(out4, out0,out1,out2,out3);
and nakuI(out5, out0,out1,C,out3);
and nakuII(out6, out0,out1,C,D);
and nakuI(out7, out0,B,C,out3);
and nakuII(out8, out0,B,C,D);
and nakuI(out9, A,out1,out2,out3);
and nakuII(out10, A,out1,C,out3);
or eto(out11, out4,out5,out6,out7,out8,out9,out10);


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
  #1 $finish;
end


  initial
    begin
      $dumpfile("04_TABLA_SOP_tb.vcd");
      $dumpvars(0, TABLA_SOP_III);
    end
endmodule
