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
[T, lambda] = eig(P);
syms t;
elambda=diag(exp(eig(P).*t))
H=T*elambda*inv(T)
v=H*Xant;

cuenta1=vpa(v(1,:),4)
cuenta2=vpa(v(2,:),4)
cuenta3=vpa(v(3,:),4)

t=ti:h:tf;

vcap1=double(subs(real(cuenta1)));
vcap2=double(subs(real(cuenta2)));
iInd=double(subs(real(cuenta3)));

%Gráficos

figure(1);
plot(t,vcap1,'-g',t,vcap2,'-b',t,iInd,'-r');
title('Solución analítica');
    xlabel('Tiempo');
    ylabel('Tensión/Corriente');


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
plot(t,solu(:,1),'-g',t,solu(:,2),'-b',t,solu(:,3),'-r');
title('Solución respuesta temporal');
xlabel('Tiempo');
ylabel('Tensión/Corriente');


figure(4);
plot(solu(:,1),solu(:,2),'r');
title('Phase portrait');
xlabel('Corriente');
ylabel('Tensión'); 