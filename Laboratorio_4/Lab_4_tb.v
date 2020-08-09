//----------------------------Valerie Valdez-----------------------------------

module testbench();

// TABLA_1 Y TABLA_2
reg s1, s2, s3;
wire led1, led2;

TABLA_1 G1(s1,s2,s3, led1);
TABLA_2 G2(s1,s2,s3, led2);

initial begin
  $display("A B C | Y Y1");
  $display("------|-----");
  $monitor("%b %b %b | %b %b", s1,s2,s3, led1, led2);

      s1 = 0; s2 = 0; s3 = 0;
      #1 s1 = 0; s2 = 0; s3 = 1;
      #1 s1 = 0; s2 = 1; s3 = 0;
      #1 s1 = 0; s2 = 1; s3 = 1;
      #1 s1 = 1; s2 = 0; s3 = 0;
      #1 s1 = 1; s2 = 0; s3 = 1;
      #1 s1 = 1; s2 = 1; s3 = 0;
      #1 s1 = 1; s2 = 1; s3 = 1;

end


// TABLA_3
reg t1, t2, t3, t4;
wire led3;

TABLA_3 G3(t1,t2,t3,t4, led3);

initial begin
  #8
  $display("\n");
  $display("A B C D | Y ");
  $display("--------|---");
  $monitor("%b %b %b %b | %b", t1,t2,t3,t4, led3);

      t1 = 0; t2 = 0; t3 = 0; t4 = 0;
      #1 t1 = 0; t2 = 0; t3 = 0; t4 = 1;
      #1 t1 = 0; t2 = 0; t3 = 1; t4 = 0;
      #1 t1 = 0; t2 = 0; t3 = 1; t4 = 1;
      #1 t1 = 0; t2 = 1; t3 = 0; t4 = 0;
      #1 t1 = 0; t2 = 1; t3 = 0; t4 = 1;
      #1 t1 = 0; t2 = 1; t3 = 1; t4 = 0;
      #1 t1 = 0; t2 = 1; t3 = 1; t4 = 1;
      #1 t1 = 1; t2 = 0; t3 = 0; t4 = 0;
      #1 t1 = 1; t2 = 0; t3 = 0; t4 = 1;
      #1 t1 = 1; t2 = 0; t3 = 1; t4 = 0;
      #1 t1 = 1; t2 = 0; t3 = 1; t4 = 1;
      #1 t1 = 1; t2 = 1; t3 = 0; t4 = 0;
      #1 t1 = 1; t2 = 1; t3 = 0; t4 = 1;
      #1 t1 = 1; t2 = 1; t3 = 1; t4 = 0;
      #1 t1 = 1; t2 = 1; t3 = 1; t4 = 1;

end


// TABLA_4 y TABLA_5
reg q1, q2, q3, q4;
wire led4, led5;

TABLA_4 G4(q1,q2,q3,q4, led4);
TABLA_5 G5(q1,q2,q3,q4, led5);

initial begin
  #24
  $display("\n");
  $display("A B C D | Y Y1");
  $display("--------|-----");
  $monitor("%b %b %b %b | %b %b", q1,q2,q3,q4, led4, led5);

      q1 = 0; q2 = 0; q3 = 0; q4 = 0;
      #1 q1 = 0; q2 = 0; q3 = 0; q4 = 1;
      #1 q1 = 0; q2 = 0; q3 = 1; q4 = 0;
      #1 q1 = 0; q2 = 0; q3 = 1; q4 = 1;
      #1 q1 = 0; q2 = 1; q3 = 0; q4 = 0;
      #1 q1 = 0; q2 = 1; q3 = 0; q4 = 1;
      #1 q1 = 0; q2 = 1; q3 = 1; q4 = 0;
      #1 q1 = 0; q2 = 1; q3 = 1; q4 = 1;
      #1 q1 = 1; q2 = 0; q3 = 0; q4 = 0;
      #1 q1 = 1; q2 = 0; q3 = 0; q4 = 1;
      #1 q1 = 1; q2 = 0; q3 = 1; q4 = 0;
      #1 q1 = 1; q2 = 0; q3 = 1; q4 = 1;
      #1 q1 = 1; q2 = 1; q3 = 0; q4 = 0;
      #1 q1 = 1; q2 = 1; q3 = 0; q4 = 1;
      #1 q1 = 1; q2 = 1; q3 = 1; q4 = 0;
      #1 q1 = 1; q2 = 1; q3 = 1; q4 = 1;

