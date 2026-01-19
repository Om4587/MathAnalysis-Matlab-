%% Gabor Path Marginal Histogram

% sine frequency
sinefreq = .005;

% sine phase

sinephase = -pi/4;

% width of gaussian (a.u.)
width = 50;

% resolution of the image
n = 200;

% sine wave initialization
[x,y] = ndgrid(-n:n);

Xp = x*cos(sinephase) + y*sin(sinephase);

% compute sine wave
sine2d = sin( 2*pi*sinefreq*x);

% create Gaussian
gaus2d = exp( -(x.^2 + y.^2) ./(2*width^2));

% point-wise multiply the image and Gaussian
img = abs(sine2d.* gaus2d );

figure(1), clf
% create an axis for thee Gabors patch

gab_ax = axes;
% position property is: [Left bottom width height]
set(gab_ax, 'Position', [.1 .1 .7 .7])
imagesc(-n:n,-n:n,img)
axis xy
clim = max(abs(img(:)));
set(gab_ax,'clim',[-clim clim]*.7,'xtick',[],'ytick',[])
