function model_i_1 = m_stepGMM(data, model_i, pl)
% sum de pl
% proba de l i-e proba that we have model nb l <=> pi_k or alpha_l
model_i_1 = cell(size(model_i));
[n, m] = size(pl);
[d, n] = size(data);
% Sum proba of have model i over each indiviuals
% spl : probal(model = i) for each i
spl = sum(pl);

mod = 1;
for i = 1:m
    if model_i{i, 1} > model_i{mod, 1}
        mod = i;
    end
end

for i = 1:m
    model_i_1{i, 1} = spl(i) / n;
    % pl 60000 x 12
    % pl(:, i) => 60000 x 1 i-e all p(model = i | x_i)
    % multiply each x_i by p(x_i E model_i) (over each mu_i)
    model_i_1{i, 2} = sum(repmat(pl(:, i)', d, 1) .* data, 2) / spl(i);

    ctr = data - repmat(model_i_1{i, 2}, 1, n);
    k = repmat(pl(:, i)', 2, 1) .* ctr;
    model_i_1{i, 3} = k * ctr' / spl(i);

    %if model_i_1{i, 1} <= 1 / (100 * m)
    %    alpha = model_i{mod, 1};
    %    model_i_1{i, 2} = (1 - alpha) * model_i_1{i, 2} + alpha * model_i{mod, 2};
    end
    %max_mu = 1 - 1e-10;
    %min_mu = 1e-10;
    %ind = find(model_i_1{i, 2} >= max_mu);
    %model_i_1{i, 2}(ind) = max_mu;
    %ind = find(model_i_1{i, 2} <= min_mu);
    %model_i_1{i, 2}(ind) = min_mu;
end
