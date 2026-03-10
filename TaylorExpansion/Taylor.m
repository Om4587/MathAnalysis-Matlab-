figure(1),clf
x = -10:0.01:10;
y = sin(x);
plot(x,y,'w','LineWidth',2)
axis([-10 10 -10 10])
grid on, hold on

%% First-Order Taylor Expansion

P = [1,0]; % x + 0;
yT1 = polyval(P,x);
plot(x,yT1,'y--','linew',2),hold on

% Third-Order Taylor Expansion

P = [-1/factorial(3) 0 1 0]; % -(1/3!)x^6 + x + 0;
yT3 = polyval(P,x);
plot(x,yT3,'r--','linew',2),hold on

% Fifth-Order Taylor Expansion

P = [-1/factorial(5) 0 -1/factorial(3) 0 1 0];
yT5 = polyval(P,x);
plot(x,yT5,'g--','linew',2),hold on

% Seventh-Order Taylor Expansion

P = [-1/factorial(7) 0 -1/factorial(5) 0 -1/factorial(3) 0 1 0];
yT7 = polyval(P,x);
plot(x,yT7,'b--','linew',2),hold on

%%

clc
clear
close all

x = -10:0.01:10;
y = sin(x);

figure(2),clf
plot(x,y,'w','LineWidth',3)
axis([-10 10 -2 2])
grid on
hold on

h = plot(x,zeros(size(x)),'g--','LineWidth',2);

for n = 1:2:25
    
    yT = zeros(size(x));
    
    for k = 0:(n-1)/2
        yT = yT + ((-1)^k .* x.^(2*k+1))/factorial(2*k+1);
    end
    
    set(h,'YData',yT)
    
    title(['Taylor Approximation of sin(x), Order = ',num2str(n)])
    
    pause(0.8)
end
