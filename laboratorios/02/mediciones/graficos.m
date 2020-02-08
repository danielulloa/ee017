<<<<<<< HEAD
filename="qewFile1";
=======
filename="dewFile0";
>>>>>>> 9c16d57984c605e1155575f88475a2047f162bbc
dist=430
M=csvread(filename+'.csv',2,0);
offset=-31e-3;
fileID = fopen(filename+'.txt','r');
C1 = textscan(fileID,'%s',1,'delimiter','\n', 'headerlines',15);
fclose(fileID);

fileID = fopen(filename+'.txt','r');
C2 = textscan(fileID,'%s %s %s %f',1,'headerlines',15);
fclose(fileID);

if (strfind(string(C1),'MSa'))>0
    ts=1/(str2num(string(C2(4)))*1e6)
else
    ts=1/(str2num(string(C2(4)))*1e3)
end
    
t=M(:,[1]);
v1=smooth(M(:,[2]),30);
v2=smooth(M(:,[3]),30);
v2=v2-offset;
%figure(1)
%plot(t,v1,'g',t,v2,'r')
%puntero=find(t==ts)

%figure(2)
findpeaks(v1,'MinPeakDistance',dist)
hold on
findpeaks(v2,'MinPeakDistance',dist)
hold off
title('Medición Osciloscopio')
xlabel('Muestra [n]')
ylabel('Tensión [V]')
legend('CH1','Máx CH1','CH2','Máx CH2')
[v1M,v1Mt]=findpeaks(v1,'MinPeakDistance',dist);
[v2M,v2Mt]=findpeaks(v2,'MinPeakDistance',dist);

A=size(v1M,1);
B=size(v2M,1);
diferencia=abs(A-B);
if A<B
    for i=1:diferencia
        v1M=[v1M; v1M(end)]
        v1Mt=[v1Mt; v1Mt(end)+median(diff(v1Mt))]
    end
else
    for i=1:diferencia
        v2M=[v2M; v2M(end)]
        v2Mt=[v2Mt; v2Mt(end)+median(diff(v2Mt))]
    end
end

% if size(v1M,1)>size(v2M,1)
%     v2M=[v2M;v2M(1)]
%     v2Mt=[v2Mt;v2Mt(1)+v2Mt(end)]
% else
%     v1M=[v1M;v1M(1)]
%     v1Mt=[v1Mt;v1Mt(1)+v1Mt(end)]
% end
% if size(v1M,1)>size(v2M,1)
%     v2M=[v2M;v2M(1)]
%     v2Mt=[v2Mt;v2Mt(1)+v2Mt(end)]
% else
%     v1M=[v1M;v1M(1)]
%     v1Mt=[v1Mt;v1Mt(1)+v1Mt(end)]
% end

dtV=v2Mt-v1Mt;
dt=median(dtV);
dvV=v2M-v1M;
dv=median(dvV)
periodo=(median(diff(v1Mt))*ts);
desfasaje=dt*ts*360/periodo
frecuencia=2*pi*1/periodo