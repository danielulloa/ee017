%Ejercicio n3
clc;
clear;

syms t tau t1;

%Valores de los componentes
R1=1;
R2=1;
L1=1;
C1=1;
C2=1;
C3=1;
w=1;
%Condiciones Iniciales
vc1=0;
vc2=0;

%Valores de tiempo y paso
ti=0;
tf=6*pi;
h=0.1;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[C3 -C2;C1+C3 C1];
N=[0 -1/R2; 1/R1 1/R1];
<<<<<<< HEAD
u=[0;E];
=======
u=[0;1/R1];
>>>>>>> cbfd2674b4c5d29e112601398132b4dbf1cfd9a7

%Condiciones iniciales
Xant=[vc1;vc2];

%Se lleva a la forma 
% dx/dt=q(t)-P*x

P=-1.*(M\N);
Q=M\u;
solu=[];

[T, lambda] = eig(P);

elambda=diag(exp(eig(P).*t1));
H=T*elambda*inv(T);
v=H*Q;
cuenta1=vpa(v(1,:),4)
cuenta2=vpa(v(2,:),4)
t1= t-tau;
cuenta1=subs(cuenta1*10*cos(w*tau));
cuenta2=subs(cuenta2*10*cos(w*tau));
%buscar un comando que reemplace t por (t-tau)
resultado1= int(cuenta1,tau,0,t);
resultado2= int(cuenta2,tau,0,t);

t=0:0.01:20;

vcap1=double(subs(resultado1));
vcap2=double(subs(resultado2));
vcap3=vcap1+vcap2;
figure(1);
plot(t,vcap1,'-r',t,vcap2,'-b',t,vcap3,'-g');
title('Solución analítica');
    xlabel('Tiempo');
    ylabel('Tensión/Corriente');

figure(2);
%M�todo RK4
it=1;
for i= ti:h:tf
   %Fuente variable
   E(it,1)=10*cos(w*i);
   
   %Se calcula el valor de la matriz u para cada punto 
   u=[0;E(it,1)/R1];
   q=M\u;
   
   %Ac� comienza el m�todo 
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
    
     
    %Gr�fica 
    
   plot(i,X(1),'*r',i,X(2),'*b',i,Y(1),'*g');
    title('Solucion Respuesta temporal mediante RK4');
    xlabel('Tiempo');
    ylabel('Tensión/Corriente');
    hold on;
   drawnow limitrate; 
end
hold off
