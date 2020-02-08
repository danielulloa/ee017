% Determinaci�n de la funci�n de transferencia
% de un filtro doble T pasivo en forma simb�lica
% y luego n�merica. Se grafican adem�s los polos y ceros
% del sistema que es de 3� orden.
%
%
% Se declaran como simb�licas las variables que se utilizan
syms V1 V2 V3 V4 s R C
e1 = V2*( 1/R + s*C)- s*C*V3- V4/R;
e2 = V3*( 2/R + 2*s*C)- s*C*V1- s*C*V2;
e3 = V4*( 2/R + 2*s*C) - V1/R- V2/R;
% Soluci�n de las ecuaciones
solu = solve(e1,e2,e3,V2,V3,V4);
% expand(solu.V2/V1)
Hs = simplify(solu.V2/V1)
 pretty(Hs)

% Resultado:
% Hs =
%  

%         2  2  2 
%        C  R  s  + 1 
%  ---------------------- 
%     2  2  2 
%    C  R  s  + 4 C R s + 1

%   * Teor�a de Circuitos II * . Departamento de Electr�nica.
%   Facultad de Ingenier�a. Universidad Nacional de la Patagonia SJB
%   23 de Octubre de 2012 


% Se declaran como simb�licas las variables que se utilizan

syms V1 V2 V3 V4 s R1 R2 R3 C1 C2 C3
e1 = V2*( 1/R2 + s*C2)- s*C2*V3- V4/R2;
e2 = V3*( 1/R3 + s*C1+ s*C2)- s*C1*V1- s*C2*V2;
e3 = V4*( 1/R1 +1/R2 + s*C3) - V1/R1- V2/R2;
% Soluci�n de las ecuaciones
solu = solve(e1,e2,e3,V2,V3,V4);
% expand(solu.V2/V1)
Hs = simplify(solu.V2/V1)
 pretty(Hs)
 
 % Con valores
 C1 = 100.e-9;
 C2 = 100e-9;
 C3 = 200e-9;
R1 = 31.6e3;
R2 = 31.6e3;
R3 = 15.8e3;

Hs = subs(Hs)

 pretty(Hs)

% C�lculo de los coeficientes del numerador "a mano"
% 465662169669513380231/14757395258967641292800000000
% 
% ans =
% 
%     31.5545e-009
% 
% 6241/625000000
% 
% ans =
% 
%      9.9856e-006
% 
% 79/25000
% 
% ans =  3.1600e-003

% C�lculo de los coeficientes del denominador
% 575630648820106537338581/11529215046068469760000000000
% 
% ans =
% 
%     49.9280e-006
% 
% 14572927818230545512859/922337203685477580800000
% 
% ans =
% 
%     15.8000e-003 
 
% Gr�fico de los polos y ceros mediante la funci�n del toolbox de TCII
 figure
 num=[31.5545e-009  9.9856e-006 3.1600e-003 1]
 den=[31.5545e-009 49.9280e-006 15.8000e-003 1]
 gpc(num,den)
  % Gr�fico mediante la funci�n de matlab  
 figure
 pzmap(num,den)
 
 % Representaci�n de la respuesta en frecuencia
 figure
 bode(num,den)
 grid
 



