function Saddle_point_ODE(varargin)
% (c) Thomas E. Woolley, 2017.

clc
close all
fs=15;
u0=.25*[-1 -1 1 1];
v0=.25*[-1 1 -1 1];
tspan = [0 10]; % Length of time the equation is solved for.
figure('position',[0 0 2/3 1/3])
for i=1:length(u0)
[t,u] = ode23(@ODE, tspan, [u0(i);v0(i)]); % Matlab ODE solver.
subplot(1,3,3)
plot(u(:,1),u(:,2),'linewidth',3) % Plot solution.
hold on
subplot(1,3,1)
plot(t,u(:,1),'linewidth',3) % Plot solution.
hold on
subplot(1,3,2)
plot(t,u(:,2),'linewidth',3) % Plot solution.
hold on

end
% L=legend('$u_0=0$','$u_0=0.01$','$u_0=0.2$','$u_0=0.9$','$u_0=1$','$u_0=2$','location','ne')
% set(L,'Interpreter','latex')
subplot(1,3,3)
axis equal
axis([-1 1 -1 1])
xlabel('$u$','Interpreter','latex')
ylabel('$v$','Interpreter','latex')
set(0,'DefaultFigureColor',[1 1 1])
set(gca,'fontsize',fs)

subplot(1,3,1)
xlabel('$t$','Interpreter','latex')
ylabel('$u$','Interpreter','latex')
set(0,'DefaultFigureColor',[1 1 1])
set(gca,'fontsize',fs)
axis([0 5 -1 1])

subplot(1,3,2)
xlabel('$t$','Interpreter','latex')
ylabel('$v$','Interpreter','latex')
set(0,'DefaultFigureColor',[1 1 1])
set(gca,'fontsize',fs)
axis([0 5 -1 1])


export_fig '../Pictures/Centre.png' -m3



function dydt = ODE(t,u)
% ODE equation to solve.
dydt = [-u(2)-u(1)^2;
       u(1)+u(2)^2]; 