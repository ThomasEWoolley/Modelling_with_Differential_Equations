clear
close all
clc
fs=20;
x=linspace(0,5);
plot(x,(x-1).*(x-2).*(x-4))

xlabel('$x$','Interpreter','latex')
ylabel('$(x-1)(x-2)(x-4)$','Interpreter','latex')
set(gca,'fontsize',fs)
axis tight
xticks([])
yticks([])
set(0,'DefaultFigureColor',[1 1 1])
export_fig(['../Pictures/Non_monotonic.png'],'-m3')
%%
clear
close all
clc
fs=20;
x=linspace(0,5);
plot(x,1+x.^2)

xlabel('$x$','Interpreter','latex')
ylabel('$x^2$','Interpreter','latex')
set(gca,'fontsize',fs)
axis tight
xticks([])
yticks([])
set(0,'DefaultFigureColor',[1 1 1])
export_fig(['../Pictures/Monotonic.png'],'-m3')
%%
clear
close all
clc
fs=20;
x=linspace(0,5);
plot(x,1-exp(-x))

xlabel('$x$','Interpreter','latex')
ylabel('$1-\exp(-x)$','Interpreter','latex')
xticks([])
yticks([])
set(gca,'fontsize',fs)
axis tight
set(0,'DefaultFigureColor',[1 1 1])
export_fig(['../Pictures/Strictly_monotonic.png'],'-m3')