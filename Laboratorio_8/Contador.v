// Universidad del Valle de Guatemala
// Valerie Valdez

//                         Electrónica digital
//                            Laboratorio 8


// Implementar un contador de 12 bits con un enable y capaz de hacer un load

module contador(clk, rst, en, load, blo, val);
  input clk, rst, en, load, blo;
  output [11:0]val; //Salida de 12 bits

  reg[11:0] val;
  reg[11:0] load; // Bus de carga

  always @(posedge clk or  posedge rst or posedge blo)
  if(rst == 1) val = 0;
  else if(en = 1) val = val + 1; //Enabled encendido cuenta en cada flanco de reloj
  else if(blo = 1) val = load // Blo encendido entonces Load comienza a contar

endmodule
