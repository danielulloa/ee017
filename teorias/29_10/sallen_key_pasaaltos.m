%Determinación de la función de transferencia de un filtro pasa-altos de un
%filtro SK en forma simbólica
%Se declaran como simbólicas las variables
syms V1 V2 V3 s m R C
e1=V3*(1/R+2*s*C)-(1/R+s*C)*V2-s*V1*C;
e2=V2*(1/m/R+s*C)-s*C*V3;
%Solución de las ecuaciones
solu=solve(e1,e2,V2,V3);
Hs=simplify(solu.V2/V1)
pretty(Hs)
%        2  2    2
%       C  R  m s
%------------------------
%   2  2  2
%  m C  R  s  + 2 C R s + 1