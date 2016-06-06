################  Black-Schole Formula for European Call/Put option  ############
# Input arguments: S = asset price at time t
#                  K = Exercise price
#                  r = interest rate
#                  sigma = volatility
#                  T = time to maturity (in years)
# Output arguments: C = call value, Cdelta = delta value of call
#                   P = Put value, Pdelta = delta value of put
# usage: BlackScholes(S,K,r,sigma,tau)

#################################################################################
from numpy import *
from math import log,sqrt,exp
from scipy.stats import norm

def N(x): # cumulative distribution function for standard normal distribution
    return norm.cdf(x)
    
def BlackScholes(S,K,r,sigma,T,Otype):
    if(T > 0):
        if(S > 0):
            d1 = (log(S/K) + (r + 0.5*sigma**2)*(T))/(sigma*sqrt(T))
            d2 = d1 - sigma*sqrt(T)
            N1 = N(d1)
            N2 = N(d2)
            C = S*N1-K*exp(-r*T)*N2
            Cdelta = N1
        else:
            C = 0.
            Cdelta = 0.
    else:
        C = max(S-K,0)
        Cdelta = 0.5*(sign(S-K) + 1)
    P = C + K*exp(-r*T) - S
    Pdelta = Cdelta - 1
    return [C, Cdelta, P, Pdelta]

# test case
S = 100; K = 100; r = 0.01; sigma = 0.2; T = 0.5;Otype='call'
[C, Cdelta, P, Pdelta] = BlackScholes(S,K,r,sigma,T,Otype)
if Otype.lower()=='call':
    print ' Call option value: =',C
    print ' Call delta: =',Cdelta
else:
    print ' Put option value: =',P
    print ' Put delta: =',Pdelta


