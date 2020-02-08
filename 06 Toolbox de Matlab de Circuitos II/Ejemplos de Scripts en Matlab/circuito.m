% Este archivo sirve para ilustrar
% el método de los nodos con circuitos
% de corriente alterna

% © Copyright 2014. * Teoría de Circuitos II * . Departamento de Electrónica.
%   Facultad de Ingeniería. Universidad Nacional de la Patagonia SJB
%   5 de Agosto de 2014. Version 1.0

%En Matlab las matrices se ingresan como filas.
%El punto y coma: ; actúa como separador de filas
%
% Impedancias de las ramas

z1=j*1;
z2=j*1;
z3=j*2;
z4=j*1;
z5=j*1;
z6=j*1.25;
z7=j*1.25;
z8=j*5;

% Equivalente Norton de los generadores de tensión
ig1=100/z1;ig2=100*exp(-j*5*pi/180)/z5;

% Vector de los Generadores

In=[ig1;0;0;ig2]

% Matriz de Nodos

Yn=[1/z1+1/z2+1/z3+1/z6 -1/z6 -1/z2 -1/z3;
-1/z6 1/z6+1/z7+1/z8 -1/z7 0;
-1/z2 -1/z7 1/z2+1/z4+1/z7 -1/z4;
 -1/z3 0 -1/z4 1/z3+1/z4+1/z5];

% Vector calculado de las tensiones de Nodo
%Vn=Yn^-1*In; La siguiente es la forma
% preferida para exactitud por Matlab
Vn=Yn\In;

V1=Vn(1)
V2=Vn(2)
V3=Vn(3)
V4=Vn(4)

I1=(100-V1)/z1
I2=(100*exp(-j*5*pi/180)-V4)/z5
I3=V2/z8

% Presentación de los resultados
fprintf('\n')
cprintf([1,0,0.1], '* Corriente I1\n');
cprintf([0,0,1],' I1 = %g% +g*j \n', real(I1),imag(I1));
cprintf([0,0,1],' I1 = %g /_ %g° \n',abs(I1),angle(I1)*180/pi)
fprintf('\n')
fprintf('\r')

% Se muestra la figura del circuito
% y los resultados obtenidos en LTspice
% utilizando la función figura que sirve para mostrar
% un archivo de imagen obtenido desde LTspice. El archivo
% de imagen deben acompañar este archivo de instrucciones (script, archivo m)
figura('ej4.png')