%%Gaussian = ae^-(t-c)^2/2s^2

x = 0:0.1:10;
amp1 = 3;
cent = 7;
width = 0.8;

num = -(x - cent).^2;
den = 2*(width)^2

gauss = exp(num ./ den);

figure(1), clf
plot(x, gauss,'LineWidth',2)
%% gaussian tappered tangent

%list some parameters of the simulation
fs = 8000; %Hz
time = 0:1/fs:3-1/fs;
amp1 = 3;
cent = 1.5;
widt = .3;

%create the gaussiam
num = -(time - cent).^2;
den = 2*widt^2;

gauss = amp1 * exp(num/den);

trigf = tan(2*pi*time*2);

wave = trigf .* gauss;
figure(3), clf
plot(time, wave, 'w','Linew',2)
