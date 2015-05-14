function plotGMM(models, nb_elt)
[nb_mod p] = size(models);
mu = models{1, 2};
d = length(mu);
data = zeros(d, nb_elt, nb_mod);
for i = 1:nb_mod
    mu = models{i, 2};
    sig = models{i, 3};
    m.mu = mu;
    m.sig = sig;
    data(:, :, i) = genGauss(nb_elt, m);
end
plot(data(1, :, 1), data(2, :, 1), 'og');
plot(data(1, :, 2), data(2, :, 2), 'og');
end
