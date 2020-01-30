%Plantilla
clc;
clear;

%Valores de los componentes
R1=1;
R2=1;
L1=1;
C1=1;
E=1;

%Condiciones Iniciales
v0=10;
i0=1;

%Valores de tiempo y paso
ti=0;
tf=10;
h=0.1;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[];
N=[];
u=[];

%Condiciones iniciales
Xant=[v0;i0];

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




figure(2);
%Método RK4
for i= ti:h:tf
    %Primera condición inicial 
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