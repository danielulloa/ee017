syms Vg I s R1 R2 L1 L2 M k
I=Vg/(s*L2+s*M+R2+s*L1+s*M+R1);
pretty(I);
VR2=I*R2;
%Solución con los valores del circuito
R1=20;
R2=400;
L1=0.15;
L2=0.5;
k=0.8;
M=k*sqrt(L1*L2);
w=2*pi*50
s=1*i*w;
Vg=220;

digits(8)
VR2f=vpa(subs(VR2))
If=vpa(subs(I))

% VR2f =126.0276 - 102.58083i 
% If =0.315069 - 0.25645208i
 