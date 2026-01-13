% sin(2pift + fi) // Gaussian = ae^-(t-c)^2/2s^2
% Sine wave parameter
time = 0: 0.01 : 4*pi;
amp1 = 3;
phas = pi/3;
frex = 1;

%compute sine wave
waveS = amp1 * sin(2*pi*frex*time + phas);

%compute cosine wave
waveC = amp1 * cos(2*pi*frex*time + phas);

%comput tangent wave
waveT = amp1 * tan(2*pi*frex*time + phas);

figure(1), clf
subplot(131)
plot(time, waveS,'linew',2)
xlabel('Time(rad)')
ylabel('Amplitude')
set(gca,'xtick', 0:pi/2:time(end), 'fontsize', 15), axis square

subplot(132)
plot(time, waveC,'linew',2)
xlabel('Time(rad)')
ylabel('Amplitude')
set(gca,'xtick', 0:pi/2:time(end), 'fontsize', 15), axis square

subplot(133)
plot(time, waveT,'linew',2)
xlabel('Time(rad)')
ylabel('Amplitude')
set(gca,'xtick', 0:pi/2:time(end), 'fontsize', 15), axis square

