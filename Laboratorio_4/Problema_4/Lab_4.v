// Electrónica digital
// Laboratorio #4
// -------------------------Valerie Valdez 19659--------------------------------


// Ecuación a implementar y = (A' * C') + (A * C) + (A * B')

module TABLA_1(input wire A, B, C, output wire Y); // Generar y nombrar el módulo


wire u1, u2, u3, u4, u5, u6; // Nombres de los cables

// Declaración de las compuertas
not(u1, A);
not(u2, B);
not(u3, C);
and(u4, u1,u3);
and(u5, A,C);
and(u6, A,u2);
or(Y, u4,u5,u6);

endmodule


// Ecuación a implementar Y1 = B'

module TABLA_2(input wire A, B, C, output wire Y1);  // Nombres de los cables

// Declaración de las compuertas
not(Y1, B);

endmodule


// Ecuación a implementar Y = (A'*B'*C'*D') + (A*B*C'*D') + (A'*B*C'*D) + (A*B'*C'*D) + (A'*B'*C*D) + (A*B*C*D) + (A'*B*C*D') + (A*B'*C*D')


module TABLA_3(input wire A, B, C, D, output wire Y);

assign Y = (~A & ~B & ~C & ~D) | (A & B & ~C & ~D) | (~A & B & ~C & D) | (A & ~B & ~C & D) | (~A & ~B & C & D) | (A & B & C & D) | (~A & B & C & ~D) | (A & ~B & C & ~D);

endmodule


//Ecuación a implementar Y = AC'D' + BD + AC

module TABLA_4(input wire A, B, C, D, output wire Y);

wire w1, w2, w3, w4, w5;

not(w1, C);
not(w2, D);
and(w3, A,w1,w2);
and(w4, B,D);
and(w5, A,C);
or(Y, w3,w4,w5);

endmodule


// Ecuación a implementar Y = B'C'D' + AC' + AB' + ACD'
module TABLA_5(input wire A, B, C, D, output wire Y1);

wire r1, r2, r3, r4, r5, r6, r7;

not(r1, B);
not(r2, C);
not(r3, D);
and(r4, r1,r2,r3);
and(r5, A,r2);
and(r6, A,r1);
and(r7, A,C,r3);
or(Y1, r4,r5,r6,r7);

endmodule


// Ecuación a implementar Y = B' + C
module TABLA_6(input wire A, B, C, output wire Y);

assign Y = (~B) | (C);

endmodule


// Ecuación a implementar Y = B + AD

module TABLA_7(input wire A, B, C, D, output wire Y);

assign Y = (B) | (A & D);

endmodule


// Ecuación a implementar Y = A'C' + AB
module TABLA_8(input wire A, B, C, output wire Y);

assign Y = (~A & ~C) | (A & B);

endmodule
