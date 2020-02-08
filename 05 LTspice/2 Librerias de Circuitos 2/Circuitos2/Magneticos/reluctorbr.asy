Version 4
SymbolType BLOCK
LINE Normal -32 -64 -32 -48
LINE Normal -32 48 -32 32
LINE Normal 0 -56 -48 -44
LINE Normal -96 48 -16 28
LINE Normal -48 36 -48 -44
LINE Normal -16 -52 -16 28
LINE Normal -16 -32 16 -32
LINE Normal -32 -31 -36 -41
LINE Normal -16 16 16 16
LINE Normal -32 -31 -28 -41
LINE Normal -112 48 -96 48
TEXT -2 -40 Left 1 B
TEXT -2 8 Left 1 H
TEXT -46 -6 Left 2 Br
TEXT -96 32 Left 1 Rel
WINDOW 3 -158 1 Center 2
WINDOW 0 -134 -36 Left 2
SYMATTR Value Lr=L1 Ar=A1
SYMATTR Description Reluctor no lineal GENÉRICO al cual se le pueden ingresar los tres coeficientes k1, k2 y k3 de la aproximación de Brauer. Proporciona los valores de B y H en su punto de trabajo. ATENCIÓN: Ingresar L en cm y A en cm^2
SYMATTR ModelFile ..\sym\Circuitos2\Magneticos\magneticos.lib
SYMATTR Prefix X
SYMATTR SpiceModel reluctorbr
SYMATTR Value2 k1=7.3041 k2=2.4337 k3=40.8126
PIN -32 -64 NONE 8
PINATTR PinName 1
PINATTR SpiceOrder 1
PIN -32 48 NONE 8
PINATTR PinName 2
PINATTR SpiceOrder 2
PIN 16 -32 NONE 8
PINATTR PinName 3
PINATTR SpiceOrder 3
PIN 16 16 NONE 8
PINATTR PinName 4
PINATTR SpiceOrder 4
PIN -112 48 NONE 8
PINATTR PinName 5
PINATTR SpiceOrder 5
