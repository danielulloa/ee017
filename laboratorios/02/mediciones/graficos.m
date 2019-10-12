filename='aewFile0.csv';
M=csvread(filename,2,0);
t=M(:,[1]);
v1=M(:,[2]);
v2=M(:,[3]);
plot(t,v1,'g',t,v2,'r')
