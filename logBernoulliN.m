function [px] = logBernoulliN(x, m)

% n elemetns of dimension d
[d n] = size(x);
%eps = 1e-16;
%m(find(m(:) == 1)) = m(find(m(:) == 1)) - eps;
%m(find(m(:) == 0)) = m(find(m(:) == 0)) + eps;

% Duplicate paramaters for each individual x
tmp = repmat(log(m(:)), 1, n);
% Compute conjugate of each elements
tmp2 = repmat(log(1 - m(:)), 1, n);
% Find indices for x == 0
ind = find(x == 0);
tmp(ind) = tmp2(ind);
% Now the proba is the sum of 0's and sum of 1's
% Which is the sum of 0's and thu sum of (1-x) 1's
px = sum(tmp);

end
