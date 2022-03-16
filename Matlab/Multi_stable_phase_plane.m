clear
close
clc

fs=15;
u=linspace(-0.5,2);
y=2*u.^2./(1+u.^2)-0.9*u;
plot(u,y,'b')
hold on
si=400;
b=15;
a=30;
c=90;
d=60;
arrowh(fliplr(u(a:a+1)),fliplr(y(a:a+1)),'b',si)
arrowh(u(b:b+1),y(b:b+1),'b',si)
arrowh(fliplr(u(c:c+1)),fliplr(y(c:c+1)),'b',si)
arrowh(u(d:d+1),y(d:d+1),'b',si)
text(0,0.05,'$u_0$ stable','interpreter','latex')
text(0.6364,-0.05,'$u_-$ unstable','interpreter','latex')
text(1.596,0.05,'$u_+$ stable','interpreter','latex')
text(0.05,0.3,'$\dot{u}>0$, thus, $u$ is increasing','interpreter','latex')
text(0.05,-0.2,'$\dot{u}<0$, thus, $u$ is decreasing','interpreter','latex')
plot(u,0*u,'k','linewidth',1)
plot(0*u,u,'k','linewidth',1)
% axis equal
axis([-0.4 2 -.25 .4])
xlabel('$u$','interpreter','latex')
ylabel('$\dot{u}$','interpreter','latex')

set(0,'DefaultFigureColor',[1 1 1])
set(gca,'fontsize',fs)
export_fig '../Pictures/Multi_stable_stability_E9.png' -m3
%%
clear
close
clc

fs=15;
u=linspace(-0.5,2);
y=2*u.^2./(1+u.^2)-1.1*u;
plot(u,y,'b')
hold on
si=400;
b=15;
a=80;

arrowh(fliplr(u(a:a+1)),fliplr(y(a:a+1)),'b',si)
arrowh(u(b:b+1),y(b:b+1),'b',si)

text(0,0.05,'$u_0$ stable','interpreter','latex')
text(0.05,0.3,'$\dot{u}>0$, thus, $u$ is increasing','interpreter','latex')
text(0.05,-0.2,'$\dot{u}<0$, thus, $u$ is decreasing','interpreter','latex')
plot(u,0*u,'k','linewidth',1)
plot(0*u,u,'k','linewidth',1)
% axis equal
axis([-0.4 2 -.25 .4])
xlabel('$u$','interpreter','latex')
ylabel('$\dot{u}$','interpreter','latex')

set(0,'DefaultFigureColor',[1 1 1])
set(gca,'fontsize',fs)
export_fig '../Pictures/Multi_stable_stability_E11.png' -m3