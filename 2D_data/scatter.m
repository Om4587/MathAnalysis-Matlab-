%%

%generate 2D data
n = 1000;
data = zeros(2,n);
% dimension 1 is e^x
data(1,:) = exp(linspace(-1,3,n));
% dimension 2 is random ~N(0,1)
data(2,:) = randn(1,n);

figure(1),clf
h = plot(data(1,:), data(2,:));
% have a look at a option to set
get(h)
% use set to make the plot look mote interesting

set(h,'marker','p')
set(h, 'LineStyle','none','MarkerSize', 10,'MarkerFaceColor','r', 'MarkerEdgeColor', 'b')

%% Scatter

% basic use
scatter(data(1,:), data(2,:))

% include marker size and filled
scatter(data(1,:),data(2,:), 200,'filled')

% include color as 4th option

scatter(data(1,:),data(2,:),80,randn(1,n),'filled')
