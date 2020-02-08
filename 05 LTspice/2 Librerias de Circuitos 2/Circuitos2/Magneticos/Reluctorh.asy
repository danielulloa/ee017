Version 4
SymbolType BLOCK
LINE Normal -48 0 -32 0
LINE Normal 64 0 48 0
LINE Normal -32 32 -32 16
LINE Normal 48 -32 48 -16
LINE Normal -32 16 -32 -16
LINE Normal 48 16 -32 16
LINE Normal 48 -16 48 16
LINE Normal -32 -16 48 -16
LINE Normal -17 0 -27 -4
LINE Normal -17 0 -27 4
LINE Normal -17 0 -27 -4
LINE Normal -17 0 -27 4
LINE Normal 0 16 0 64
TEXT 8 45 VLeft 1 Rel
WINDOW 3 13 -77 Center 2
WINDOW 123 9 -50 Center 2
WINDOW 0 98 41 Right 2
SYMATTR Value Lr=L1 Ar=A1
SYMATTR Value2 ur=ur fd=1
SYMATTR Description Reluctor LINEAL cuyo valor se calcula mediante la expresión R=L/(u0*ur*A*fd) con salida de su valor. ATENCIÓN:  Ingresar L en cm y A en cm^2.
SYMATTR ModelFile ..\sym\Circuitos2\Magneticos\magneticos.lib
SYMATTR Prefix X
SYMATTR SpiceModel reluctor
PIN -48 0 NONE 8
PINATTR PinName 1
PINATTR SpiceOrder 1
PIN 64 0 NONE 8
PINATTR PinName 2
PINATTR SpiceOrder 2
PIN 0 64 NONE 8
PINATTR PinName 3
PINATTR SpiceOrder 3
