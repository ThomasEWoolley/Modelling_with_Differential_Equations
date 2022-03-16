function Lorenz(varargin)
% (c) Thomas E. Woolley, 2017.

clc
close all
fs=15;
sigma=10;
beta=3;
rho=28;
p=[sigma,rho,beta];
u0=[1 1.1];
v0=[1 1];
w0=[1 1];
tspan = linspace(0,30,2e3); % Length of time the equation is solved for
figure('position',[0 1/3 2/3 1/3])

% cols=['b','g','r','c','m','y']
for i=1:length(u0)
[t,u] = ode23(@(t,u)ODE(t,u,p),tspan, [u0(i);v0(i);w0(i)]); % Matlab ODE solver.


subplot(1,4,1)
hold on
plot3(u(1,1),u(1,2),u(1,3),'ko','linewidth',3)
plot3(u(:,1),u(:,2),u(:,3),'linewidth',3) % Plot solution.
view([27 27])
subplot(1,4,2)
hold on
plot(u(:,1),u(:,2),'linewidth',3) % Plot solution.
subplot(1,4,3)
hold on
plot(u(:,1),u(:,3),'linewidth',3) % Plot solution.
subplot(1,4,4)
hold on
plot(u(:,2),u(:,3),'linewidth',3) % Plot solution.
Traj(:,i)=u(:,1);
end

subplot(1,4,1)
axis equal
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
zlabel('$z$','Interpreter','latex')
set(gca,'fontsize',fs)
subplot(1,4,2)
axis equal
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Interpreter','latex')
set(gca,'fontsize',fs)
subplot(1,4,3)
axis equal
xlabel('$x$','Interpreter','latex')
ylabel('$z$','Interpreter','latex')
set(gca,'fontsize',fs)
subplot(1,4,4)
axis equal
xlabel('$y$','Interpreter','latex')
ylabel('$z$','Interpreter','latex')
set(gca,'fontsize',fs)
export_fig(['../Pictures/Lorenz_sims_rho_',num2str(rho*10),'.png'],'-m3')

figure('position',[0 1/3 2/3 1/3])
plot(t,Traj(:,1),t,Traj(:,2),'linewidth',3) % Plot solution.
xlabel('$t$','Interpreter','latex')
ylabel('$x$','Interpreter','latex')
set(gca,'fontsize',fs)
export_fig(['../Pictures/Lorenz_chaos.png'],'-m3')




function dydt = ODE(t,u,p)
% ODE equation to solve.
sigma=p(1);
rho=p(2);
beta=p(3);
dydt = [sigma*(u(2)-u(1));
    u(1)*(rho-u(3))-u(2);
    u(1)*u(2)-beta*u(3)];
