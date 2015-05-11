load data.mat
TRAIN = TRAIN(:, :)';
LABEL_TRAIN = LABEL_TRAIN;
TEST = TEST(:, :)';
LABEL_TEST = LABEL_TEST;

% Number models
nm = 8;
% Number of classes
nc = 10;
nb_iter = 8;
models = cell(nc, 1);
for num = 1:nc
disp(sprintf('Computing class %f', num));
train = TRAIN(:, find(LABEL_TRAIN == (num-1)));
%train = TRAIN(:, :);
% Binarize images
train = double(train < 128);
% n param (28*28) image
% m images
[n, m] = size(train);
% Need all mu_k and alpha_k
mu = rand(n, 1);
pi = ones(n, 1) / n;
model = cell(nm, 2);
for i = 1:nm
    % The weight of this model
    model{i, 1} = 1 / nm;
    % The mu params of this model
    model{i, 2} = rand(n, 1);
end

for i = 1:nb_iter
    if i == nb_iter
    figure;
        for idx = 1:nm
            subplot(2, nm / 2, idx);
            imshow(reshape(model{idx, 2}, 28, 28));
            title(sprintf('Weight %f', model{idx, 1}));
        end
    end
    % E-step
    pl = logExpect(train, model);
    % M-step
    model = m_step(train, model, pl);
end
models{num} = model;
end
