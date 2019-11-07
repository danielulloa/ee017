%nombre del archivo que contiene la rta al escalon
filename='zewFile1';
%carga el csv ignorando las primeras dos lineas
%generado por un osciloscopio RIGOL DS1052E
M=csvread(filename + ".csv",2,0);
%carga el txt que indica parametros de la medicion
%para obtener el tiempo de muestreo 
fileID = fopen(filename + ".txt",'r');
C1 = textscan(fileID,'%s',1,'delimiter','\n', 'headerlines',15);
fclose(fileID);
fileID = fopen(filename+".txt",'r');
C2 = textscan(fileID,'%s %s %s %f',1,'headerlines',15);
fclose(fileID);

if (strfind(string(C1),'MSa'))>0
    ts=1/(str2num(string(C2(4)))*1e6);
else
    ts=1/(str2num(string(C2(4)))*1e3);
end

%vector tiempo
t=M(:,[1]);
%canal 1
v1=M(:,[2]);
%canal 2
v2=M(:,[3]);
figure(1)
plot(t,v1,t,v2)
title('Medición Osciloscopio')
xlabel('Tiempo [s]')
ylabel('Tensión [V]')
legend('CH1','CH2')
%aplica un offset porque la entrada era una onda cuadrada
%con una amplitud vpp de 10V
v2=v2-min(v2);
%integra la onda cuadrada para encontrar el tON de
%la onda cuadrada

int1=cumtrapz(v1);
[a,b]=findpeaks(int1,'MinPeakDistance',300);
%recorta la señal a los valores de interes
v2c=v2(find(t==ts):b(2));
t2=t(find(t==ts):b(2));
%aplica un filtrado a la señal
v2s=smooth(v2c,50);
%plot de la respuesta al escalón
figure(2)
plot(t2,v2s,'-g')
hold on

%aproxima la transferencia del sistema a primer orden
%encuentra el tau de la respuesta
tau=ts*find(v2s>(max(v2s)*0.632),1,'first')

%genera la funcion de transferencia con una ganancia
%del valor maximo medido
sys=tf([max(v2s)],[tau 1])

%compara la respuesta medida con la aproximada
step(sys)
title('Medición vs Aproximación')
xlabel('Tiempo[s]')
ylabel('Tensión [V]')
legend('Experimental','Aproximación')
hold off

%compara la respuesta aproximada con la real
%valores de los componentes
C1=10e-9;C2=10e-9;R1=10e3;R2=100e3;
%transferencia del sistema de segundo orden
realsys=tf([1],[C1*C2*R1*R2 C1*R1+C2*R2 1]);
%transferencia del sistema aproximado a primer orden
aproxsys=tf([1],[tau 1]);
figure(3)
step(realsys)
hold on
step(aproxsys)
title('Ideal vs Aproximación')
xlabel('Tiempo[s]')
ylabel('Tensión [V]')
legend('Ideal','Aproximación')
hold off
