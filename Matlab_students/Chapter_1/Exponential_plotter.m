function Exponential_plotter(varargin)
% (c) Thomas E. Woolley, 2017.
clc
close all
fs=15;
r=0.1;
u0=0.1;
tspan = [0 50]; % Length of time the equation is solved for.
[t,u] = ode23(@(t,u) ODE(r,t,u), tspan, u0); % Matlab ODE solver.
plot(t,u,'linewidth',3) % Plot solution.
xlabel('Time','Interpreter','latex')
ylabel('Population','Interpreter','latex')
set(0,'DefaultFigureColor',[1 1 1])
set(gca,'fontsize',fs)
shg


function dydt = ODE(r,t,u)
% ODE equation to solve.
dydt = r*u; % The Logistic equation.