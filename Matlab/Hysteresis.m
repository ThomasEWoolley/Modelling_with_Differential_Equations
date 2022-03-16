ccc
fs=15;
E=linspace(eps,2,1e5);
u0=0*E;
up=(1+sqrt(1-E.^2))./E;
un=(1-sqrt(1-E.^2))./E;
Indices=double(imag(up)==0);
Indices(Indices==0)=nan;

up=up.*Indices;
un=un.*Indices;

plot(E,u0)
hold on
plot(E,un,'--')
plot(E,up)
text(1,2,'$\frac{1+\sqrt{1-E^2}}{E}$','Interpreter','latex','fontsize',fs)
text(1,0.5,'$\frac{1-\sqrt{1-E^2}}{E}$','Interpreter','latex','fontsize',fs)
axis([0 2 0 3])
L=legend('$u_0$','$u_-$','$u_+$','location','ne')
set(L,'Interpreter','latex')
xlabel('$E$','Interpreter','latex')
ylabel('Steady state','Interpreter','latex')
set(gca,'fontsize',fs)
export_fig '../Pictures/Hysteresis.png' -m3
