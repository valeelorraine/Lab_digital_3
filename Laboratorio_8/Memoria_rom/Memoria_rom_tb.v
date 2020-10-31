// Universidad del Valle de Guatemala
// Valerie Valdez

//                         Electrónica digital
//                            Laboratorio 8


// Módulo para la memoria ROM
module testbench();

reg [11:0]address; // Dirección de almacenamiento
wire [7:0]D;// Variable de 7 bits para el módulo

//Llamar al módulo
Mrom A1(address, D);

initial begin
#1
$display("\n");
$display(" Memoria ROM ");
$display("\n");
$display("|----------------|------------|");
$display("|    address     |    Dato    |");
$display("|----------------|------------|");
$monitor("|  %b  |  %b  |", address, D);

// Se declaran las 10 diferentes direcciones
address = 12'b000000000000;
  #1 address = 12'b000000000001;
  #1 address = 12'b000000000010;
  #1 address = 12'b000000000011;
  #1 address = 12'b000000000100;
  #1 address = 12'056;9
  #1 address = 12'b000000000110;
  #1 address = 12'b000000000111;
  #1 address = 12'b000000001000;
  #1 address = 12'b000000001001;
  #1 address = 12'b000000001010;
  end

initial
#200 $finish;

//GTKwave
initial begin
  $dumpfile("Memoria_rom_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule
