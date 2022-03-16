function Duffing_plotter(varargin)
% (c) Thomas E. Woolley, 2017.
clc
close all
fs=15;


gamma=0.1
u0=[1;0];
tspan = [0 100]; % Length of time the equation is solved for.
[t,u] = ode23(@(t,u)ODE(gamma,t,u), tspan, u0); % Matlab ODE solver.

figure('units','normalized','position',[0 0 1 1])
set(0,'DefaultFigureColor',[1 1 1])

subplot(3,4,[1:3])
plot(t,u(:,2),'linewidth',3) % Plot solution.
axis([0 max(t) min(u(:,2)) max(u(:,2))])

xlabel('$t$','Interpreter','latex')
ylabel('$x(t)$','Interpreter','latex')
title('$\gamma=0.1$','Interpreter','latex')
set(gca,'fontsize',fs)

subplot(3,4,4)
plot(u(:,1),u(:,2),'linewidth',3) % Plot solution.
hold on
plot(u(end,1),u(end,2),'o','linewidth',3) % Plot solution.
hold off
axis([min(u(:,1)) max(u(:,1)) min(u(:,2)) max(u(:,2))])

xlabel('$\dot{x}(t)$','Interpreter','latex')
ylabel('$x(t)$','Interpreter','latex')
set(gca,'fontsize',fs)

gamma=0.2
u0=[1;0];
tspan = [0 100]; % Length of time the equation is solved for.
[t,u] = ode23(@(t,u)ODE(gamma,t,u), tspan, u0); % Matlab ODE solver.


set(0,'DefaultFigureColor',[1 1 1])

subplot(3,4,[5:7])
plot(t,u(:,2),'linewidth',3) % Plot solution.
axis([0 max(t) min(u(:,2)) max(u(:,2))])

xlabel('$t$','Interpreter','latex')
ylabel('$x(t)$','Interpreter','latex')
title('$\gamma=0.2$','Interpreter','latex')
set(gca,'fontsize',fs)

subplot(3,4,8)
plot(u(:,1),u(:,2),'linewidth',3) % Plot solution.
hold on
plot(u(end,1),u(end,2),'o','linewidth',3) % Plot solution.
hold off
axis([min(u(:,1)) max(u(:,1)) min(u(:,2)) max(u(:,2))])

xlabel('$\dot{x}(t)$','Interpreter','latex')
ylabel('$x(t)$','Interpreter','latex')
set(gca,'fontsize',fs)


gamma=0.3
u0=[1;0];
tspan = [0 100]; % Length of time the equation is solved for.
[t,u] = ode23(@(t,u)ODE(gamma,t,u), tspan, u0); % Matlab ODE solver.

subplot(3,4,[9:11])
plot(t,u(:,2),'linewidth',3) % Plot solution.
axis([0 max(t) min(u(:,2)) max(u(:,2))])

xlabel('$t$','Interpreter','latex')
ylabel('$x(t)$','Interpreter','latex')
title('$\gamma=0.3$','Interpreter','latex')
set(gca,'fontsize',fs)

subplot(3,4,12)
plot(u(:,1),u(:,2),'linewidth',3) % Plot solution.
hold on
plot(u(end,1),u(end,2),'o','linewidth',3) % Plot solution.
hold off
axis([min(u(:,1)) max(u(:,1)) min(u(:,2)) max(u(:,2))])

xlabel('$\dot{x}(t)$','Interpreter','latex')
ylabel('$x(t)$','Interpreter','latex')
set(gca,'fontsize',fs)

drawnow

set(0,'DefaultFigureColor',[1 1 1])
export_fig(['../Pictures/Duffing.png'],'-m3a')


function dydt = ODE(gamma,t,u)
% ODE equation to solve.
alpha=1;
beta=-1;
delta=0.2;
omega=1;

dydt = [gamma*cos(omega*t)-alpha*u(2)^3-beta*u(2)-2*delta*u(1);
    u(1)]; % The Logistic equation.