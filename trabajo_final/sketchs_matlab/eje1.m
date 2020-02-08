% % Se calculan las matrices M y N
% % M es la matriz de incidencia, que indica el sentido de la condicion
% % inicial
% % N es la matriz de admitancia
% % X la primer fila es la condicion inicial, las siguientes seran los
% % u es la matriz de fuentes
% % resultados de cada iteracion
% % Cada iteracion es cuando transcurre un instante de tiempo determinado por
% % el tiempo de simulacion. Desde ti hasta tf
% % h es la resolucion de la simulacion
% 
% 
% ti=0;
% tf=5;
% h=0.1;
% M=[1 1]';
% L1=1;
% C1=1;
% N=[0 1/L1;1/C1 0];
% % No sabemos si las condiciones iniciales van en la matriz de incidencia
% for i = ti:h:tf 
%     X=(M/h*Xant)\(M/h+N);
% end
% 
% %FAIL, el libro nos mintio o no entemos nada...
% 
% 
% 

% ti=0;
% tf=1;
% h=0.1;
% L1=1;
% C1=1;
% i0=0;
% v0=1;
% A=[0 1/C1;1/L1 0];
% Yant=[v0;i0];
% X=A*Yant;
% for i = ti:h:tf
%     Y=Yant+X.*h
%     X=A*Y;
%     Yant=Y;
%     plot(i,Y(1),'*g');
%     hold on;
%     drawnow;
% end
%Fail numero dos
% function hola()
% 
ti=0;
tf=100;
h=0.1;
L1=1;
C1=1;
v0=1;
i0=0;
M=[C1 0;0 L1];
N=[0 -1;1 0];
Xant=[v0;i0];
MH=M.*(1/h);
M2=inv(MH+N);
X1=MH*M2

for i= ti:h:tf
   %X=((MH*Xant)\(MH+N))';
   X=X1*Xant;
   % como MH+N es fijo, hacer la inversa afuera
   %X=X';
   Xant=X;
   plot(i,X(1),'*g',i,X(2),'*b');
   %plot(-X(1),X(2),'*b');
   hold on;
   drawnow limitrate;
end
hold off



% ti=0;
% tf=5;
% h=0.1;
% L1=1;
% C1=1;
% v0=1;
% i0=1;
% M=[C1 0;0 L1];
% N=[0 -1;1 0];
% Xant=[v0;i0];
% MH=M.*(1/h);
% 
% for i= ti:h:tf
%    X=((MH*Xant)\(MH+N))';
%    Xant=X;
%    plot(i,X(1),'*g',i,X(2),'*b');
%    hold on;
%    drawnow;
% end
% hold off
% 
% 
