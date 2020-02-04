%Ejercicio nº3
clc;
clear;

%Valores de los componentes
R1=1;
R2=1;
L1=1;
L2=1;
L3=2;
E=[];

%Condiciones Iniciales
il2=0;
il3=0;

w=1;

%Valores de tiempo y paso
ti=0;
tf=2*pi;
h=0.1;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[L1 L1+L3;L2 -L3];
N=[R1 R1;R2 0];

%Condiciones iniciales
Xant=[il2;il3];

%Se lleva a la forma 
% dx/dt=q(t)-P*x

P=-1.*(M\N);

solu=[];


% %Calculo de Autovalores

 autoval=eig(P);
 [autovec,D]=eig(P);
 constantes = autovec\Xant;
% %Se lleva a la forma general de la solución 
% %x(t)=K1*A1*e^(lamda1*t)+K2*A2*e^(lamda2*t)
 
syms t;
 
 i2=constantes(1)*autovec(1,1)*exp(autoval(1)*t)+constantes(2)*autovec(1,2)*exp(autoval(2)*t);
 i3=constantes(1)*autovec(2,1)*exp(autoval(1)*t)+constantes(2)*autovec(2,2)*exp(autoval(2)*t);
 i1=i2+i3;
 
 pretty(v1)
 pretty(v2)
 pretty(v3)
% 
% figure(1);
% fplot(v1,[ti,tf]);
% hold on;
% fplot(v2,[ti,tf]);
% 
% fplot(v3,[ti,tf]);
% hold off;
% title('Solución mediante calculo de autovalores');

figure(2);
%Método RK4
it=1;
for i= ti:h:tf
   %Fuente variable
   E(it,1)=2*exp(-2*i);
   %Se calcula el valor de la matriz u para cada punto 
   u=[E(it,1);0];
   q=M\u;
   
   %Acá comienza el método 
    k1= (q+P*Xant).*h;
    Xant2=Xant+(k1.*0.5);
    k2=(q+P*Xant2).*h;
    Xant3=Xant+(k2.*0.5);
    k3=(q+P*Xant3).*h;
    Xant4=Xant+k3;
    k4=(q+P*Xant4).*h;
    X=Xant+(k1+2.*k2+2.*k3+k4)/6;
    solu=[solu X];
    Y=X(1)+X(2);
    Xant=X;
    it=it+1;
     
    %Gráfica 
    
   plot(i,X(1),'*r',i,X(2),'*b',i,Y(1),'*g');
    title('Solución Respuesta temporal mediante RK4');
    xlabel('Tiempo');
    ylabel('Tensión/Corriente');
    hold on;
   drawnow limitrate; 
end
hold off
