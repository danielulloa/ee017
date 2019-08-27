Version 4
SymbolType BLOCK
LINE Normal 0 -8 0 -48
LINE Normal 0 24 0 64
LINE Normal 48 24 -48 24
LINE Normal 48 -8 -48 -8
LINE Normal 0 25 0 -8
LINE Normal 0 13 -6 2
LINE Normal 0 13 6 2
LINE Normal 0 -32 64 -32
ARC Normal 33 -8 48 24 41 24 40 -3
ARC Normal 17 -8 32 24 25 24 24 -3
ARC Normal 1 -8 16 24 9 24 8 -3
ARC Normal -1 -8 -16 24 -8 -3 -9 24
ARC Normal -17 -8 -32 24 -24 -3 -25 24
ARC Normal -33 -8 -48 24 -40 -3 -41 24
TEXT 36 -24 Right 1 Rel
WINDOW 3 -161 17 Center 2
WINDOW 123 -108 -16 Center 2
WINDOW 0 -83 49 Right 2
SYMATTR Value Lr=Le Ar=Ae
SYMATTR Value2 fd=1
SYMATTR Description Reluctor de un ENTREHIERRO cuyo valor se calcula mediante la expresión Re=Le/(u0*Ae*fd). ATENCIÓN:  Ingresar L en cm y A en cm^2.
SYMATTR ModelFile ..\sym\Circuitos2\Magneticos\magneticos.lib
SYMATTR Prefix X
SYMATTR SpiceModel entrehierro
PIN 0 -48 NONE 8
PINATTR PinName 1
PINATTR SpiceOrder 1
PIN 0 64 NONE 8
PINATTR PinName 2
PINATTR SpiceOrder 2
PIN 64 -32 NONE 8
PINATTR PinName 3
PINATTR SpiceOrder 3
