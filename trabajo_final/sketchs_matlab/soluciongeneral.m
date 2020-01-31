% Ejemplo de script para calcular la solución analítica de un circuito descrito por sus ecuaciones de estado

clear;clc;

% Valores de los componentes
R1=1;
R2=1;
C1=1;
C2=1;
C3=1;

ti=0;
tf=6*pi;
h=0.1;

% Condiciones iniciales
vc1=1;
vc2=0;

% Matriz de incidencia

M=[C3 -C2; C1+C3 C1];

% Matriz de admitancias

N=[0 -1/R2; 1/R1 1/R1];


% Calcula matriz
P=-1.*(M\N);

% Vector condicion inicial
Xant=[vc1; vc2]
syms t;

U=[0;10*cos(t)]

[T,lambda]=eig(P);

elambda=diag(exp(eig(P).*t));
H=T*elambda*inv(T);
soluh=H*Xant

solucn=[];
soluhn=[];

% convolución numérica
for t= ti:h:tf
    %Primera condición inicial
    solucn=[solucn conv(subs(H),subs(U))];
    soluhn=[soluhn subs(soluh)]
end

soluh=soluh';
soluc=soluc';
solu=soluh+soluc;
t=ti:h:tf;

