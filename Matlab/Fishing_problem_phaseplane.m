clear
close all
clc

fs=12;
u=linspace(0,5,1e2);
v=linspace(0,5,1e2);
v1=sqrt(u);
v2=4*(1-u);

axes('position',[0.15 0.2 0.8 0.7])
plot(0*u,v,'r')
hold on
plot(u,v1,'b')
plot(u,v2,'r')
plot(u,0*v,'k')
% axis equal
axis([0 2 0 5])
L=legend('$\dot{u}=0$','$\dot{v}=0$','location','ne');
set(L,'interpreter','latex','fontsize',15)
xlabel('$u$','interpreter','latex')
ylabel('$v$','interpreter','latex')
set(gca,'fontsize',15)


text(1,4,'$\dot{u}<0$','interpreter','latex','fontsize',fs)
text(1,3.5,'$\dot{v}<0$','interpreter','latex','fontsize',fs)
arrow([1,3],[0.7,2.5]);

text(0.1,2,'$\dot{u}>0$','interpreter','latex','fontsize',fs)
text(0.1,1.5,'$\dot{v}<0$','interpreter','latex','fontsize',fs)
arrow([0.1224,1.1012],[0.2422,0.7440]);

text(1.25,0.5,'$\dot{u}<0$','interpreter','latex','fontsize',fs)
text(1.7,0.5,'$\dot{v}>0$','interpreter','latex','fontsize',fs)
arrow([1.1484,0.3671],[1.0182,0.7440]);

text(0.3,0.25,'$\dot{u}>0$','interpreter','latex','fontsize',fs)
text(0.6,0.25,'$\dot{v}>0$','interpreter','latex','fontsize',fs)
arrow([0.1016,0.0893],[0.28,0.3]);

for i=1:6:length(u)
    if (u(i)<0.7)
        arrow([u(i) v1(i)],[u(i)+0.1 v1(i)]);
    end
    if (u(i)>0.7)&&(i<40)
        arrow([u(i) v1(i)],[u(i)-0.1 v1(i)]);
    end
    
    if (v2(i)>1)
        arrow([u(i) v2(i)],[u(i) v2(i)-0.2]);
    end
    
     if (v2(i)<1)&&(i<20)
        arrow([u(i) v2(i)],[u(i) v2(i)+0.2]);
    end
end
export_fig '../Pictures/Fishing_phase_plane.png' -m3
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