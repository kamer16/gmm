% X is data
% m is vector of means of bernoulli
function [px] = bernoulliN(x, m)

% n elemetns of dimension d
[d n] = size(x);
tmp = repmap(m(:), 1, n);
ind = find(x == 0);
tmp(ind) = 1 - tmp(ind);
px = prod(tmp);
end
