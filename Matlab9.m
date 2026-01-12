%%
% set threshold
thres = exp(-10);

%initialize initial value
[currval, startval] = deal( 10 );
decayvar = nan(1,1000);

% counter
counter = 0;
currval = startval;

% stay in loop as long as needed
while currval>thres

    % increase counter
    counter = counter+1;
    % update deacy variable
    decayvar(counter+1) = currval;
    % decrese the target value
    currval = currval * rand^(1/2);
    
end

figure(1), clf
plot(decayvar,'ws-','linew',2,'markersize',15,'markerfacecolor','k')
xlabel('Iteration'), ylabel('Value') 
title([ num2str(counter) ' iteration until threshold'] )

