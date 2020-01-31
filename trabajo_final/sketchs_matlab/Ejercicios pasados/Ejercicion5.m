%Plantilla
clc;
clear;

%Valores de los componentes
R1=1;
R2=1;
L=2;
C1=1;
C2=1;
E=0;

%Condiciones Iniciales
v01=0.5;
v02=0.5;
i0=0.5;

%Valores de tiempo y paso
ti=0;
tf=10;
h=0.1;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[C1 0 0; 0 C2 0; 0 0 L];
N=[1/R1 0 1; 0 1/R2 -1; -1 1 0];
u=[0;0;0];

%Condiciones iniciales
Xant=[v01;v02;i0];

%Se lleva a la forma 
% dx/dt=q(t)-P*x

P=-1.*(M\N);
q=M\u;

solu=[];

%Calculo de Autovalores

autoval=eig(P);
[autovec,D]=eig(P);
constantes = autovec\Xant;


%Se lleva a la forma general de la soluci�n 
%x(t)=C1*V1*e^(lamda1*t)+C2*V2*e^(lamda2*t)

syms t;

v=constantes(1)*autovec(1,1)*exp(autoval(1)*t)+constantes(2)*autovec(1,2)*exp(autoval(2)*t);
i1=constantes(1)*autovec(2,1)*exp(autoval(1)*t)+constantes(2)*autovec(2,2)*exp(autoval(2)*t);

pretty(v)
pretty(i1)

%Gr�ficos

figure(1);
fplot(v,[ti,tf]);
hold on;
fplot(i1,[ti,tf]);
hold off;
title('Soluci�n mediante calculo de autovalores');




figure(2);
%M�todo RK4
for i= ti:h:tf
    %Primera condici�n inicial 
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
    
 
    plot(i,X(1),'*g',i,X(2),'*b');
    title('Soluci�n Respuesta temporal');
    xlabel('Tiempo');
    ylabel('Tensi�n/Corriente');
    hold on;
   drawnow limitrate; 
end
hold off

figure(3); 
solu=solu';
t=ti:h:tf;
plot(t,solu(:,1),'g',t,solu(:,2),'b',t,solu(:,3),'r');
title('Soluci�n respuesta temporal');
xlabel('Tiempo');
ylabel('Tensi�n/Corriente');


figure(4);
plot(solu(:,1),solu(:,2),'r');
title('Phase portrait');
xlabel('Corriente');
ylabel('Tensi�n'); 