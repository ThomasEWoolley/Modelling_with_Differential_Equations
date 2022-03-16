function Duffing_plotter(varargin)
% (c) Thomas E. Woolley, 2017.
clc
close all
fs=15;



u0=1;
tspan = [0 1]; % Length of time the equation is solved for.
[t1,u1] = ode23(@(t,u)ODE1(t,u), tspan, u0); % Matlab ODE solver.
tspan = [0 1/2]; % Length of time the equation is solved for.
[t2,u2] = ode23(@(t,u)ODE2(t,u), tspan, u0); % Matlab ODE solver.

% figure('units','normalized','position',[0 0 1 1])
set(0,'DefaultFigureColor',[1 1 1])

% subplot(1,2)
plot(t1,u1,'linewidth',3) % Plot solution.
hold on
plot(t2,u2,'linewidth',3) % Plot solution.
% axis([0 max(t1) min(u1(:,2)) max(u(:,2))])
% 
xlabel('$t$','Interpreter','latex')
ylabel('Solution','Interpreter','latex')
axis tight
L=legend('$u(t)$','$u_2(t)$','location','nw')
set(L,'Interpreter','latex')
set(gca,'fontsize',fs)
xticks(0:0.2:1)

export_fig(['../Pictures/Non_dim_example.png'],'-m3a')


function dydt = ODE1(t,u)
% ODE equation to solve.
k0=1;
k1=1;
k2=1;

dydt = k0+k1*u+k2*u;


function dydt = ODE2(t,u)
% ODE equation to solve.
k0=2;
k1=2;
k2=2;

dydt = k0+k1*u+k2*u;