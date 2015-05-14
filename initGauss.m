function data = initGauss(nb_mod)
model = cell(nb_mod, 1);
for i = 1:nb_mod
    model{i}.mu = [rand() * i * 2; rand() * i * 2];
    model{i}.w = 1 / nb_mod;
    corr = rand() * 4;
    sig = [60*i, corr; corr, 1+i];
    model{i}.sig = sig;
end
data = genGMM(1000, model);
end
