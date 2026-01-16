%% Brief intro to bsxfun

m = randn(4,10);
v = 1:10;

bsxfun(@plus,m,v)

%%
% data sizes
m = 30; % rows
n = 6;  %cols

% create data
data = bsxfun(@plus,randn(m,n),(1:n).^2);

figure(1), clf
subplot(131)

% bar plot of average of each features
bar(1:n,mean(data,1))
axis square, set(gca,'xlim', [0 n+1], 'xtick',1:n)

subplot(132)
% error of standard deviation over observation within each feature
errorbar(1:n, mean(data), std(data),'s')
axis square, set(gca,'xlim', [0 n+1], 'xtick',1:n)

subplot(133)
%errorbar on top of bar
bar(1:n,mean(data,1))
hold on
errorbar(1:n, mean(data), std(data),'.')
axis square, set(gca,'xlim', [0 n+1], 'xtick',1:n)
