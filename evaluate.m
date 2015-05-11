function res = evaluate(tests, test_label, models)

nc = length(models);
[d n] = size(tests);

[nm nb_param] = size(models{1});

tmp = zeros(n, nc, nm);
for class_idx = 1:nc
    model = models{class_idx};
    [nm nb_param] = size(model);
    for i = 1:nm
        %tmp(:, class_idx) = tmp(:, class_idx) + exp(log(model{i, 1}) + ...
        %            logBernoulliN(tests, model{i, 2})');
        tmp(:, class_idx, i) = tmp(:, class_idx, i ) + log(model{i, 1}) + ...
                    logBernoulliN(tests, model{i, 2})';
    end
end
sub = max(tmp(:));
tmp = exp(tmp - sub);
tmp = sum(tmp, 3);
tmp = tmp(:, :);
[val res] = max(tmp, [], 2);
res = res - 1;
disp(sprintf('Accuracy is: %f', 100 * sum(res == test_label) / n));
%res = find(sum(tmp == -Inf, 2) == nc-1);
