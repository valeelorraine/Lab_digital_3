// Universidad del Valle de Guatemala
// Valerie Valdez

//                         Electrónica digital
//                            Laboratorio 8
//                          Testbench contador

initial begin
  rst = 1'b0
  repeat(2)
  @(posedge clk) #1;
  rst = 1'b1;
  @(posedge clk) #1;
  rst = 1'b0;
end
