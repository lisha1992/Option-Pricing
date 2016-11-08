function [ C,Cdelta,Cvega,P,Pdelta, Pvega] = BSPDE_Q31( S,K,r,q,sigma,time )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   Assignment 2_ Question3.1

% Input arguments: S - asset spot price
%                  K - Strike price
%                  r - risk-free rate
%                  q - repo rate
%                  sigma - implied volatility
%                  time - time to expiry (T-t)

% Output arguments: C - call option value
%                   Cdelta - delta value of call option 
%                   Cvega - vega value of call option 
%                   P - put option value
%                   Pdelta - delta value of put option 
%                   Cvega - vega value of put option 
% function [ C,Cdelta,Cvega,P,Pdelta, Pvega] = BlackScholesPDE_Q3( S,K,r,q,sigma,time )

if time > 0    % time=T-t
    d1=(log(S/K)+(r-q)*time+0.5*sigma^2*time)/(sigma*sqrt(time));
    d2=(log(S/K)+(r-q)*time-0.5*sigma^2*time)/(sigma*sqrt(time));
    N1=0.5*(1+erf(d1/sqrt(2)));
    N2=0.5*(1+erf(d2/sqrt(2)));
    C=S*exp(-q*time)*N1 - K*exp(-r*time)* N2;
    P=C-S*exp(-q*time)+K*exp(-r*time);
    Cdelta = exp(-q*time)*N1;
    Cvega = S*exp(-q*time)*sqrt(time)*exp((-0.5)*d1^2)/sqrt(2*pi);
    Pdelta = Cdelta-exp(-q*time);
    Pvega = Cvega;
    
else
    C=max(S-K,0);
    Cdelta=0.5*(sign(S-K)+1);
    Cvega=0;
    P=max(K-S,0);
    Pdelta=Cdelta-exp(-q*time);
    Pvega=0;
end

    
  