end


// TABLA_6
reg F1, F2, F3;
wire led6;

TABLA_6 G6(F1,F2,F3, led6);

initial begin
  #40
  $display("\n");
  $display("A B C | Y ");
  $display("------|---");
  $monitor("%b %b %b | %b", F1,F2,F3, led6);

  F1 = 0; F2 = 0; F3 = 0;
  #1 F1 = 0; F2 = 0; F3 = 1;
  #1 F1 = 0; F2 = 1; F3 = 0;
  #1 F1 = 0; F2 = 1; F3 = 1;
  #1 F1 = 1; F2 = 0; F3 = 0;
  #1 F1 = 1; F2 = 0; F3 = 1;
  #1 F1 = 1; F2 = 1; F3 = 0;
  #1 F1 = 1; F2 = 1; F3 = 1;

end


// TABLA_7
reg d1, d2, d3, d4;
wire led7;

TABLA_7 G7(d1,d2,d3,d4, led7);

initial begin
  #47
  $display("\n");
  $display("A B C D | Y");
  $display("--------|----");
  $monitor("%b %b %b %b | %b", d1,d2,d3,d4, led7);

      d1 = 0; d2 = 0; d3 = 0; d4 = 0;
      #1 d1 = 0; d2 = 0; d3 = 0; d4 = 1;
      #1 d1 = 0; d2 = 0; d3 = 1; d4 = 0;
      #1 d1 = 0; d2 = 0; d3 = 1; d4 = 1;
      #1 d1 = 0; d2 = 1; d3 = 0; d4 = 0;
      #1 d1 = 0; d2 = 1; d3 = 0; d4 = 1;
      #1 d1 = 0; d2 = 1; d3 = 1; d4 = 0;
      #1 d1 = 0; d2 = 1; d3 = 1; d4 = 1;
      #1 d1 = 1; d2 = 0; d3 = 0; d4 = 0;
      #1 d1 = 1; d2 = 0; d3 = 0; d4 = 1;
      #1 d1 = 1; d2 = 0; d3 = 1; d4 = 0;
      #1 d1 = 1; d2 = 0; d3 = 1; d4 = 1;
      #1 d1 = 1; d2 = 1; d3 = 0; d4 = 0;
      #1 d1 = 1; d2 = 1; d3 = 0; d4 = 1;
      #1 d1 = 1; d2 = 1; d3 = 1; d4 = 0;
      #1 d1 = 1; d2 = 1; d3 = 1; d4 = 1;

end


//TABLA_8
reg a1, a2, a3;
wire led8;

TABLA_8 G8(a1,a2,a3, led8);

initial begin
  #63
  $display("\n");
  $display("A B C | Y");
  $display("------|----");
  $monitor("%b %b %b | %b", a1,a2,a3, led8);

  a1 = 0; a2 = 0; a3 = 0;
  #1 a1 = 0; a2 = 0; a3 = 1;
  #1 a1 = 0; a2 = 1; a3 = 0;
  #1 a1 = 0; a2 = 1; a3 = 1;
  #1 a1 = 1; a2 = 0; a3 = 0;
  #1 a1 = 1; a2 = 0; a3 = 1;
  #1 a1 = 1; a2 = 1; a3 = 0;
  #1 a1 = 1; a2 = 1; a3 = 1;

end

initial
  #71 $finish;

initial begin
  $dumpfile("Lab_4_tb.vcd");
  $dumpvars(0, testbench);
end

endmodule
