%Ejercicio nº7
digits=2
clc;
clear;

syms t tau t1;

%Valores de los componentes
g1=1;
g2=2;
g3=3;
g4=4;
L1=1;
L2=1;
C1=1;
C2=1;
%Condiciones Iniciales
vc1=10;
vc2=0;
il1=0;
il2=0;

%Valores de tiempo y paso
ti=0;
tf=10;
h=0.01;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[C1*(1/g1 + 1/g3) 0 0 0;0 0 L1 -L2;-C1/g3 C2/g4 0 L2;0 C2*(-1/g2-1/g4) 0 0];
N=[1 0 1/g1 -1/g3;-1 1 0 0;0 0 0 1/g4+1/g3; 0 -1 1/g2 -1/g4];
u=[0;0;0;0];

%Condiciones iniciales
Xant=[vc1;vc2;il1;il2];

%Se lleva a la forma 
% dx/dt=q(t)-P*x

P=-1.*(M\N);
q=M\u;
solu=[];

[T, lambda] = eig(P);
syms t;
elambda=diag(exp(eig(P).*t))
H=T*elambda*inv(T)
v=H*Xant;

cuenta1=vpa(v(1,:),4)
cuenta2=vpa(v(2,:),4)
cuenta3=vpa(v(3,:),4)
cuenta4=vpa(v(4,:),4)

%Cálculo de Vg4

%Ig4=Vg4*g4;
%Ig4=Il2+Ic2
%Vg4=(Il2+Ic2)/g4
%Ic2=C2*dVc2/dt

Ic2=C2*diff(v(2,:),t);
Vg4=(v(4,:)+Ic2)/g4

t=ti:h:tf;
vcap1=double(subs(real(cuenta1)));
vcap2=double(subs(real(cuenta2)));
iInd1=double(subs(real(cuenta3)));
iInd2=double(subs(real(cuenta4)));
vVg4=double(subs(real(Vg4)));
%Gráficos

figure(1);
plot(t,vcap1,'-g',t,vcap2,'-b',t,iInd1,'-r',t,iInd2,'-m');
title('Solución analítica');
    xlabel('Tiempo');
    ylabel('Tensión/Corriente');

figure(2);
plot(t,vVg4,'-g');
title('Vg4');
    xlabel('Tiempo');
    ylabel('Tensión');

 figure(3);
%Método RK4
it=1;
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
    it=it+1;
end
solu=solu';
t=ti:h:tf;
plot(t,solu(:,1),'*g',t,solu(:,2),'*b',t,solu(:,3),'*r',t,solu(:,4),'*m')
title('Solución respuesta temporal');
xlabel('Tiempo');
ylabel('Tensión/Corriente');

figure(4);
plot(solu(:,2),solu(:,4),'-b');
hold on 
plot(solu(:,2),solu(:,3),'-g');
hold off
title('Phase portrait');
xlabel('Corriente');
ylabel('Tensión'); 

figure(5);
plot3(solu(:,1),solu(:,2),solu(:,3),'-g');
hold on
plot3(solu(:,1),solu(:,2),solu(:,4),'-b');
title('Phase portrait');
xlabel('vc1');
ylabel('vc2'); 
zlabel('il1');
rotate3d;