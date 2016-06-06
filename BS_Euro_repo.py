######## Black-Schole Formula for European Call/Put option (with dividend) #########  
# Input arguments: S = asset price at time t
#                  K = Exercise price
#                  r = interest rate
#                  q = repo rate
#                  sigma = volatility
#                  T = time to maturity (in years)
# Output arguments: C = call value, Cdelta = delta value of call
#                   P = Put value, Pdelta = delta value of put
# usage: BlackScholes_repo(S,K,r,q,sigma,T,Otype)

#################################################################################
from numpy import *
from math import log,sqrt,exp
from scipy.stats import norm

def N(x): # cumulative distribution function for standard normal distribution
    return norm.cdf(x)
    
def BlackScholes_repo(S,K,r,q,sigma,T,Otype):
    if(T > 0):
        if(S > 0):
            d1 = (log(S/K) + (r-q)*T + 0.5*sigma**2*T)/(sigma*sqrt(T))
            d2 = d1-sigma*sqrt(T)
            N1 = N(d1)
            N2 = N(d2)
            C = S*exp(-q*T)*N1-K*exp(-r*T)*N2
            Cdelta = exp(-q*T)*N1
        else:
            C = 0.0
            Cdelta = 0.0
    else:
        C = max(S*exp(-q*T)-K,0)
        Cdelta = 0.5*(sign(S*exp(-q*T)-K) + 1)
        
    P = K*exp(-r*T)*N(-d2)-S*exp(-q*T)*N(-d1)
    Pdelta = Cdelta - exp(-q*T)
    return [C, Cdelta, P, Pdelta]

# test case
S = 100; K = 100; r = 0.04; sigma = 0.3; q=0.2;T = 0.5;Otype='CALL'
[C, Cdelta, P, Pdelta] = BlackScholes_repo(S,K,r,q,sigma,T,Otype)
if Otype.lower()=='call':
    print ' Call option value: =',C
    print ' Call delta: =',Cdelta

else:
    print ' Put option value: =',P
    print ' Put delta: =',Pdelta

    


