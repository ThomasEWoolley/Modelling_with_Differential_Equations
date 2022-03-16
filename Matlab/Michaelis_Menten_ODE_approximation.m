function Fishing_problem_ODEs(varargin)
% (c) Thomas E. Woolley, 2017.

clc
close all
fs=15;
u0=1;
v0=0;
tspan = linspace(0,20,1e3); % Length of time the equation is solved for.
[t1,u1] = ode23(@ODE1,tspan, [u0;v0]); % Matlab ODE solver.
[t2,u2] = ode23(@ODE2,tspan, u0); % Matlab ODE solver.
K=2;
figure('position',[0 1/3 2/3 1/3])
subplot(1,2,1)
plot(t1,u1(:,1),'linewidth',3) % Plot solution.
hold on
plot(t2,u2,'--','linewidth',3) % Plot solution.
 xlabel('$t$','Interpreter','latex')
 ylabel('$u$','Interpreter','latex')
 legend('Full solution','Approximate solution')
 set(gca,'fontsize',fs)
subplot(1,2,2)
plot(t1,u1(:,2),'linewidth',3) % Plot solution.
hold on
plot(t1,u2./(u2+K),'--','linewidth',3) % Plot solution.
 xlabel('$t$','Interpreter','latex')
 ylabel('$v$','Interpreter','latex')
 legend('Full solution','Approximate solution')
 set(gca,'fontsize',fs)


set(0,'DefaultFigureColor',[1 1 1])
export_fig '../Pictures/Michaelis-Menten_approximation.png' -m3



function dydt = ODE1(t,u)
% ODE equation to solve.
K=2;lambda=1;
epsilon=0.001;
dydt = [-u(1)+(u(1)+K-lambda)*u(2);
         (u(1)-(u(1)+K)*u(2))/epsilon]; 
   
   
function dydt = ODE2(t,u)
% ODE equation to solve.
K=2;lambda=1;
dydt = -u+(u+K-lambda)*u/(u+K);  