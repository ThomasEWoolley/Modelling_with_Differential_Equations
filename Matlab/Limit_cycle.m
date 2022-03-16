function Limit_cycle(varargin)
% (c) Thomas E. Woolley, 2017.

clc
close all
fs=15;
alpha=1/2;
tspan = linspace(0,10); % Length of time the equation is solved for

for r=linspace(0.1,2,10)
u0=r;
v0=0;
[t,u] = ode23(@(t,u)ODE(t,u),tspan, [u0;v0]); % Matlab ODE solver.

hold on
plot(u(1,1),u(1,2),'ko','linewidth',3)
plot(u(:,1),u(:,2),'linewidth',3) % Plot solution.

end
axis equal
% axis([0 5 0 4])
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
% L=legend('Hare','Lynx');
% set(L,'Interpreter','latex')
set(gca,'fontsize',fs)
set(0,'DefaultFigureColor',[1 1 1])
export_fig '../Pictures/Polar_plot.png' -m3





function dydt = ODE(t,u)
% ODE equation to solve.
dydt = [u(2)+u(1)*(1-u(1)^2-u(2)^2);
    -u(1)+u(2)*(1-u(1)^2-u(2)^2)];
