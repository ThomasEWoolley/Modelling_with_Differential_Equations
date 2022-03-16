function Fitzhugh_Nagumo(varargin)
% (c) Thomas E. Woolley, 2017.

clc
close all
fs=15;
tspan = linspace(0,10,1e4); % Length of time the equation is solved for
gamma=2;
% figure('position',[0 1/3 2/3 1/3])
v=linspace(-1,2);
plot(v,v.*(0.5-v).*(v-1))
hold on
plot(v,v/gamma);
for r=[-0.05 -0.1 0.15]%linspace(0.1,2,10)
u0=0;
v0=r;
[t,u] = ode23s(@(t,u)ODE(t,u,gamma),tspan, [u0;v0]); % Matlab ODE solver.

hold on
plot(u(1,1),u(1,2),'ko','linewidth',3)
plot(u(:,1),u(:,2),'linewidth',3) % Plot solution.

end
axis([-0.5 1.5 -0.2 0.2])
xlabel('$v$','Interpreter','latex')
ylabel('$n$','Interpreter','latex')
L=legend('$v$ nullcline','$n$ nullcline');
set(L,'Interpreter','latex')
set(gca,'fontsize',fs)
set(0,'DefaultFigureColor',[1 1 1])
export_fig '../Pictures/Fitzhugh_Nagumo_sims.png' -m3





function dydt = ODE(t,u,gamma)
% ODE equation to solve.
dydt = [(u(1)*(0.5-u(1))*(u(1)-1)-u(2))/1e-3;
    u(1)-u(2)*gamma];
