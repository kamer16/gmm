function plotGMM(init_data)
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
hold on;
plot(data(1, :, 1), data(2, :, 1), 'og');
hold on;
plot(data(1, :, 2), data(2, :, 2), 'og');

plot(init_data(1, :), init_data(2, :), 'ob');
end
