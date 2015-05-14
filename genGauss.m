function out = genGauss(m, model)
out = randn(2, m);
out = out + repmat(model.mu, 1, m);
out = chol(model.sig) * out;
end