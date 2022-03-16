function Fitzhugh_Nagumo(varargin)
% (c) Thomas E. Woolley, 2017.

clc
close all
fs=15;
tspan = linspace(0,100,1e4); % Length of time the equation is solved for
k=1;
eta=0.5;
% figure('position',[0 1/3 2/3 1/3])
l=1;
for r=linspace(-10,10,10)
u0=r;
v0=2.5;
[t,u] = ode23(@(t,u)ODE(t,u,k,eta),tspan, [u0;v0]); % Matlab ODE solver.

hold on
plot(u(1,1),u(1,2),'ko','linewidth',3)
plot(u(:,1),u(:,2),'linewidth',3) % Plot solution.
save(['../Pictures/Damped_trajectories_',num2str(l),'.mat'])
l=l+1;
end
% axis([-0.5 1.5 -0.2 0.2])






function dydt = ODE(t,u,k,eta)
% ODE equation to solve.
dydt = [u(2);
    -eta*u(2)-k*sin(u(1))];
