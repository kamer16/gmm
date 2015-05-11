% model is cell of each model
function pl = expect(data, model)

m = size(model, 1);
% number of indivuals
n = size(data, 2);
% m is number of models
pl = zeros(n, m);
for i = 1:m
    tmp = model{i, 1} * BernoulliN(data, model{i, 2});
    pl(:, i) = tmp';
end;

sumligne = sum(pl, 2);
pl = pl ./ repmat(sumligne(:), 1, m);
lk = prod(sumligne);
disp(sprintf('likelihood: %f', lk));
end
