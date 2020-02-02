%Ejercicio nº3
clc;
clear;

syms t tau t1;

%Valores de los componentes
R1=1;
R2=1;
R3=1;
R4=1;
R5=1;
C1=0.1;
C2=0.1;
C3=0.1;
C4=0.1;
C5=0.1;

%Condiciones Iniciales
vc1=1;
vc2=0;
vc3=0;
vc4=0;
vc5=0;

%Valores de tiempo y paso
ti=0;
tf=10;
h=0.01;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[C1 0 0 0 0; 0 C2 0 0 0; 0 0 C3 0 0; 0 0 0 C4 0; 0 0 0 0 C5];
N=[1/R1+1/R2 -1/R2 0 0 0; -1/R2 1/R2+1/R3 -1/R3 0 0; 0 -1/R3 1/R3+1/R4 -1/R4 0; 0 0 -1/R4 1/R4+1/R5 -1/R5; 0 0 0 -1/R5 1/R5];
u=[1/R1;0;0;0;0];

%Condiciones iniciales
Xant=[vc1;vc2;vc3;vc4;vc5];

%Se lleva a la forma 
% dx/dt=q(t)-P*x

P=-1.*(M\N);
Q=M\u;
solu=[];

[T, lambda] = eig(P);

elambda=diag(exp(eig(P).*t));
H=T*elambda*inv(T);
v=H*Xant;
t=ti:h:tf;
vc=vpa(subs(v));
vc=double(vc);
vc=vc';
plot(t,vc(:,5))