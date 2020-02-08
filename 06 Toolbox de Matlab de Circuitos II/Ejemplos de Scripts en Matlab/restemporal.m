% RESTEMPORAL. Grafica la respuesta al escalón de una
% transferencia y encuentra el tiempo de crecimiento, tiempo del pico
% porcentaje de sobrepaso y el tiempo de establecimiento.
% El tiempo de crecimiento es el tiempo para que la respuesta
% vaya del 10% al 90% del su valor final.

% * Teoría de Circuitos II * . Departamento de Electrónica.
%   Facultad de Ingeniería. Universidad Nacional de la Patagonia SJB
%   6 de octubre de 2011. Version 1.

% Transferencia del circuito analizado en LTspice
num = [1];
den = [1e-15 15e-9 1];
t = 0:0.0001e-6:1e-6;
cir=tf(num,den);
printsys(num,den,'s')
figure(1)
step(cir)
[y,t] = step(num,den,t);
grid
title('Respuesta al escalón')
xlabel('Tiempo [s]')
ylabel('Respuesta r(t)')
% Determinación de tiempo de retardo
TD = 1; while y(TD) < 0.5, TD = TD+1; end;
TiempoRetardo = TD*0.0001e-6
% Determinación del tiempo de crecimiento
T1 = 1; while y(T1) < 0.1, T1 = T1+1; end;
T2 = 1; while y(T2) < 0.9, T2 = T2+1; end;
TiempoCrecimiento = (T2-T1)*0.0001e-6
% Determinación del sobrepaso y el tiempo del pico
[ymax,tp] = max(y);
TiempoPico = (tp-1)*0.0001e-6
Sobrepaso = ymax-1;
PorcentajeSobrepaso=Sobrepaso*100
% Determinación del tiempo de establecimiento
s = 10001; while y(s) > 0.99 & y(s) < 1.01; s = s-1; end;
TiempoEstablecimiento = (s-1)*0.0001e-6

% Otro ejemplo
%num = [100];
%den = [1 14.14 100];
