// Electrónica digital
// Laboratorio 4
// Problema 5
// ------------------------Valerie Valdez 19659------------------------

module problema_5_tb();

// TABLA_SOP_GLM
reg a1, a2, a3;
wire led1;

TABLA_SOP_GLM G1(a1,a2,a3, led1);

initial begin
  $display("\n");
  $display("TABLA SOP");
  $display("\n");
  $display("A B C | Y");
  $display("------|---");
  $monitor("%b %b %b | %b", a1,a2,a3, led1);

  a1 = 0; a2 = 0; a3 = 0;
  #1 a1 = 0; a2 = 0; a3 = 1;
  #1 a1 = 0; a2 = 1; a3 = 0;
  #1 a1 = 0; a2 = 1; a3 = 1;
  #1 a1 = 1; a2 = 0; a3 = 0;
  #1 a1 = 1; a2 = 0; a3 = 1;
  #1 a1 = 1; a2 = 1; a3 = 0;
  #1 a1 = 1; a2 = 1; a3 = 1;

  end


// Tabla_SOP_BM
reg b1, b2, b3;
wire led2;

  TABLA_SOP_BM G2(b1,b2,b3, led2);

  initial begin
    #9
    $display("\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", b1,b2,b3, led2);

    b1 = 0; b2 = 0; b3 = 0;
    #1 b1 = 0; b2 = 0; b3 = 1;
    #1 b1 = 0; b2 = 1; b3 = 0;
    #1 b1 = 0; b2 = 1; b3 = 1;
    #1 b1 = 1; b2 = 0; b3 = 0;
    #1 b1 = 1; b2 = 0; b3 = 1;
    #1 b1 = 1; b2 = 1; b3 = 0;
    #1 b1 = 1; b2 = 1; b3 = 1;

  end


//Tabla Pos con Gate Level modeling
reg c1, c2, c3;
wire led3;

  TABLA_POS_GLM G3(c1,c2,c3, led3);

  initial begin
    #17
    $display("\n");
    $display("TABLA POS");
    $display("\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", c1,c2,c3, led3);

    c1 = 0; c2 = 0; c3 = 0;
    #1 c1 = 0; c2 = 0; c3 = 1;
    #1 c1 = 0; c2 = 1; c3 = 0;
    #1 c1 = 0; c2 = 1; c3 = 1;
    #1 c1 = 1; c2 = 0; c3 = 0;
    #1 c1 = 1; c2 = 0; c3 = 1;
    #1 c1 = 1; c2 = 1; c3 = 0;
    #1 c1 = 1; c2 = 1; c3 = 1;

end


//Tabla Pos con Behavioral Modelling
reg d1, d2, d3;
wire led4;

  TABLA_POS_BM G4(d1,d2,d3, led4);

  initial begin
    #25
    $display("\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", d1,d2,d3, led4);

    d1 = 0; d2 = 0; d3 = 0;
    #1 d1 = 0; d2 = 0; d3 = 1;
    #1 d1 = 0; d2 = 1; d3 = 0;
    #1 d1 = 0; d2 = 1; d3 = 1;
    #1 d1 = 1; d2 = 0; d3 = 0;
    #1 d1 = 1; d2 = 0; d3 = 1;
    #1 d1 = 1; d2 = 1; d3 = 0;
    #1 d1 = 1; d2 = 1; d3 = 1;

    end


// Tabla ecuación minimizada con Gate Level modeling
reg e1, e2, e3;
wire led5;

  TABLA_MIN_GLM G5(e1,e2,e3, led5);

  initial begin
    #33
    $display("\n");
    $display("Tabla: ecuacion minimizada");
    $display("\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", e1,e2,e3, led5);

    e1 = 0; e2 = 0; e3 = 0;
    #1 e1 = 0; e2 = 0; e3 = 1;
    #1 e1 = 0; e2 = 1; e3 = 0;
    #1 e1 = 0; e2 = 1; e3 = 1;
    #1 e1 = 1; e2 = 0; e3 = 0;
    #1 e1 = 1; e2 = 0; e3 = 1;
    #1 e1 = 1; e2 = 1; e3 = 0;
    #1 e1 = 1; e2 = 1; e3 = 1;

    end


// Tabla ecuación minimizada con Behavioral Modeling
reg f1, f2, f3;
wire led6;

  TABLA_MIN_BM G6(f1,f2,f3, led6);

  initial begin
    #41
    $display("\n");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", f1,f2,f3, led6);

    f1 = 0; f2 = 0; f3 = 0;
    #1 f1 = 0; f2 = 0; f3 = 1;
    #1 f1 = 0; f2 = 1; f3 = 0;
    #1 f1 = 0; f2 = 1; f3 = 1;
    #1 f1 = 1; f2 = 0; f3 = 0;
    #1 f1 = 1; f2 = 0; f3 = 1;
    #1 f1 = 1; f2 = 1; f3 = 0;
    #1 f1 = 1; f2 = 1; f3 = 1;

    end

    initial
      #49 $finish;

      initial begin
        $dumpfile("Problema_5_tb.vcd");
        $dumpvars(0, problema_5_tb);
        end

  endmodule
