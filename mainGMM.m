nm = 5;
data = initGauss(nm);
[d n] = size(data);
nb_iter = 400;
models = cell(nm, 1);

model = cell(1, 3);
for i = 1:nm
    % The weight of this model
    model{i, 1} = 1 / nm;
    % The mu params of this model
    model{i, 2} = rand(d, 1);
    model{i, 2} = data(:, i);
    model{i, 3} = eye(d);
end

% Normalize data
% data = data - repmat(mean(data, 2), 1, n);
% data = data ./ repmat(std(data, 1, 2), 1, n);
figure;
for i = 1:nb_iter
    clf;
    plot(data(1, :), data(2, :), 'og');
    for mod = 1:nm
        plotGaus(model{mod, 2}, model{mod, 3}, 'r');
    end
    pause
    % E-step
    pl = logExpectGMM(data, model);
    % M-step
    model = m_stepGMM(data, model, pl);
end
clf;
plot(data(1, :), data(2, :), 'og');
for mod = 1:nm
        plotGaus(model{mod, 2}, model{mod, 3}, 'r');
end
