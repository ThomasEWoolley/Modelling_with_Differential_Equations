function Duffing_animation(varargin)
% Simple ODE solver for the Duffing equation,
% d^2x/dt^2+delta*dx/dt+beta*x+alpha*x^3=gamma*cos(omega*t)
% If the function is called without parameters then default parameters,
% alpha=1; beta=-1; delta=0.2; omega=1; gamma=0.2;
% are used.
% Alternatively, gamma needs to be passed to the function
% in the form
% Duffing(gamma).
% Try Duffing(0.5)
% (c) Thomas E. Woolley, 2017.

clc
close all

cont=1; % Checking variable.

% The if loop checks how many variables are specified.
if isempty(varargin)
gamma=0.2;
elseif length(varargin)~=1
    disp('This function must have either 1 parameter, or no parameters, specified')
    cont=0;
else
    gamma=varargin{1};
end

if cont==1
    
    u0=[1;0];
    tspan = [0 100]; % Length of time the equation is solved for.
    [t,u] = ode23(@(t,u)ODE(gamma,t,u), tspan, u0); % Matlab ODE solver.
    
    figure('units','normalized','position',[0 1/3 1 1/2])
    set(0,'DefaultFigureColor',[1 1 1])
    
    for i=1:length(t)
        subplot(1,4,[1:3])
        plot(t(1:i),u(1:i,2),'linewidth',3) % Plot solution.
        axis([0 max(t) min(u(:,2)) max(u(:,2))])
        
        xlabel('$t$','Interpreter','latex')
        ylabel('$x(t)$','Interpreter','latex')
        
        
        subplot(1,4,4)
        plot(u(1:i,1),u(1:i,2),'linewidth',3) % Plot solution.
        hold on
        plot(u(i,1),u(i,2),'o','linewidth',3) % Plot solution.
        hold off
        axis([min(u(:,1)) max(u(:,1)) min(u(:,2)) max(u(:,2))])
        
        xlabel('$\dot{x}(t)$','Interpreter','latex')
        ylabel('$x(t)$','Interpreter','latex')
        drawnow
    end
end


function dydt = ODE(gamma,t,u)
% ODE equation to solve.
alpha=1;
beta=-1;
delta=0.2;
omega=1;

dydt = [gamma*cos(omega*t)-alpha*u(2)^3-beta*u(2)-2*delta*u(1);
    u(1)]; % The Logistic equation.