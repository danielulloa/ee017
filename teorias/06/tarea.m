%In= Vn Yn

%Valores componentes
%ZL=j w L
%L = jXL/j w
%ZC=1/(j w C)
%C=1/( j w XC)

ZL1=j*2;
ZC1=-j*6;
ZC2=-j*3;
R1=4;
R2=2;
R3=8;
Ig1=10;
Ig2=1;

%Vector de los generadores
In=[10;-1];

%Matriz de componentes
Yn=[1/(R1+ZC1)+1/(R2+ZL1) -1/(R2+ZL1);-1/(R2+ZL1) 1/(R3+ZC2)+1/(R2+ZL1)];

%Resuelvo
Vn=In.*Yn^-1;
Vn(1)
Vn(2)
