// Valerie Valdez
// Universidad del Valle de Guatemala

//                    Electrónica digital
//                      Proyecto final


// Implementación de la memoria ROM de 4Kx8
module Mrom(input wire [11:0]address,
  output wire [7:0]D); // Tamaño del dato de 8 bits

  reg[7:0] Mrom[4095:0]; // Ancho y localidades de memoria

  initial begin // Inicializar la memoria
    $readmemh("memory.list", Mrom); // Leer los valores de la lista en binario
  end

  assign D = Mrom[address]; // Asignarle el valor en la dirección dada
endmodule

//Flip Flop de 1 bit
module flipflopD(
	input wire clk, reset, D, enable, output reg Q);

	always @ (posedge clk, posedge reset, enable) begin
		if (reset) begin
			Q <= 1'b0;
		end
		else if (enable) begin
			Q <= D;
		end
	end
endmodule


//Instanciación para conformar el Phase (FFD1)
module phase(input wire clk, reset, enable, output wire q);
	wire d;
	assign d = ~q;
	flipflopD f1(clk, reset, d, enable, q);
endmodule


// Flip Flop 4 bits tipo D de 4 bits con reset síncrono
module FFD4(input wire clk, reset, EN,
  input wire [3:0]C,
  output reg [3:0]D);

  always @ (posedge clk, posedge reset) begin // Count on the rising edge of the clk

      if(reset) begin // En caso de reset colocar todas las salidas en 0
        D <= 4'b0;
      end

      else if (EN) begin // Entrada igual a la salida
        D <= C;
      end
  end
endmodule


// Instanciación para un FFD de 8 bits
module FETCH(input wire clk, reset, EN, input wire [7:0]D, output wire[3:0]instr, oprnd);

  FFD4 A1(clk, reset, EN, D[7:4], instr); // bits más significativos
  FFD4 B1(clk, reset, EN, D[3:0], oprnd); // bits menos significativos
endmodule


// Program Counter
// Contador de 12 bits con un enable y capaz de hacer un load
module contador(input wire clk, rst, EN, blo,
  input wire [11:0]load,
  output reg [11:0]val);

    always @(posedge clk or posedge rst) begin // Non-blocking assigment

      if(rst == 1) begin // Colocar todos los valores en 0
        val <= 12'b0;
        end

      else if(EN == 1) begin //Enabled encendido cuenta en cada flanco de reloj
        val <= val + 1;
        end
      else if(blo == 1) begin // Blo encendido entonces Load comienza a contar
        val <= load;
        end
    end
endmodule


// Módulo acumulador: Flip Flop tipo D de 4 bits
module ACCUMULATOR(input wire clk, reset, EN,
  input wire [3:0]ALU,
  output reg [3:0]ACCU);

  always @ (posedge clk, posedge reset) begin // Count on the rising edge of the clk

      if(reset) begin // En caso de reset colocar todas las salidas en 0
        ACCU <= 4'b0;
      end

      else if (EN) begin // Entrada igual a la salida
        ACCU <= ALU;
      end
  end
endmodule


// Módulo Buffer triestado
module BT(input wire EN,
  input wire [3:0]I,
  output wire [3:0]Y); // Salida de 4 bits del buffer

  assign Y = (EN) ? I : 4'bz; // Cuando EN = 0 la salida está en alta impedancia
endmodule


