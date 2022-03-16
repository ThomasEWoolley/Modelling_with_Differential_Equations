function Multi_stability_multi_IC_plotter_E9(varargin)
% (c) Thomas E. Woolley, 2017.

clc
close all
fs=15;
u=[0, 0.01 0.2 0.9 1 2];
tspan = [0 20]; % Length of time the equation is solved for.

for u0=u
[t,u] = ode23(@ODE, tspan, u0); % Matlab ODE solver.
plot(t,u,'linewidth',3) % Plot solution.
hold on
end
plot(t,0*u,'k.')
plot(t,0*u+0.6364,'k.')
plot(t,0*u+1.596,'k.')
L=legend('$u_0=0$','$u_0=0.01$','$u_0=0.2$','$u_0=0.9$','$u_0=1$','$u_0=2$','location','ne')
set(L,'Interpreter','latex')
xlabel('Time','Interpreter','latex')
ylabel('Population','Interpreter','latex')
set(0,'DefaultFigureColor',[1 1 1])
set(gca,'fontsize',fs)
export_fig '../Pictures/Multi_stable_multi_IC_9.png' -m3



function dydt = ODE(t,u)
% ODE equation to solve.
dydt = 2*u^2/(1+u^2)-0.9*u; % The Logistic equation.