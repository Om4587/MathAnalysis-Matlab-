

theta = linspace(0, 2*pi, 400);

% Outer disk
r = 1;
x = r*cos(theta);
y = r*sin(theta);

figure;
fill(x, y, [0.8 0.9 1], 'EdgeColor','b','LineWidth',2);
hold on;
axis equal;
grid on;

% Closed curve inside
r2 = 0.6;
plot(r2*cos(theta), r2*sin(theta), 'r', 'LineWidth',2);

title('Simply Connected Domain (Disk)');
legend('Domain','Closed Curve');

%%

theta = linspace(0, 2*pi, 400);

% Outer and inner boundaries
r_outer = 1;
r_inner = 0.4;

x1 = r_outer*cos(theta);
y1 = r_outer*sin(theta);

x2 = r_inner*cos(theta);
y2 = r_inner*sin(theta);

figure(2),clf;
fill(x1, y1, [0.8 0.9 1], 'EdgeColor','b','LineWidth',2);
hold on;
fill(x2, y2, 'w', 'EdgeColor','k','LineWidth',2);

% Closed curve wrapping hole
r_loop = 0.6;
plot(r_loop*cos(theta), r_loop*sin(theta), 'r', 'LineWidth',2);

axis equal;
grid on;
title('Not Simply Connected Domain (Hole)');
legend('Outer boundary','Hole','Closed Curve');

%%

theta = linspace(0,2*pi,400);
figure; axis equal; grid on;
hold on;

for r = linspace(0.8, 0.05, 25)
    plot(r*cos(theta), r*sin(theta), 'r');
    pause(0.05)
end

title('Loop Shrinking to a Point (Simply Connected)');

%%

theta = linspace(0,2*pi,400);

figure(5);
plot(cos(theta), sin(theta),'b','LineWidth',2); % closed curve
hold on;
plot(0,0,'ro','MarkerSize',8,'MarkerFaceColor','r'); % missing point

axis equal;
grid on;
title('ℂ \ {0}  → Not Simply Connected');
legend('Closed curve','Missing point');
