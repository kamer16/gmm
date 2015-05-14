function px = logGaussianN(x, mu, sig)
[d n] = size(x);
ctr = x - repmat(mu, 1, n);
px = -0.5 * log(det(sig)) - 0.5 * diag(ctr' * inv(sig) * ctr);
end
