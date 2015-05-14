function data = genGMM(m, model)
k = length(model);
y = rand(1, m);
binf = 0;
data = zeros(2, m);
for i = 1:k
    datatmp = genGauss(m, model{i});
    ind = find((y >= binf) .* (y < (binf + model{i}.w)));
    data(:, ind) = datatmp(:, ind);
    binf = binf + model{i}.w;
end
end