function data = initGauss(nb_mod)
model = cell(nb_mod, 1);
for i = 1:nb_mod
    model{i}.mu = [10 * rand() * i * 2; 10 * rand() * i * 2];
    model{i}.w = 1 / nb_mod;
    corr = rand() * 40;
    sig = [corr + 60*rand(), corr; corr, 1+rand()*100 + corr];
    model{i}.sig = sig;
end
data = genGMM(1000, model);
end
