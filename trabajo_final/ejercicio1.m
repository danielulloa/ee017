% https://la.mathworks.com/help/symbolic/solve-a-system-of-differential-equations.html
clc;
clear;

%%
syms t vc(t) il(t) C1 C2;

%Valores de los componentes
L=1;
C=1;

%Condiciones Iniciales
v0=1;
i0=0;

%Valores de tiempo y paso
ti=0;
tf=100;
h=0.01;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[-C 0;0 -L];
N=[0 1;-1 0];
u=[0;0];

%Condiciones iniciales
Xant=[v0;i0];


%Se lleva a la forma 
% dx/dt=q(t)-P*x

A=-1.*(M\N)


x=[vc;il];
odes = diff(x) == P*x
constantes = x(0) == Xant;
[vSol(t), iSol(t)] = dsolve(odes,constantes);
vSol(t) = simplify(vSol(t))
iSol(t) = simplify(iSol(t))
%% Gráficas
clf
fplot(vSol,[ti,tf])
hold on
fplot(iSol,[ti,tf])
grid on
%%
t=ti:h:tf;
v1=eval(subs(vSol));
i1=eval(subs(iSol));

%[T, lambda] = eig(P);
%syms t;
%elambda=diag(exp(eig(P).*t))
%H=T*elambda*inv(T)
%v=H*Xant;