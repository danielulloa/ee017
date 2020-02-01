%Ejercicio nº7
clc;
clear;

syms t tau t1;

%Valores de los componentes
R1=1;
R2=1/2;
R3=1/3;
R4=1/4;
R5=1/5;
L1=1;
L2=1;
C1=1;
C2=1;
%Condiciones Iniciales
vc1=1;
vc2=0;
il1=0;
il2=0;

%Valores de tiempo y paso
ti=0;
tf=2;
h=0.1;

%Matrices del circuito 
%Lleva la forma de:
%M*(dx/dt)+N*x=u(t);

M=[-C1*R1 -C1*R3 0 0;0 0 -L1 -L2; C1*R3 C2*R4 0 L2;0 C2*(R4+R2) 0 0];
N=[-1 0 -R1 -R3; 1 -1 0 0;0 0 R3-R4 0; 0 1 -R2 -R1];
u=[0;0;0;0];

%Condiciones iniciales
Xant=[vc1;vc2;il1;il2];

%Se lleva a la forma 
% dx/dt=q(t)-P*x

P=-1.*(M\N);
q=M\u;
solu=[];

% [T, lambda] = eig(P);
% 
% elambda=diag(exp(eig(P).*t1));
% H=T*elambda*inv(T);
% v=H*Q;
% cuenta1=vpa(v(1,:),4)
% cuenta2=vpa(v(2,:),4)
% t1= t-tau;
% cuenta1=subs(cuenta1*10*cos(w*tau));
% cuenta2=subs(cuenta2*10*cos(w*tau));
% %buscar un comando que reemplace t por (t-tau)
% resultado1= int(cuenta1,tau,0,t);
% resultado2= int(cuenta2,tau,0,t);
% 
% t=0:0.01:20;
% 
% vcap1=double(subs(resultado1));
% vcap2=double(subs(resultado2));
% vcap3=vcap1+vcap2;
% figure(1);
% plot(t,vcap1,'-r',t,vcap2,'-b',t,vcap3,'-g');
% title('Solución analítica');
%     xlabel('Tiempo');
%     ylabel('Tensión/Corriente');

figure(2);
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
plot(t,solu(:,1),'-g',t,solu(:,2),'-b',t,solu(:,3),'-r',t,solu(:,4),'-m')
