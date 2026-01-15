%% Circular P-value and its approximation

z = linspace(0,1,99);
n = 1:100;


[pfull, papprox] = deal( zeros(length(n), length(z)) );

for ni = 1:length(n)
    for zi = 1:length(z)
        pfull(ni,zi) = exp(sqrt(1+4*n(ni) + 4*(n(ni)^2 - (n(ni)*z(zi))^2)) - (1+2*n(ni)));
        papprox(ni,zi) = exp( -n(ni)*z(zi)^2 );
    end
end

figure(1), clf
subplot(121)
contourf(z,n,pfull,40,'linecolor','none')
axis square, set(gca,'clim', [0 1])
xlabel('z'), ylabel('N')
colorbar
title('Full Formula')

subplot(122)
contourf(z,n,papprox,40,'linecolor','none')
axis square, set(gca,'clim', [0 1])
xlabel('z'), ylabel('N')
colorbar
title('Approximation')
