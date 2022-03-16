clear
close
clc

fs=15;
u=linspace(-0.5,1.5);
y=u.*(1-u);
plot(u,y,'b')
hold on
si=400;
a=20;
b=50;
c=80;
arrowh(fliplr(u(a:a+1)),fliplr(y(a:a+1)),'b',si)
arrowh(u(b:b+1),y(b:b+1),'b',si)
arrowh(fliplr(u(c:c+1)),fliplr(y(c:c+1)),'b',si)
text(0.05,0.3,'$\dot{u}>0$, thus, $u$ is increasing','interpreter','latex')
text(0.05,-0.2,'$\dot{u}<0$, thus, $u$ is decreasing','interpreter','latex')
plot(u,0*u,'k','linewidth',1)
plot(0*u,u,'k','linewidth',1)
% axis equal
axis([-0.4 1.4 -.25 .4])
xlabel('$u$','interpreter','latex')
ylabel('$\dot{u}$','interpreter','latex')

set(0,'DefaultFigureColor',[1 1 1])
set(gca,'fontsize',fs)
export_fig '../Pictures/Logistic_stability.png' -m3