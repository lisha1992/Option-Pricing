function corr=corrcoefFun()
%% standard normal random variable generator
X = normrnd(0,1,1,100);  % generate 100 samples of X 
Y = normrnd(0,1,1,100);
p = 0.5;
Z = p*X+sqrt(1-p*p)*Y;
corr=corrcoef(X,Z);
end

