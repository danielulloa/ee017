% Solución simbólica de las ecuaciones planteadas
% por el método de nodos modificado
%   * Teoría de Circuitos II * . Departamento de Electrónica.
%   Facultad de Ingeniería. Universidad Nacional de la Patagonia SJB
%   09 de setiembre de 2014 
 
% 1 Circuito RL
% Se declaran como simbolicas las variables que se utilizan
syms V1 V2 IL s R L
e1 = IL-V2*(1/R);
e2 = V1-V2-s*L*IL;
% Solucion de las ecuaciones
solu = solve(e1,e2,V2,IL);
% expand(solu.V2/V1)
Hs = simplify(solu.V2/V1)
 pretty(Hs)
 
%  Hs =
%  
% R/(R + L*s)
%  
%    R
% -------
% R + L s
 
 % 2. Circuito con bobinas acopladas
 syms Vg V2 I1 I2 s Z1 Z2 L1 L2 M
e1 = Vg/Z1-I1-V1*(1/Z1);
e2 = -I2-V2*(1/Z2); 
e3 = V1-s*L1*I1-s*M*I2;
e4 = V2-s*L2*I2-s*M*I1;
% Solucion de las ecuaciones
solu = solve(e1,e2,e3,e4,V1,V2,I1,I2);
% expand(solu.V2/V1)
Hs = simplify(solu.V2/Vg)
 pretty(Hs)
 
%   
%  Hs =
%  
% (M*Z2*s)/(Z1*Z2 - M^2*s^2 + L1*Z2*s + L2*Z1*s + L1*L2*s^2)
%  
%                    M Z2 s
% --------------------------------------------
%          2  2                              2
% Z1 Z2 - M  s  + L1 Z2 s + L2 Z1 s + L1 L2 s


% 3. Circuito con el equivalente Pi de las bobinas acopladas
 syms Vg V1 V2 s Z1 Z2 L1 L2 M
e1 = -Vg/Z1+V1*( 1/(s*(L1*L2-M^2)/M) + 1/(s*(L1*L2-M^2)/(L2-M) )+1/Z1)-V2*( 1/(s*(L1*L2-M^2)/M));
e2 = V2*( 1/(s*(L1*L2-M^2)/M) + 1/(s*(L1*L2-M^2)/(L1-M))+ 1/Z2)-V1*( 1/(s*(L1*L2-M^2)/M));

% Solucion de las ecuaciones
solu = solve(e1,e2,V1,V2);
% expand(solu.V2/V1)
Hs = simplify(solu.V2/Vg)
pretty(Hs)
 
%  Hs =
%  
% (M*Z2*s)/(Z1*Z2 - M^2*s^2 + L1*Z2*s + L2*Z1*s + L1*L2*s^2)
%  
%                    M Z2 s
% --------------------------------------------
%          2  2                              2
% Z1 Z2 - M  s  + L1 Z2 s + L2 Z1 s + L1 L2 s
