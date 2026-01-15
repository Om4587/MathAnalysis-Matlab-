%% Piecewise Function

x = linspace(-10,20,1000);
y = zeros(size(x));

for i = 1:length(x)
    % piecewise 1
    if x(i)<= -1
        y(i) = sin(2*pi*4*x(i));
    % Piecewise 2
    elseif x(i)<=0 && x(i)> -1
        y(i) = 0;
    % Piecewise 3
    elseif x(i)<=3 && x(i)>0
        y(i) = x(i);
    % Picewise 4
    elseif x(i)>3 && x(i)<10
        y(i) = exp(x(i)/10);
    % Piecewise 5
    else
        y(i) = 1 - (x(i)/10);
    end
end
plot(x,y)

%% Before the better solution,  a primer on dsearchn

% question: which index contains the number 4?
t = [1 3 4 5 6 7];

% Could solve with find
find(t == 4)

% new question: which index is *closest to 4.01?

find(t == 4.01)

idx = dsearchn(t', 4.01);
t(idx)

[~, idx] = min(abs(t-4.01));
t(idx)
