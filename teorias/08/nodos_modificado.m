%Solución simólica de las ecuaciones de nodo modificado
%1 Ecuaciones del circuito
syms Vg V2 V1 I1 I2 s R1 R2 L1 L2 M k

e1= Vg/R1-V1/R1-I1;
%estaba mal porque vicky agrego un signo menos!!!!
e2= I2-V2/R2;

%2 Ecuaciones de las relaciones constitutivas
e3=V1-s*L1*I1-s*M*I2;
e4=-V2-s*L2*I2-s*M*I1;

%Solución de las ecuaciones
solu=solve(e1,e2,e3,e4,V1,V2,I1,I2);
V1s=simplify(solu.V1);
V2s=simplify(solu.V2);
I1s=simplify(solu.I1);
I2s=simplify(solu.I2);
pretty(V1s)
pretty(V2s)
pretty(I1s)
pretty(I2s)

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
%Reemplaza V1s y sustituya, variable precision arithmetic 
V1f=vpa(subs(V1s))
V2f=vpa(subs(V2s))
I1f=vpa(subs(I1s))
I2f=vpa(subs(I2s))