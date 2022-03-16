clear
close all
clc

fs=15;
u=linspace(0,5,1e4);
v=linspace(-5,5,1e4);
v2=sqrt(u);
v11=1*(1-u);
v12=2*(1-u);
v13=3*(1-u);
v14=4*(1-u);

axes('position',[0.15 0.2 0.8 0.7])
plot(0*u,v,'r')
hold on
plot(u,v2,'b')
plot(u,-v2,'b')
plot(u,v11,'r')
plot(u,v12,'r')
plot(u,v13,'r')
plot(u,v14,'r')
plot(u,0*v,'k')
% axis equal
axis([0 4 -5 5])
arrow([0.25 0.5],[0.75 3])
text(0.8,3.1,'increasing $\alpha$','interpreter','latex','fontsize',fs)
L=legend('$\dot{u}=0$','$\dot{v}=0$','location','ne');
set(L,'interpreter','latex','fontsize',fs)
xlabel('$u$','interpreter','latex')
ylabel('$v$','interpreter','latex')
set(gca,'fontsize',fs)
export_fig '../Pictures/Nullcline_multiple_alpha.png' -m3
% 
% %%
% clear
% close all
% clc
% 
% fs=15;
% si=400;
% u=linspace(0,5,1e4);
% v1=(u-2).*(u-3);
% plot(u,v1,'b')
% hold on
% axis([0 5 -5 5])
% text(2,3,'$\dot{u}>0$','interpreter','latex','fontsize',fs)
% text(2,-3,'$\dot{u}<0$','interpreter','latex','fontsize',fs)
% arrowh([2 2.5],[2 2],'k',si);
% arrowh([3 2.5]-0.2,-[2 2],'k',si);
% xlabel('$u$','interpreter','latex')
% ylabel('$v$','interpreter','latex')
% set(gca,'fontsize',fs)
% export_fig '../Pictures/u_nullcline.png' -m3
% 
% %%
% clear
% close all
% clc
% 
% fs=15;
% si=400;
% u=linspace(0,5,1e4);
% v2=log(u);
% plot(u,v2,'r')
% hold on
% axis([0 5 -5 5])
% text(2,3,'$\dot{v}>0$','interpreter','latex','fontsize',fs)
% text(2,-3,'$\dot{v}<0$','interpreter','latex','fontsize',fs)
% arrowh([2.5 2.5],[1 2],'k',si);
% arrowh([2.5 2.5],[-1 -2],'k',si);
% xlabel('$u$','interpreter','latex')
% ylabel('$v$','interpreter','latex')
% set(gca,'fontsize',fs)
% export_fig '../Pictures/v_nullcline.png' -m3
% 
% %%
% clear
% close all
% clc
% si=400;
% fs=15;
% u=linspace(0,5,1e4);
% v2=log(u);
% v1=(u-2).*(u-3);
% plot(u,v1,'b')
% hold on
% plot(u,v2,'r')
% axis([0 5 -5 5])
% annotation('textarrow',[.55,.6],[.55,.6]+0.2);
% annotation('textarrow',[.55,.5]+0.32,[.5,.55]+0.2);
% annotation('textarrow',[.55,.5],[.55,.5]-0.2);
% annotation('textarrow',[.55,.5]-0.32,[.5,.55]+0.2);
% annotation('textarrow',[.55,.6],[.6,.55]-0.01);
% scale=[0.13 0.11 0.7750 0.8150];
% 
% for i=1:1000:length(u)
%     if (v1(i)<5)&(v1(i)>-5)&(u(i)<2)
%         arrow([u(i) v1(i)],[u(i) v1(i)+0.5]);
%     end
%     if (v1(i)<5)&(v1(i)>-5)&(u(i)>4)
%         arrow([u(i) v1(i)],[u(i) v1(i)+0.5]);
%     end
%     
%     if (v1(i)<5)&(v1(i)>-5)&(u(i)<4)&(u(i)>2)
%         arrow([u(i) v1(i)],[u(i) v1(i)-0.5]);
%     end
% end
% 
% for i=[250 500 1:1000:length(u)]
%     if (v2(i)<5)&(v2(i)>-5)&(u(i)<2)
%         arrow([u(i) v2(i)],[u(i)-0.2 v2(i)]);
%     end
%     
%     if (v2(i)<5)&(v2(i)>-5)&(u(i)>4)
%         arrow([u(i) v2(i)],[u(i)-0.2 v2(i)]);
%     end
%     
%     if (v2(i)<5)&(v2(i)>-5)&(u(i)<4)&(u(i)>2)
%         arrow([u(i) v2(i)],[u(i)+0.2 v2(i)]);
%     end
% end
% 
% L=legend('$\dot{u}=0$','$\dot{v}=0$','location','se');
% set(L,'interpreter','latex','fontsize',fs)
% xlabel('$u$','interpreter','latex')
% ylabel('$v$','interpreter','latex')
% set(gca,'fontsize',fs)
% export_fig '../Pictures/uv_nullcline.png' -m3