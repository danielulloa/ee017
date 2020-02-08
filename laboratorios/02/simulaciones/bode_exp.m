realsys=tf([1],[C1*C2*R1*R2 C1*R1+C2*R2 1]);
opts = bodeoptions('cstprefs');
opts.Title.String = '';
opts.XLabel.String = 'Frecuencia';
opts.MagVisible = 'off';
bodeplot(realsys,opts)  % Example
axes=findobj('type','axes');
h_magnitude=get(axes(2),'YLabel');
h_phase=get(axes(1),'YLabel');
set(h_magnitude,'String','Magnitud en dB');
set(h_phase,'String','Fase en Grados');
hold on
semilogx(frecuencia,-1.*desfasaje,'-*r')
legend('Ideal','Experimental')
hold off
saveas(gcf,'firstfig.fig') ;

%close(gcf)

semilogx(frecuencia,ganancia,'-*r')
hold on
opts = bodeoptions('cstprefs');
opts.Title.String = '';
opts.XLabel.String = 'Frecuencia';
opts.PhaseVisible = 'off';
bodeplot(realsys,opts)  % Example
axes=findobj('type','axes');
h_magnitude=get(axes(2),'YLabel');
h_phase=get(axes(1),'YLabel');
set(h_magnitude,'String','Magnitud en dB');
set(h_phase,'String','Fase en Grados');
hold off
saveas(gcf,'secondfig.fig') ;
%close(gcf)

