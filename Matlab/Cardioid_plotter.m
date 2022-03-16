% (c) Thomas E. Woolley, 2017.
clear
clc
close all
t=linspace(-3,3);
fs=15;
x=(t.^2-3)./(t.^2+1);
y=t.*(t.^2-3)./(t.^2+1);
plot(x,y,'linewidth',3) % Plot solution.
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
axis equal
xticks([])
yticks([])
set(0,'DefaultFigureColor',[1 1 1])
set(gca,'fontsize',fs)
export_fig '../Pictures/Trisectrix.png' -m3
