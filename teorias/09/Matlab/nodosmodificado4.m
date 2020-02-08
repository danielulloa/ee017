syms R1 R2 L1 L2 I1 I2 Vg C s k M V1 V2 V3 V4 
eq1=I1-Vg/R1-V1*(1/R1 +s*C)+V2/R1+V3*s*C;
eq2=Vg/R1 -I2+V1/R1 -V2/R2;
eq3=I2-V3*(1/R2 +s*C)-V1*s*C-V4/R2;
eq4=-I1-V4/R2+V3/R2;
eq5=V4-V1-s*L1*I1-s*M*I2;
eq6=V2-V3-s*L2*I2-s*M*I1;

solucion=solve(eq1,eq2,eq3,eq4,eq5,eq6,V1,V2,V3,V4,I1,I2);
V3s=simplify(solucion.V3);
V4s=simplify(solucion.V4);
I1s=simplify(solucion.I1);
pretty(V3s)
pretty(V4s)
pretty(I1s)

%Solución con los valores del circuito
R1=20;
R2=400;
L1=0.15;
L2=0.5;
C=5e-6;
k=0.8;
M=k*sqrt(L1*L2);
w=2*pi*50
s=1*i*w;
Vg=220;
%Reemplaza V1s y sustituya, variable precision arithmetic 
digits(8)
V1f=vpa(subs(V1s))
V2f=vpa(subs(V2s))
V3f=vpa(subs(V3s))
V4f=vpa(subs(V4s))
I1f=vpa(subs(I1s))
I2f=vpa(subs(I2s))