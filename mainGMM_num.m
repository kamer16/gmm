load data.mat
[max_m] = length(TRAIN)
max_m = 6000;
TRAIN = TRAIN(1:max_m, :)';
data = double(TRAIN);

nm = 1;
[d n] = size(data);
nb_iter = 5;
nc = 10;
models = cell(nc, 1);

for j = 1:nc
    models{j} = cell(nm, 3);
    for i = 1:nm
        idx = find(LABEL_TRAIN(1:max_m) == j - 1);
        % The weight of this model
        models{j}{i, 1} = 1 / nm;
        % The mu params of this model
        %models{j}{i, 2} = rand(d, 1);
        models{j}{i, 2} = data(:, idx(i + j * nm));
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
                if nm == 1
                    subplot(1, 1, idx);
                else
                    subplot(4, nm / 2, idx);
                end
                %m = max(models{j}{idx, 2});
                imshow(uint8(reshape(models{j}{idx, 2}, 28, 28)));
                title(sprintf('Weight %f', models{j}{idx, 1}));
            end
        end
        % E-step
        pl = logExpectGMM(train, models{j});
        % M-step
        models{j} = m_stepGMM(train, models{j}, pl);
end
end
