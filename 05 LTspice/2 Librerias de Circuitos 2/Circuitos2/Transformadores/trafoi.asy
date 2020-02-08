Version 4
SymbolType CELL
LINE Normal -48 48 -48 80
LINE Normal -32 48 -48 48
LINE Normal 48 48 32 48
LINE Normal -32 -32 -48 -32
LINE Normal 48 -32 32 -32
LINE Normal -48 -64 -48 -32
LINE Normal 48 -64 48 -32
LINE Normal 48 48 48 80
LINE Normal -64 39 -64 -25
LINE Normal -70 29 -64 39
LINE Normal -58 29 -64 39
LINE Normal 64 -25 64 39
LINE Normal 70 -15 64 -25
LINE Normal 58 -15 64 -25
ARC Normal -48 -8 -16 24 -44 20 -44 -4
ARC Normal -48 16 -16 48 -32 48 -44 20
ARC Normal -48 -32 -16 0 -44 -4 -32 -32
ARC Normal 48 -8 16 24 44 -4 44 20
ARC Normal 48 16 16 48 44 20 32 48
ARC Normal 48 -32 16 0 32 -32 44 -4
TEXT -76 -45 Left 2 1°
TEXT 59 -46 Left 2 2°
WINDOW 39 -2 -59 Center 2
SYMATTR SpiceLine n=1
SYMATTR Prefix X
SYMATTR Description Transformador ideal n=Vs/Vp. I1 entra, I2 sale Las relaciones constitutivas son: V2=n*V1 ; I2= I1/n
SYMATTR SpiceModel TFI
SYMATTR Value TFI
SYMATTR ModelFile ..\sym\Circuitos2\Transformadores\trafosideales.lib
PIN -48 -64 NONE 0
PINATTR PinName 1
PINATTR SpiceOrder 1
PIN -48 80 NONE 0
PINATTR PinName 2
PINATTR SpiceOrder 2
PIN 48 -64 NONE 0
PINATTR PinName 3
PINATTR SpiceOrder 3
PIN 48 80 NONE 0
PINATTR PinName 4
PINATTR SpiceOrder 4
