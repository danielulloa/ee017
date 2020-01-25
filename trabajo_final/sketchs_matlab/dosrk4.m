clc;
clear;
%RK4
%Valores de los componentes
ti=0;
tf=20;
h=0.1;
R1=1;
R2=1;
L1=1;
C1=1;
E=1;

%Condiciones Iniciales
v0=10;
i0=5;

%Matrices
M=[C1 0;0 -L1];
N=[0 1;1 -R2];
u=[E/R1;0];
Xant=[v0;i0];
P=-1.*(inv(M)*N);
q=inv(M)*u;
solu=[];

%Autovalores
autoval=eig(P);
[autovec,D]=eig(P);
constantes = inv(autovec)*Xant;
syms t;
v=constantes(1)*autovec(1,1)*exp(autoval(1)*t)+constantes(2)*autovec(1,2)*exp(autoval(2)*t);
i1=constantes(1)*autovec(2,1)*exp(autoval(1)*t)+constantes(2)*autovec(2,2)*exp(autoval(2)*t);
figure(1);
ezplot(v,[ti,tf]);
hold on;
ezplot(i1,[ti,tf]);
hold off;

figure(2);
%Método
for i= ti:h:tf
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
   %  plot(i,X(2),'*b');
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