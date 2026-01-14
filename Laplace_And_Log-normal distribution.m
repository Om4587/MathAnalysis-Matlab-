%%Laplace Distribution
clc
clear
x = -5:0.1:5;
lam = 3;

laplace = 0.5 * lam * exp(-lam*abs(x));

laplace = laplace./sum(laplace);

figure(1), clf
subplot(211)
plot(x, laplace,'linew',2)

subplot(212)
plot(x,cumsum(laplace),'linew',2)

%% Log-Normal Distribution

x = 0:0.01:5;
m = 0;
s = 0.5;

num = exp(-(log(x)-m).^2/(2*s^2));
den = 1 ./ (s*x*sqrt(2*pi));

logN = num .* den;

logN = logN / sum(logN);

figure(2), clf
subplot(211)
plot(x, logN,'linew',2)

subplot(212)
plot(x, cumsum(logN), 'linew',2)

