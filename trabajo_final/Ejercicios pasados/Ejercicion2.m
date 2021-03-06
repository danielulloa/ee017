%Ejercicio n�2
clc;
clear;

%Valores de los componentes
R1=1;
R2=1;
L1=1;
C1=1;
E=1;

%Condiciones Iniciales
v0=1;
i0=1;
v02=1;
i02=0.1;

%Valores de tiempo y paso
ti=0;
tf=10;
h=0.1;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[-C1 0;0 L1];
N=[-1/R1 -1;-1 R2];
u=[-E/R1;0];

%Condiciones iniciales
Xant=[v0;i0];
Xant0=[v02;i02];

%Se lleva a la forma 
% dx/dt=q(t)-P*x

P=-1.*(M\N);
q=M\u;

solu=[];
solu2=[];

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
    
    %Segunda condici�n inicial 
    k10= (q+P*Xant0).*h;
    Xant20=Xant0+(k1.*0.5);
    k20=(q+P*Xant20).*h;
    Xant30=Xant0+(k2.*0.5);
    k30=(q+P*Xant30).*h;
    Xant40=Xant0+k3;
    k40=(q+P*Xant40).*h;
    X0=Xant0+(k10+2.*k20+2.*k30+k40)/6;
    solu2=[solu2 X0];
    Xant0=X0;
    
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
solu2=solu2';
t=ti:h:tf;
plot(t,solu(:,1),'g',t,solu(:,2),'b');
title('Soluci�n respuesta temporal');
xlabel('Tiempo');
ylabel('Tensi�n/Corriente');


figure(4);
plot(solu(:,1),solu(:,2),'r',solu2(:,1),solu2(:,2),'g');
title('Phase portrait');
xlabel('Corriente');
ylabel('Tensi�n'); 