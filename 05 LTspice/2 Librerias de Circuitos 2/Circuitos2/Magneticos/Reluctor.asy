Version 4
SymbolType BLOCK
LINE Normal 0 -64 0 -48
LINE Normal 0 48 0 32
LINE Normal 32 -48 16 -48
LINE Normal -32 32 -16 32
LINE Normal 16 -48 -16 -48
LINE Normal 16 32 16 -48
LINE Normal -16 32 16 32
LINE Normal -16 -48 -16 32
LINE Normal 0 -33 -4 -43
LINE Normal 0 -33 4 -43
LINE Normal 0 -33 -4 -43
LINE Normal 0 -33 4 -43
LINE Normal 16 -16 64 -16
TEXT 45 -8 Right 1 Rel
WINDOW 3 -101 1 Center 2
WINDOW 123 -92 -34 Center 2
WINDOW 0 25 52 Left 2
SYMATTR Value Lr=L1 Ar=A1
SYMATTR Value2 ur=ur fd=1
SYMATTR Description Reluctor LINEAL cuyo valor se calcula mediante la expresión R=L/(u0*ur*A*fd) con salida de su valor. ATENCIÓN:  Ingresar L en cm y A en cm^2.
SYMATTR ModelFile ..\sym\Circuitos2\Magneticos\magneticos.lib
SYMATTR Prefix X
SYMATTR SpiceModel reluctor
PIN 0 -64 NONE 8
PINATTR PinName 1
PINATTR SpiceOrder 1
PIN 0 48 NONE 8
PINATTR PinName 2
PINATTR SpiceOrder 2
PIN 64 -16 NONE 8
PINATTR PinName 3
PINATTR SpiceOrder 3
