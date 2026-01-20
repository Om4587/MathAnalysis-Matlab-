%%
n = 50;
f = linspace(1,8,n);
time = -2:0.001:2;
 % initialize wavelets matrix
 wave = zeros(n,length(time));

 % loop over frequencies
 for fi = 1:n
     
     % 's' width parameter for Gaussian
     s = 5/(2*pi*f(fi));

     % create the wavelets for this frequency
     wave(fi,:) = cos(2*pi*f(fi)*time) .* exp( -time.^2 / (2*s^2));
 end

 figure(1),clf
 surf(time,f,wave)
 shading interp
 rotate3d on
