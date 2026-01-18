%% Create an arbitary 2D spatial dataset using ginput and then compute and display the Euclidean distance matrix

% setup the figure
figure(1),clf
h = plot(nan,nan,'rs','MarkerSize',10,'markerfacecolor','y');
title('Press space when finished')
axis( [-1 1 -1 1] )

% initialize data points
[x,y] = deal([]);

% enter while loop
toggle = true; % boolean toggle
while toggle

    % get one new input
    [xt,yt,button] = ginput(1);
    x = [x xt];         
    y = [y yt];
 
    % update axis display
    set(h,'XData',x,'YData',y);

    % check if space key was pressed
    % and switch off toggle if appropiate
    if strcmp((char(button)),' ')
        toggle = false;
    end
end

%% Distance matrix

% number of button presses
n = numel(x);

% all-to-all distance 
distmat = zeros(n);
for i = 1:n
    for j = 1:n
        % Euclidean distmat b/w dot i and j
        distmat(i,j) = sqrt( (x(i)-x(j))^2 + (y(i)-y(j))^2 );
    end
end

% compute the distance matrix in one line using bsxfun
distmat1 = sqrt( bsxfun(@minus,x,x').^2 + bsxfun(@minus,y,y').^2 );

% plot the data
figure(2), clf
subplot(221)
plot(x,y,'rs','MarkerSize',10,'MarkerFaceColor','y')
axis square
title('All points')

% image the distance matrix
subplot(222)
imagesc(distmat)
axis square
title('distance matrix')

% Plot histogram

subplot(212)
hist(nonzeros(triu(distmat)), 100)
title('Histogram')
