Version 4
SymbolType BLOCK
LINE Normal -24 0 -64 0
LINE Normal 8 0 48 0
LINE Normal 8 48 8 -48
LINE Normal -24 48 -24 -48
LINE Normal 9 0 -24 0
LINE Normal -3 0 -14 -6
LINE Normal -3 0 -14 6
LINE Normal -48 0 -48 64
ARC Normal -24 33 8 48 -19 40 8 41
ARC Normal -24 17 8 32 -19 24 8 25
ARC Normal -24 1 8 16 -19 8 8 9
ARC Normal -24 -1 8 -16 8 -9 -19 -8
ARC Normal -24 -17 8 -32 8 -25 -19 -24
ARC Normal -24 -33 8 -48 8 -41 -19 -40
TEXT -40 36 VLeft 1 Rel
WINDOW 3 0 -91 Center 2
WINDOW 123 48 -59 Center 2
WINDOW 0 94 38 Right 2
SYMATTR Value Lr=Le Ar=Ae
SYMATTR Value2 fd=1
SYMATTR Description Reluctor de un ENTREHIERRO cuyo valor se calcula mediante la expresión Re=Le/(u0*Ae*fd). ATENCIÓN:  Ingresar L en cm y A en cm^2.
SYMATTR ModelFile ..\sym\Circuitos2\Magneticos\magneticos.lib
SYMATTR Prefix X
SYMATTR SpiceModel entrehierro
PIN -64 0 NONE 8
PINATTR PinName 1
PINATTR SpiceOrder 1
PIN 48 0 NONE 8
PINATTR PinName 2
PINATTR SpiceOrder 2
PIN -48 64 NONE 8
PINATTR PinName 3
PINATTR SpiceOrder 3
