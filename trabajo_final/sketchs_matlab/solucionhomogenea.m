%% Ejemplo de script para calcular la solución analítica de un circuito descrito
%% por sus ecuaciones de estado

clear;clc;

% Valores de los componentes
R1=1;
R2=1;
L=2;
C1=1;
C2=1;

% Condiciones iniciales
v01=0.5;
v02=0.5;
i01=0.5;

% Matriz de incidencia

M=[C1 0 0; 0 C2 0; 0 0 L];

% Matriz de admitancias

N=[1/R1 0 1; 0 1/R2 -1; -1 1 0];

% Calcula matriz
P=-1.*(M\N);

% Vector condicion inicial
Xant=[v01; v02; i01]
syms t;

[T,lambda]=eig(P);

elambda=diag(exp(eig(P).*t));

sol=T*elambda*inv(T)*Xant;

% Gráficas
fplot(real(sol(1)),[0,10])
hold on
fplot(real(sol(2)),[0,10])
hold on
fplot(real(sol(3)),[0,10])
hold off