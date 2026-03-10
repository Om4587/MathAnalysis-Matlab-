w = 2*pi;
d = .25;
A = [0 1; -w^2 -2*d*w];

dt = 0.001;
T = 10;

x0 = [2; 0];

xF(:,1) = x0;
tF(1) = 0;
for k = 1:T/dt
    tF(k+1) = k*dt;
    xF(:,k+1) = (eye(2) + dt*A) * xF(:,k);
end
figure(1),clf
plot(tF,xF(1,:),'w','LineWidth',2)

[t,xGood] = ode45( @(t,x) A*x, 0:dt:T, x0);

hold on
plot(t,xGood(:,1),'r','LineWidth',2)
xlabel('Time [s]')
ylabel('Position [m]')

% Velocity
v = xGood(:,2);

% Acceleration (from system equation)
a = zeros(length(t),1);

for k = 1:length(t)
    xdot = A*xGood(k,:)';
    a(k) = xdot(2);
end

figure(2),clf
plot(v,a,'w','linew',2)
grid on
xlabel('Velocity')
ylabel('Acceleration')
title('Velocity vs Acceleration Phase Plot')