// Módulo ALU
module ALUU(input wire [3:0]ACCU,
  input wire [3:0]BUFFER,
  input wire [2:0]S,
  output wire [3:0]SAL,
  output wire C, ZERO);

  reg [4:0]OF; // el 5to bit es por si hay un overflow

  always @ (ACCU, BUFFER, S) begin
    case(S)
      3'b000: OF <= ACCU;
      3'b001: OF <= ACCU - BUFFER;
      3'b010: OF <= BUFFER;
      3'b011: OF <= ACCU + BUFFER;
      3'b100: OF <= {1'b0, (ACCU ~| BUFFER)}; // Despreciar el primer bit en el NAND
      default: OF <= 5'b00000; // Si no es alguna operación la salida es igual a 0
    endcase
  end
  assign SAL = OF[3:0];
  assign C = OF[4];
  assign ZERO = (OF[3:0] == 5'B00000) ? 1:0;
endmodule


module Decoder(input wire [3:0]instr, input wire c_flag, z_flag, phase,
              output wire loadA, loadPC, loadFlags, incPC, output wire[2:0]S, output wire csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut);

              reg [12:0] shuppatsu;
              wire [6:0] entori;

              always @ (entori) begin
                  casez (entori) //Establecer condiciones

                      7'bzzzzzz0: shuppatsu <= 13'b1000000001000; //Any
                      7'b00001z1: shuppatsu <= 13'b0100000001000; // JC
                      7'b00000z1: shuppatsu <= 13'b1000000001000;
                      7'b00011z1: shuppatsu <= 13'b1000000001000; // JNC
                      7'b00010z1: shuppatsu <= 13'b0100000001000; //CMPI
                      7'b0010zz1: shuppatsu <= 13'b0001001000010;
                      7'b0011zz1: shuppatsu <= 13'b1001001100000; //CMPM
                      7'b0100zz1: shuppatsu <= 13'b0011010000010; // LIT
                      7'b0101zz1: shuppatsu <= 13'b0011010000100; // IN
                      7'b0110zz1: shuppatsu <= 13'b1011010100000; // LD
                      7'b0111zz1: shuppatsu <= 13'b1000000111000; // ST
                      7'b1000z11: shuppatsu <= 13'b0100000001000; // JZ
                      7'b1000z01: shuppatsu <= 13'b1000000001000;
                      7'b1001z11: shuppatsu <= 13'b1000000001000; //JNZ
                      7'b1001z01: shuppatsu <= 13'b0100000001000;
                      7'b1010zz1: shuppatsu <= 13'b0011011000010; //ADDI
                      7'b1011zz1: shuppatsu <= 13'b1011011100000; //ADDM
                      7'b1100zz1: shuppatsu <= 13'b0100000001000; // JMP
                      7'b1101zz1: shuppatsu <= 13'b0000000001001; // OUT
                      7'b1110zz1: shuppatsu <= 13'b0011100000010; // NANDI
                      7'b1111zz1: shuppatsu <= 13'b1011100100000; //NANDM

                      default: shuppatsu <= 13'b0000000000000;
                    endcase
                  end

// Asignación de las variables que conforman la salida
              assign incPC = shuppatsu[12];
              assign loadPC = shuppatsu[11];
              assign loadA = shuppatsu[10];
              assign loadFlags = shuppatsu[9];
              assign S = shuppatsu[8:6];
              assign csRAM = shuppatsu[5];
              assign weRAM = shuppatsu[4];
              assign oeALU = shuppatsu[3];
              assign oeIN = shuppatsu[2];
              assign oeOprnd = shuppatsu[1];
              assign loadOut = shuppatsu[0];

// Asignación de las variables que conforman la entrada
              assign entori[6:3] = instr;
              assign entori[2] = c_flag;
              assign entori[1] = z_flag ;
              assign entori[0] = phase;
endmodule


module RAM (inout [3:0]data_bus,
        input weRAM,
        input csRAM,
        input [11:0]address);
        reg [3:0]salida;
        reg[3:0]ram [4095:0];

        assign data_bus = (csRAM && !weRAM) ? salida : 4'bz;

        always @(address or data_bus or weRAM or csRAM)
        begin
            if (csRAM && weRAM) begin
                ram[address] <= data_bus;
            end

            else if (csRAM && !weRAM) begin
              salida <= ram[address];
            end
        end
endmodule


//Instanciación de módulos
// Procesador completo
  module uP (
  	input 	clock,
  	input 	reset,
  	input 	[3:0]pushbuttons,
  	output 	phase, c_flag, z_flag,
  	output 	[3:0]instr, oprnd, data_bus, FF_out, accu,
  	output 	[7:0]program_byte,
  	output 	[11:0]PC, address_RAM);

    wire [2:0]Sel;
    wire c, Zero, loadA, loadPC, loadFlags, csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut, incPC;
    wire [3:0]alu_out;

// Asignación para los cables internos que conforman el PB
    assign address_RAM[11:8] = oprnd;
    assign address_RAM[7:0] = program_byte;

    Mrom Program_Rom(
      .address (PC),
      .D (program_byte));

    phase Phase(
      .clk (clock),
      .reset (reset),
      .enable (1'b1),
      .q (phase));

    flipflopD C_flag(
      .clk (clock),
      .reset (reset),
      .enable (loadFlags),
      .D (c),
      .Q (c_flag));

    flipflopD Zflag(
      .clk (clock),
      .reset (reset),
      .enable (loadFlags),
      .D (Zero),
      .Q (z_flag));

    FETCH Fetch(
      .clk (clock),
      .reset (reset),
      .EN (~phase),
      .D (program_byte),
      .instr (instr),
      .oprnd (oprnd));

    contador Contador(
      .clk (clock),
      .rst (reset),
      .EN (incPC),
      .blo (loadPC),
      .load(address_RAM),
      .val (PC));

    ACCUMULATOR Acumulator(
      .clk (clock),
      .reset (reset),
      .EN (loadA),
      .ALU (alu_out),
      .ACCU (accu));

// Bus que sale de la ALU
    BT Bus_driverA(
      .EN(oeALU),
      .I (alu_out),
      .Y (data_bus));

// Bus del FETCH
    BT Bus_driveF(
      .EN (oeOprnd),
      .I (oprnd),
      .Y (data_bus));

// Bus de entrada
    BT IN(
      .EN (oeIN),
      .I (pushbuttons),
      .Y (data_bus));

    ALUU ALU(
      .ACCU (accu),
      .BUFFER (data_bus),
      .S (Sel),
      .SAL (alu_out),
      .C (c),
      .ZERO (Zero));

    Decoder decode(
      .instr (instr),
      .c_flag (c_flag),
      .z_flag (z_flag),
      .phase (phase),
      .loadA (loadA),
      .loadPC (loadPC),
      .loadFlags (loadFlags),
      .incPC (incPC),
      .S (Sel),
      .csRAM (csRAM),
      .weRAM (weRAM),
      .oeALU (oeALU),
      .oeIN (oeIN),
      .oeOprnd (oeOprnd),
      .loadOut (loadOut));

    RAM Ram(
      .data_bus (data_bus),
      .csRAM (csRAM),
      .weRAM (weRAM),
      .address (address_RAM));

//FF para la salida
    FFD4 Out(
      .clk (clock),
      .reset (reset),
      .EN (loadOut),
      .C (data_bus),
      .D (FF_out));

endmodule
