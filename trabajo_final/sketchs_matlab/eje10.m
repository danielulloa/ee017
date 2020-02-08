clc;clear;
t0=0;
t1=20;
h=0.001;
L1=1;
L2=18;
C1=1/25;
C2=1/72;
v01=1;
v02=0;
i01=0;
i02=0;
E=0;
M=[-C1 0 0 0; 0 C2 0 0; 0 0 L1 L2; 0 0 0 -L2];
N=[0 0 1 0; 0 0 -1 1; 1 0 0 0; 0 1 0 0];
U=[0;0;0;0];
Xant=[v01;v02;i01;i02];

uno=inv((1/h).*M+N)
dos=(1/h).*M

for i=t0:h:t1
    X=uno*(U+dos*Xant)
    Xant=X
    %plot(i,X(1),'*g',i,X(2),'*b');
    plot(X(4),X(1),'.g');
    %plot(-X(1),X(2),'*b');
    hold on;
    drawnow limitrate nocallbacks;
end
hold off