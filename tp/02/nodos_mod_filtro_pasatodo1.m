syms I1 I2 V3 V2 V1 L C R s M
e1=I1+I2-s*C*V3;
e2=V1-V3-s*L*I1-s*M*I2;
e3=V2-V3-s*L*I2-s*M*I1;
e4=V2-V3+I2*s*L;

solu=solve(e1,e2,e3,e4,V1,V2,I1,I2);
H=simplify(solu.V2/solu.V1)