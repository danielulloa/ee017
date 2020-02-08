%%https://la.mathworks.com/help/symbolic/solve-a-system-of-differential-equations.html
clc;
clear;

%%Se declara como simbolico 
syms t vc(t) il(t) R C L;

M=[0 L;C 0];
N=[-1 0;1/R 1];
u=[0;0];

A=-1.*(M\N)

x=[vc;il];
odes = diff(x) == A*x
[vSol(t), iSol(t)] = dsolve(odes);
vSol(t) = simplify(vSol(t));
iSol(t) = simplify(iSol(t));
pretty(vSol)
pretty(iSol)

%%
%R=1;
%C=1;
%L=1;

%Condiciones Iniciales
%v0=1;
%i0=1;

%constantes = x(0) == Xant;
%[vSol(t), iSol(t)] = dsolve(odes,constantes);

%Condiciones iniciales
%Xant=[v0;i0];