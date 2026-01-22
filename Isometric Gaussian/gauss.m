%%

% isotropic Gaussian parameters
n = 100;
s = 2;

x = linspace(-5,5,n);
[X,Y] = meshgrid(x);

gaus2d = exp( -(X.^2 + Y.^2) / (2*s^2) );
figure(1),clf

% basic surf command
surf(x,x,gaus2d)
shading interp
axis square
rotate3d on
