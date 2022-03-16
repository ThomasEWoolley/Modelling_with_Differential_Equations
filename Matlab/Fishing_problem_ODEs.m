function Fishing_problem_ODEs(varargin)
% (c) Thomas E. Woolley, 2017.

clc
close all
fs=15;
alpha=4;
u0=[0.1 0.25 1.5  1.5 0.5];
v0=[0.1 1    4    0.5  4];
tspan = linspace(0,100,1e3); % Length of time the equation is solved for.
% figure('position',[0 0 2/3 1/3])
u=linspace(0,5,1e4);
v1=alpha*(1-u);
v2=sqrt(u);
plot(u,v1,'b--');
hold on
plot(u,v2,'r--');
for i=1:length(u0)
[t,u] = ode23(@(t,u)ODE(t,u,alpha), tspan, [u0(i);v0(i)]); % Matlab ODE solver.
% subplot(1,3,3)
plot(u(:,1),u(:,2),'linewidth',3) % Plot solution.
hold on
end

axis([0 2 0 5])
xlabel('$u$','Interpreter','latex')
ylabel('$v$','Interpreter','latex')
set(0,'DefaultFigureColor',[1 1 1])
set(gca,'fontsize',fs)

axes('position',[0.6 0.6 0.3 0.3])
for i=1:length(u0)
[t,u] = ode23(@(t,u)ODE(t,u,alpha), tspan, [u0(i);v0(i)]); % Matlab ODE solver.

plot(u(:,1),u(:,2),'linewidth',3) % Plot solution.
hold on
end
axis([0.77 0.79 0.86 0.9])
export_fig '../Pictures/Fishing_simulation.png' -m3



function dydt = ODE(t,u,alpha)
% ODE equation to solve.

beta=2;

dydt = [alpha*(u(1)-u(1)^2)-u(1)*u(2);
       beta*(u(1)-u(2)^2)]; 