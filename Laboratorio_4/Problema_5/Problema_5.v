// Electrónica digital
// Laboratorio 4, problema 5
//----------------Valerie Valdez 19659-----------------------

//Tabla SOP con Gate level modeling
module TABLA_SOP_GLM(input wire A, B, C, output wire Y);

wire w1, w2, w3, w4, w5;

not(w1, B);
not(w2, C);
and(w3, A,w1,w2);
and(w4, A,B,w2);
and(w5, A,B,C);
or(Y, w3,w4,w5);

endmodule


//Tabla SOP con Behavioral modelling
module TABLA_SOP_BM(input wire A, B, C, output wire Y);

assign Y = (A & ~B & ~C) | (A & B & ~C) | (A & B & C);

endmodule


//Tabla POS con Gate Level modeling
module TABLA_POS_GLM(input wire A,B,C, output wire Y);

wire q1, q2, q3, q4, q5, q6, q7, q8;

not(q1, A);
not(q2, B);
not(q3, C);
or(q4, A,B,C);
or(q5, A,B,q3);
or(q6, A,q2,C);
or(q7, A,q2,q3);
or(q8, q1,B,q3);
and(Y, q4,q5,q6,q7,q8);

endmodule


//Tabla POS con Behavioral Modelling
module TABLA_POS_BM(input wire A,B,C, output wire Y);

assign Y = (A | B | C) & (A | B | ~C) & (A | ~B | C) & (A | ~B | ~C) & (~A | B | ~C);

endmodule


// Tabla ecuación minimizada con Gate Level Modeling
module TABLA_MIN_GLM(input wire A,B,C, output wire Y);

wire s1, s2, s3;

not(s1, C);
and(s2, A,s1);
and(s3, A,B);
or(Y, s2,s3);

endmodule


// Tabla ecuación minimizada con Behavioral Modeling
module TABLA_MIN_BM(input wire A,B,C, output wire Y);

assign Y = (A & ~C) | (A & B);

endmodule
