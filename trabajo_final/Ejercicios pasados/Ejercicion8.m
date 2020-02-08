%Ejercicio 8
clc;
clear;

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
vc1=0;
vc3=0;
vc5=0;
vc6=0;
%Valores de tiempo y paso
ti=0;
tf=10;
h=0.01;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[C1*R1 0 C5*R1;(C1*R1-R2*C2-(R2*C2*C1)/C6) R2*C3*C2/C6 (C5*(R1+R2))+R2*C2;-R2*(C4+C6)*C1/C6 R2*C4+R2*(C4+C6)*C3/C6 0];
N=[1 1 0 ;0 0 1;-1 -1 1 ];
u=[1;1;0];

%Condiciones iniciales
Xant=[vc1;vc3;vc5];

%Se lleva a la forma 
% dx/dt=q(t)-P*x

P=-1.*(M\N);
q=M\u;

solu=[];

%Calculo de Autovalores

autoval=eig(P);
[autovec,D]=eig(P);
constantes = autovec\Xant;


%Se lleva a la forma general de la solución 
%x(t)=C1*V1*e^(lamda1*t)+C2*V2*e^(lamda2*t)

syms t;

v=constantes(1)*autovec(1,1)*exp(autoval(1)*t)+constantes(2)*autovec(1,2)*exp(autoval(2)*t);
i1=constantes(1)*autovec(2,1)*exp(autoval(1)*t)+constantes(2)*autovec(2,2)*exp(autoval(2)*t);

pretty(v)
pretty(i1)

%Gráficos

figure(1);
fplot(v,[ti,tf]);
hold on;
fplot(i1,[ti,tf]);
hold off;
title('Solución mediante calculo de autovalores');

it=1;
figure(2);
%Método RK4
for i= ti:h:tf
    if i<=5
    E(it,1)=(sin(pi*i*0.2))^2;
    else
     E(it,1)=0;    
    end
   u=[E(it,1);E(it,1);0];
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


figure(4);
plot(solu(:,1),solu(:,2),'r');
title('Phase portrait');
xlabel('Corriente');
ylabel('Tensión'); 