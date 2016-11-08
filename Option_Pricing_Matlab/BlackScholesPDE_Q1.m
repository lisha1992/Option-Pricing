function [ C_true, P_true ] = BlackScholesPDE_Q1( S,K,r,sigma,tToEx )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% Input: S - spot price of the underlying asset
%        K - Strike price
%        r - risk-free rate
%        sigma - the volatility of returns of the underlying asset
%        tToEx - time to expiry (T-t)
%        N(di) - the cumulative distribution function of the standard normal distribution

% Output:  C_true - call option price observed from the market
%          Cdelta - delta value of call option (assetÉ²®æ‰Z¤Æ?optionÉ²®æªº‰Z¤Æ´T«×)
%          P_true - put option price observed from the market
%          Pdelta - delta value of put option (assetÉ²®æ‰Z¤Æ?optionÉ²®æªº‰Z¤Æ´T«×)

if tToEx>0
    d1=(log(S/K)+(r+0.5*sigma^2)*tToEx)/(sigma*sqrt(tToEx));
    d2=d1-sigma*sqrt(tToEx);
    N1=0.5*(1 + erf(d1/sqrt(2)));
    N2=0.5*(1 + erf(d2/sqrt(2)));
    C_true=S*N1 - K*exp((-r)*tToEx)*N2;
    P_true=C_true + K*exp((-r)*tToEx) - S;

    
else
    C_true=max(S-K,0);
    P_true=max(K-S,0);

    
end

