clear
close all
clc
fs=20;
x=linspace(0,6);
plot(x,tanh(x-3))
hold on
plot(x,tanh((x-3)/3))
text(3+0.1,0-0.1,'$(t_0,u_0)$','Interpreter','latex')
xlabel('$t$','Interpreter','latex')
ylabel('$u(t)$','Interpreter','latex')
set(gca,'fontsize',fs)
axis tight
xticks([])
yticks([])
set(0,'DefaultFigureColor',[1 1 1])
export_fig(['../Pictures/Intersection.png'],'-m3')