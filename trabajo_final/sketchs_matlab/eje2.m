clc;clear;
t0=0;
t1=10;
h=0.1;
L1=1;
i0=5;
C1=1;
v0=10;
R1=1;
R2=1;
E=1;
M=[C1 0;0 -L1];
N=[0 1; 1 -R2];
U=[E/R1;0];
Xant=[v0;i0];

uno=inv((1/h).*M+N)
dos=(1/h).*M
solu=[];
for i=t0:h:t1
    X=uno*(U+dos*Xant)
    Xant=X
    %plot(i,X(1),'*g',i,X(2),'*b');
    plot(X(2),X(1),'.g');
    %plot(-X(1),X(2),'*b');
    hold on;
    drawnow;
    solu=[solu X]
end
hold off
figure(2)
solu=solu';
t=t0:h:t1;
plot(t,solu(:,1),'g',t,solu(:,2),'b');