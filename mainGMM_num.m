load data.mat
[max_m] = length(TRAIN)
TRAIN = TRAIN(1:max_m, :)';
data = double(TRAIN);
nm = 16;
[d n] = size(data);
nb_iter = 5;

% Normalize data
med = mean(data, 2);
data = data - repmat(med, 1, n);
sd = std(data, 1, 2);
sd(find(sd == 0)) = 1;
data = data ./ repmat(sd, 1, n);

nc = 10;
models = cell(nc, 1);
for j = 1:nc
    models{j} = cell(nm, 3);
    for i = 1:nm
        % The weight of this model
        models{j}{i, 1} = 1 / nm;
        % The mu params of this model
        models{j}{i, 2} = rand(d, 1);
        %model{i, 2} = mean(data(:, find(LABEL_TRAIN(1:max_m) == (i-1))), 2);
        models{j}{i, 3} = eye(d);
    end
end

for j = 1:nc
    train = data(:, find(LABEL_TRAIN(1:max_m) == j - 1));
    for i = 1:nb_iter
        if i == nb_iter
            figure;
            for idx = 1:nm
                subplot(4, nm / 2, idx);
                m = max(models{j}{idx, 2});
                imshow(reshape(models{j}{idx, 2} ./ m, 28, 28));
                title(sprintf('Weight %f', models{j}{idx, 1}));
            end
        end
        % E-step
        pl = logExpectGMM(train, models{j});
        % M-step
        models{j} = m_stepGMM(train, models{j}, pl);
end
end
