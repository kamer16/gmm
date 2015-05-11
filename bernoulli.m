% X is data
% m is vector of means of bernoulli
function [px] = bernoulli(x, m)

tmp = m;
ind = find(x == 0);
tmp(ind) = 1 - tmp(ind);
px = prod(tmp);
end
