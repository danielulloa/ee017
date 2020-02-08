%Ejercicio 8
clc;
clear;

syms t vc1(t) vc3(t) vc5(t) vc6(t)

%Valores de los componentes
R1=1;
R2=1;
C1=1;
C2=2;
C3=3;
C4=4;
C5=5;
C6=6;

%Condiciones Iniciales
vc01=0;
vc03=0;
vc05=0;
vc06=0;
%Valores de tiempo y paso
ti=0;
tf=10;
h=0.1;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[C1*R1 0 C5*R1 0;-R2*C2 0 (C5*R2+R2*C2) -R2*C2; C1 -C3 0 -C6;C2 -C4 -C2 C6+C4+C2];
N=[1 1 0 0;-1 -1 1 0;0 0 0 0;0 0 0 0];
u=[u(t);0;0;0];

%Condiciones iniciales
Xant=[vc01;vc03;vc05;vc06];

%Se lleva a la forma 
% dx/dt=q(t)-P*x

P=-1.*(M\N);
q=M\u;

x=[vc1;vc3;vc5;vc6];
odes = diff(x) == P*x+q;
constantes = x(0) == Xant;
[v1Sol(t), v3Sol(t),v5Sol(t),v6Sol(t)] = dsolve(odes,constantes)
v1Sol(t) = simplify(v1Sol(t));
v3Sol(t) = simplify(v3Sol(t));
v5Sol(t) = simplify(v5Sol(t));
v6Sol(t) = simplify(v6Sol(t));

figure(1);
for t=ti:h:tf
    if t<=5
        u(t)=(sin(pi*0.2*t))^2;
    else
        u(t)=0;
    end
end
fplot(v1Sol,[ti,tf]);
hold on;
fplot(v3Sol,[ti,tf]);
hold off;
title('Solución mediante calculo de autovalores');

it=1;
figure(2);
solu=[];
%Método RK4
for i= ti:h:tf
    if i<=5
    E(it,1)=(sin(pi*i*0.2))^2;
    else
     E(it,1)=0;    
    end
   u=[E(it,1);0;0;0];
   q=M\u;
    k1= (q+P*Xant).*h;
    Xant2=Xant+(k1.*0.5);
    k2=(q+P*Xant2).*h;
    Xant3=Xant+(k2.*0.5);
    k3=(q+P*Xant3).*h;
    Xant4=Xant+k3;
    k4=(q+P*Xant4).*h;
    X=Xant+(k1+2.*k2+2.*k3+k4)/6;
    solu=[solu X];
    Xant=X;
    it=it+1;
   
    plot(i,X(1),'*g',i,X(2),'*b',i,X(3),'*r');
    title('Solución Respuesta temporal');
    xlabel('Tiempo');
    ylabel('Tensión/Corriente');
    hold on;
   drawnow limitrate; 
end
hold off

figure(3); 
solu=solu';
t=ti:h:tf;
plot(t,solu(:,1),'g',t,solu(:,2),'b');
title('Solución respuesta temporal');
xlabel('Tiempo');
ylabel('Tensión/Corriente');
 