% model is cell of each model
% model{i} is i-th model
% model{i, 1} is weight of model i
% model{i, 2} is the 28*28 mu parameters of model i
function pl = logExpect(data, model)

% m is number of models
m = size(model, 1);
% n is number of indivuals/images
n = size(data, 2);
pl = zeros(n, m);
for i = 1:m
    tmp = log(model{i, 1}) + logBernoulliN(data, model{i, 2});
    pl(:, i) = tmp';
end;

% Divide by smallest(or lagest) number to avoid exponential of huge negative
% number which turns out to be 0
k = max(max(pl)); % or k = max(Pl,2) to be even more precise
pl = pl - k;
% log(k) * log p(xi)
sumligne = log(sum(exp(pl), 2));
pl = exp(pl - repmat(sumligne(:), 1, m));
% Now add n * k as in was substracted n times previously
lk = sum(sumligne) + n * k;
disp(sprintf('loglikelihood: %f', lk));
end
