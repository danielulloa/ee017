%Ejercicio nº3
clc;
clear;

%Valores de los componentes
R1=1;
R2=1;
L=2;
C1=1;
C2=1;

w=1;

%Condiciones Iniciales
v01=0.5;
v02=0.5;
i0=0.5;

%Valores de tiempo y paso
ti=0;
tf=20;
h=0.001;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[C1 0 0; 0 C2 0; 0 0 L];
N=[1/R1 0 1; 0 1/R2 -1; -1 1 0];

%Condiciones iniciales
Xant=[v01;v02;i0];

solu=[];

%Método euler
it=1;
for i= ti:h:tf
    %Fuente variable
    E(it,1)=awgn(0.5*sin(w*i),30);

    %Se calcula el valor de la matriz u para cada punto 
    B=[E(it,1)/R1;0;0];
    
    X=((((1/h).*M)+N)\B) + ((((1/h).*M)+N)\((1/h).*M)*Xant);
    
    solu=[solu X];
    Xant=X;
    it=it+1;
end
solu=solu';
t=ti:h:tf;
plot(t,E,'-.m',t,solu(:,1),'-g',t,solu(:,2),'-b',t,solu(:,3),'-r')
title('Solución respuesta temporal');
xlabel('Tiempo');
ylabel('Tensión/Corriente');
ylim([-0.6,0.6])