C1=10e-9;C2=10e-9;R1=10e3;R2=100e3;
%transferencia del sistema de segundo orden
realsys=tf([1],[C1*C2*R1*R2 C1*R1+C2*R2 1]);
opts = bodeoptions('cstprefs');
opts.Title.String = '';
opts.XLabel.String = 'Frecuencia';
bodeplot(realsys,opts)  % Example
axes=findobj('type','axes');
h_magnitude=get(axes(2),'YLabel');
h_phase=get(axes(1),'YLabel');
set(h_magnitude,'String','Magnitud en dB');
set(h_phase,'String','Fase en Grados');