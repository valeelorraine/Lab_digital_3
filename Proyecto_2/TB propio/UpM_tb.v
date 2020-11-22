// Universidad del Valle de Guatemala
// Valerie Valdez

// Módulo del testbench

module testbench();
  reg clock, reset;
  reg [3:0] pushbuttons;
  wire phase, c_flag, z_flag;
  wire [3:0] instr, oprnd, accu, data_bus, FF_out;
  wire [7:0] program_byte;
  wire [11:0] PC, address_RAM;

  // Reloj de una unidad de tiempo con cambio en el flanco
  always
      #1 clock = ~clock;

// Instanciación del módulo
  uP procesador(.clock (clock),
                .reset(reset),
                .pushbuttons(pushbuttons),
                .phase(phase),
                .c_flag(c_flag),
                .z_flag(z_flag),
                .instr(instr),
                .oprnd(oprnd),
                .accu(accu),
                .data_bus(data_bus),
                .FF_out(FF_out),
                .program_byte(program_byte),
                .PC(PC),
                .address_RAM(address_RAM));


    initial begin
    #1
    $display("\n");
    $display(" Proyecto final ");
    $display("\n");
    $display("-----------------------|---------------------------------------------------------------------------------------------|");
    $display("Clk reset pushbuttons  | phase cFlag ZFlag  Instr  Oprnd  accu   data   Out   Program_byte    PC          Addres_RAM |");
    $display("-----------------------|---------------------------------------------------------------------------------------------|");
    $monitor(" %b    %b        %b     |   %b     %b     %b    %b    %b  %b   %b   %b   %b  %b   %b |", clock, reset, pushbuttons, phase, c_flag, z_flag, instr, oprnd, accu, data_bus, FF_out, program_byte, PC, address_RAM);

    #1 clock = 0; reset = 0; pushbuttons = 4'b0110;
    #1 reset = 1;
    #1 pushbuttons = 4'b1100;
    #1 reset = 0; pushbuttons = 4'b1000;;

    end

    initial
      #50 $finish;

// GTKwave para el diagrama de timing
  initial begin
  $dumpfile("UpM_tb.vcd");
  $dumpvars(0, testbench);
  end
  endmodule
