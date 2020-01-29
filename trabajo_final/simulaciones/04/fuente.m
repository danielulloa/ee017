t=0:1e-3:6;
y=2*exp(-2*t);
%plot(t,y,'*g')
out=[t' y'];
dlmwrite('myfile.txt', out, 'delimiter', '\t', 'precision', 6)