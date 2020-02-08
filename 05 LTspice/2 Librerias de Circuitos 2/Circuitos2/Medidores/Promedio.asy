Version 4
SymbolType BLOCK
LINE Normal -48 16 80 16
LINE Normal -48 -16 80 -16
LINE Normal -48 0 -48 -16
LINE Normal -48 16 -48 0
LINE Normal 95 0 80 -16
LINE Normal 80 16 95 0
TEXT 21 1 Center 2 Promedio
WINDOW 0 -25 -33 Left 2
WINDOW 39 19 32 Center 2
SYMATTR SpiceLine periodo=1ms
SYMATTR Prefix x
SYMATTR Description Proporciona el valor medio de la señal de entrada. Es necesario ingresarle el período de la señal que se quiere promediar.
SYMATTR ModelFile ..\sym\Circuitos2\Medidores\promediador.cir
SYMATTR Value Promediador
PIN -48 0 NONE 8
PINATTR PinName in
PINATTR SpiceOrder 1
PIN 96 0 NONE 8
PINATTR PinName out
PINATTR SpiceOrder 2
