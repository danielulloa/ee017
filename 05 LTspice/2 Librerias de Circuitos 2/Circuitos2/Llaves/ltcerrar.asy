Version 4
SymbolType BLOCK
LINE Normal 48 0 13 0
LINE Normal -48 0 -16 0
LINE Normal 12 -15 -16 0
LINE Normal 1 2 4 5
LINE Normal 7 2 4 5
ARC Normal -15 9 6 -13 9 7 -7 -15
WINDOW 39 2 20 Center 2
SYMATTR SpiceLine tcerrar=0
SYMATTR ModelFile ..\sym\Circuitos2\Llaves\llaves.lib
SYMATTR Prefix X
SYMATTR SpiceModel Ltcerrar
SYMATTR Value Ltcerrar
SYMATTR SpiceLine2 ttran=1u Rclosed=1m Ropen=1T
SYMATTR Description Es una llave que se cierra en el tiempo prefijado tcerrar. Ltcerrar equivale a swtclose de Pspice
PIN -48 0 NONE 8
PINATTR PinName 1
PINATTR SpiceOrder 1
PIN 48 0 NONE 8
PINATTR PinName 2
PINATTR SpiceOrder 2
