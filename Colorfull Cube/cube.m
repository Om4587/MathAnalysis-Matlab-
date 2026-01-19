%% Colorful cube

figure(1), clf

n  = 10;
ni = linspace(0,1,n);
[X,Y] = meshgrid(ni);
x = [X(:) X(:)]';
y = [Y(:) Y(:)]';
z = [zeros(1,n*n); ones(1,n*n)];

% use plot3 t draw all conncting lines

plot3(x,y,z,'k',y,z,x,'k',z,x,y,'k')

% plot the nodes
hold on
[X,Y,Z] = meshgrid(ni);
color = randn(1,n^3);
color = logspace(log10(1),log10(1000),n^3);
h = scatter3(X(:),Y(:),Z(:),200,color,"filled");
set(h, 'Marker','s')
axis square


rotate3d on
