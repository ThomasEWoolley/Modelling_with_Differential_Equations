clear
close all
clc

fs=15;
u=linspace(-3*pi,3*pi,1e2);
k=1;
eta=0.5;
axes('position',[0.16 0.2 0.8 0.7])
plot(u,0*u,'b')
hold on
plot(u,-k/eta*sin(u),'r')
L=legend('$\dot{\theta}=0$','$\dot{v}=0$','location','se');
set(L,'interpreter','latex','fontsize',fs)
xlabel('$\theta$','interpreter','latex')
ylabel('$\dot{\theta}$','interpreter','latex')


arrow([0.1302   -2.3214],[-1.2240   -1.8690])
arrow([-4.1927    2.2500],[-3.1510    1.7738])
arrow([-2.2656    0.3690],[-1.6927    0.8452])
arrow([2.1615   -0.5357],[1.3281   -1.1071])

arrow([4*pi/2 1],[4*pi/2+0.1 1])
arrow([0 1],[0.1 1])
arrow([-4*pi/2 1],[-4*pi/2+0.1 1])

arrow([3*pi/2 0],[3*pi/2 0.1])
arrow([-pi/2 0],[-pi/2 0.1])
arrow([-5*pi/2 0],[-5*pi/2 0.1])

arrow([-3*pi/2 0],[-3*pi/2 -0.1]);
arrow([pi/2 0],[pi/2 -0.1]);
arrow([5*pi/2 0],[5*pi/2 -0.1]);
axis tight
set(gca,'fontsize',15)
%%
for l=1:10
load(['../Pictures/Damped_trajectories_',num2str(l),'.mat'])
hold on
plot(u(1,1),u(1,2),'ko','linewidth',3)
plot(u(:,1),u(:,2),'linewidth',3) % Plot solution.
end
axis([-10 10 -3 3])

export_fig '../Pictures/Damped_Pendulum_phase_plane.png' -m3
