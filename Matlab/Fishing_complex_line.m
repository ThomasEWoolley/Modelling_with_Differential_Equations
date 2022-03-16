ccc
[alpha,beta]=meshgrid(linspace(0,4,1e3),linspace(0,4,1e3));
F=-(4*alpha.^2.*beta+2*alpha.^2+4*beta.^2+1).*(-1+sqrt(4*alpha.^2+1))./(2*alpha.^2)...
    +alpha.^2+4.*beta.^2+1;
surf(alpha,beta,F,double(F>0))
% axis([0 4 0 4 -1 1])
view([150 30])
view(2)
shading interp
xlabel('$\alpha$','interpreter','latex')
ylabel('$\beta$','interpreter','latex')

% zlabel('$Tr(J)^2-4Det(J)$','interpreter','latex')
export_fig '../Pictures/Fishing_complex.png' -m3