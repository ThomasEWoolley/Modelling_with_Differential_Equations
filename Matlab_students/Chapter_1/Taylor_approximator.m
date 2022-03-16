% (c) Thomas E. Woolley, 2017.
clear
clc
close all
x=linspace(-5,5);
fs=15;
% y(9,:)=1+x+(1/2)*x.^2+(1/6)*x.^3+(1/24)*x.^4+(1/120)*x.^5+(1/720)*x.^6+(1/5040)*x.^7+(1/40320)*x.^8+(1/362880)*x.^9;
% y(8,:)=1+x+(1/2)*x.^2+(1/6)*x.^3+(1/24)*x.^4+(1/120)*x.^5+(1/720)*x.^6+(1/5040)*x.^7+(1/40320)*x.^8;
% y(7,:)=1+x+(1/2)*x.^2+(1/6)*x.^3+(1/24)*x.^4+(1/120)*x.^5+(1/720)*x.^6+(1/5040)*x.^7;
% y(6,:)=1+x+(1/2)*x.^2+(1/6)*x.^3+(1/24)*x.^4+(1/120)*x.^5+(1/720)*x.^6;
y(5,:)=1+x+(1/2)*x.^2+(1/6)*x.^3+(1/24)*x.^4+(1/120)*x.^5;
y(4,:)=1+x+(1/2)*x.^2+(1/6)*x.^3+(1/24)*x.^4;
y(3,:)=1+x+(1/2)*x.^2+(1/6)*x.^3;
y(2,:)=1+x+(1/2)*x.^2;
y(1,:)=1+x;
figure('position',[0 0 1 1/2])
hold on
plot(x,exp(x),'k','linewidth',3) % Plot solution.
plot(x,y,'--','linewidth',1) % Plot solution.
L=legend('$\exp(x)$','Order 1 approximation','Order 2 approximation','Order 3 approximation','Order 4 approximation','Order 5 approximation','location','best');
set(L,'interpreter','latex')
axis([-5 5 0 15])
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
set(0,'DefaultFigureColor',[1 1 1])
set(gca,'fontsize',fs)
