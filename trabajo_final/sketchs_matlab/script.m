ti=0;
tf=10;
h=0.1;
L1=1;
C1=1;
R2=2534;
v0=1;
i0=0;
M=[-C1 0;0 -L1];
N=[0 1;-1 0];
u=[0 0; 0 0];
Xant=[v0;i0];
MH=M.*(1/h);

for i= ti:h:tf
   %Xa=u+MH*Xant;
  %X=(Xa*inv(MH+N))
  X=(MH+N)\(MH*Xant); 
  % X=((MH*Xant)\(MH+N))'; 
   Xant=X;
    plot(i,X(1),'*g',i,X(2),'*b');
    %plot(X(1),X(1,2),'*g');
    hold on;
    drawnow;
end
hold off