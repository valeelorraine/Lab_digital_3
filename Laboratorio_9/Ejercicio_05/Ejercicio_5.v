// Electrónica digital
// Valerie Valdez 19659

//                             Laboratorio #09
//                              Ejercicio 05

// Implementación de la tabla como memoria ROM utilizando case

module MROM(input wire EN,
            input wire [6:0]entori,
            output reg [12:0]shuppatsu);

              always @ (EN or entori)begin
                  shuppatsu = 0; //Salidas en 0
                if (EN)
                    casex (entori) //Establecer condiciones

//               Combinaciones provenientes de la tabla proporcionada
                      7'bxxxxxx0: shuppatsu <= 13'b1000000001000;
                      7'b00001x1: shuppatsu <= 13'b0100000001000;
                      7'b00000x1: shuppatsu <= 13'b1000000001000;
                      7'b00011x1: shuppatsu <= 13'b1000000001000;
                      7'b00010x1: shuppatsu <= 13'b0100000001000;
                      7'b0010xx1: shuppatsu <= 13'b0001001000010;
                      7'b0011xx1: shuppatsu <= 13'b1001001100000;
                      7'b0100xx1: shuppatsu <= 13'b0011010000010;
                      7'b0101xx1: shuppatsu <= 13'b0011010000100;
                      7'b0110xx1: shuppatsu <= 13'b1011010100000;
                      7'b0111xx1: shuppatsu <= 13'b1000000111000;
                      7'b1000x11: shuppatsu <= 13'b0100000001000;
                      7'b1000x01: shuppatsu <= 13'b1000000001000;
                      7'b1001x11: shuppatsu <= 13'b1000000001000;
                      7'b1001x01: shuppatsu <= 13'b0100000001000;
                      7'b1010xx1: shuppatsu <= 13'b0011011000010;
                      7'b1011xx1: shuppatsu <= 13'b1011011100000;
                      7'b1100xx1: shuppatsu <= 13'b0100000001000;
                      7'b1101xx1: shuppatsu <= 13'b0000000001001;
                      7'b1110xx1: shuppatsu <= 13'b0011100000010;
                      7'b1111xx1: shuppatsu <= 13'b1011100100000;

                    endcase
              end
endmodule
