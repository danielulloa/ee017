% Respuesta en el tiempo
% y en frecuencia de sistemas
% de segundo orden variando el Q

T1 = tf([10000],[1 1000 10000]);
T2 = tf([10000],[1 200 10000]);
T3 = tf([10000],[1 50 10000]);
step(T1,T2,T3); grid
figure
w = logspace(0,3,1000);
bodemag(T1,T2,T3,w); grid