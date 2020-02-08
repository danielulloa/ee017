clear;clc;
P=[-1.6845 -0.3422 -0.3209; -0.8556 -0.4278 -0.4011; -0.5348 -0.2674 -0.6257]
u=[1.347;0.6844;0.4280]
[T, lambda] = eig(P);

syms t tau t1;
elambda=diag(exp(eig(P).*t1));
H=T*elambda*inv(T);
v=H*u;
cuenta=vpa(v(3,:),4)
t1= t-tau;
cuenta=subs(cuenta*cos(tau))
%buscar un comando que reemplace t por (t-tau)
resultado= int(cuenta,tau,0,t)
%expresion= int((0.619*exp(-2.063*(t-tau)) - 0.2037*exp(-0.5279*(t-tau)) + 0.01273*exp(-0.1473*(t-tau)))*cos(tau),tau,0,t)
t=0:0.01:20;
%salida=subs(expresion);
%plot(salida)
%plot(t,salida)

saliendo=double(subs(resultado))
plot(t,saliendo)
