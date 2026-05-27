clc;
clear;
close all;

A = [3 -1; -1 3];

% Compute eigenvalues and eigenvectors
[V,D] = eig(A);

disp('Eigenvalues:')
disp(diag(D))

disp('Eigenvectors:')
disp(V)

% Vector field grid
[x,y] = meshgrid(-4:0.5:4,-4:0.5:4);

u = A(1,1)*x + A(1,2)*y;
v = A(2,1)*x + A(2,2)*y;

figure

quiver(x,y,u,v,'w','linew',1)
hold on

axis([-4 4 -4 4])
grid on
xlabel('x_1')
ylabel('x_2')
title('Phase Portrait with Eigenvector Curves')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

s = linspace(-4,4,200);

v1 = V(:,1);
v2 = V(:,2);

plot(s*v1(1),s*v1(2),'r','LineWidth',3)
plot(s*v2(1),s*v2(2),'g','LineWidth',3)


% Define system
sys = @(t,X) A*X;

theta = linspace(0,2*pi,20);
radius = 0.3;

tspan = [0 1];

traj_data = cell(length(theta),1);


for i = 1:length(theta)

    x0 = [radius*cos(theta(i)); radius*sin(theta(i))];

    [t,traj] = ode45(sys,tspan,x0);

    traj_data{i} = traj;

end

for k = 1:60
    for i = 1:length(theta)
        traj = traj_data{i};
        if k <= length(traj)

            plot(traj(1:k,1),traj(1:k,2),'b','LineWidth',1.5)

            plot(traj(k,1),traj(k,2),'ko','MarkerFaceColor','k')

            pos = traj(k,:)';
            dir = A*pos;
            dir = dir/norm(dir)*0.3;

            quiver(pos(1),pos(2),dir(1),dir(2),'b','MaxHeadSize',2)

        end

    end

    drawnow
    pause(0.05)

end

hold off
