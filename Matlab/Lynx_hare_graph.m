clear
close
clc
fs=15;
M=xlsread('Hare_lynx_data.xlsx');
plot(M(:,1),M(:,2),M(:,1),M(:,3),'linewidth',3)
xlabel('Year','Interpreter','latex')
ylabel('Pelts in thousands','Interpreter','latex')
L=legend('Hare','Lynx');
set(L,'Interpreter','latex')
set(gca,'fontsize',15)
axis tight
set(0,'DefaultFigureColor',[1 1 1])
export_fig '../Pictures/Lynx_hare.png' -m3