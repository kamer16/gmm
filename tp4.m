function [means, stds] = tp4(train, label_train, nb_mod)

[m, n] = size(train);
% Need all mu_k and alpha_k
mu = rand(n, 1);
pi = ones(n, 1) / n
