%% Uncertainity in Future money

% First, some basics about defining a patch

figure(1), clf

% specify x and y coordinates

x = [1 2 2.5 4 3 2];
y = [1 2  3  3 1 1];

patch(x,y,'y')
hold on
plot(x,y,'ks','MarkerSize',15,'MarkerFaceColor','g')

set(gca, 'xlim', [min(x)-.5 max(x)+.5], 'ylim',[min(y)-.5 max(y)+.5])

%% multiple patches drawn at the same time

% specify x and y coordinates

x = [1 2 2; 3 3 4];
y = [3 3 1; 1 3 3];

clf

patch(x',y','y') % drawing patches down the columns
hold on
plot(x,y,'ws','MarkerSize',15,'MarkerFaceColor','w')

%% Money

% initialize three variables
% I could also use one matrix with all variables
[money,moneyP,moneyM] = deal( 100000 );

% loop over years, starting "next year" (1+1)
for i = 1:9
    % apply formula in slides for different inflation amounts
    % note that 5% = 0.05
    money(i+1)  = money(i) * 10^(-.02);
    moneyP(i+1) = moneyP(i) * 10^(-.01);
    moneyM(i+1) = moneyM(i) * 10^(-.03);
end

% define x-axis labels as years, from system clock
year = clock;
year = year(1);
xlabels = year+(0:i);

% first, draw line plots
figure(2), clf, hold on

plot(xlabels,moneyM,'r','LineWidth',2);
plot(xlabels,money,'w--','LineWidth',2);
plot(xlabels,moneyP,'g','LineWidth',2);

% plot the patch
patch([xlabels xlabels(end:-1:1)], [moneyP money(end:-1:1)],'g','facealpha',.3,'linestyle','none');
patch([xlabels xlabels(end:-1:1)], [money moneyM(end:-1:1)],'r','facealpha',.3,'linestyle','none');
