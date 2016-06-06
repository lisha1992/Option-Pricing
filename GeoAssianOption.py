# Calculate Closed-form of Geometric Assian Option
# Input arguments: S = asset price at time t
#                  K = Exercise price
#                  r = interest rate
#                  sigma = volatility
#                  T = expiry time
#                  n = observation times
# Output arguments: C = call value 
#                   P = Put value
# usage: GeoAssianOption(S,K,r,sigma,T,n)


from math import log,sqrt,exp
from scipy.stats import norm

def N(x): # cumulative distribution function for standard normal distribution
    return norm.cdf(x)
    
def GeoAssianOption(S,K,r,sigma,T,n,Otype):
    if(T > 0):
        if(S > 0):
            sigmasqT = sigma**2*T*(n+1)*(2*n+1)/(6*n*n)
            muT = 0.5*sigmasqT + (r - 0.5*sigma**2)*T*(n+1)/(2*n)
            d1 = (log(S/K) + (muT + 0.5*sigmasqT))/(sqrt(sigmasqT))
            d2 = d1 - sqrt(sigmasqT)
            C = exp(-r*T)*( S*exp(muT)*N(d1) - K*N(d2) )
        else:
            C = 0.0         
    else:
        C = max(S-K,0)
        P=max(K-S,0)
    P=exp(-r*T)*( K*N(-d2)-S*exp(muT)*N(-d1) )
    return [C,P]

# test case
S = 100; K = 100; r = 0.05; sigma = 0.3; T = 3; n=50; Otype='call'
[C, P] = GeoAssianOption(S,K,r,sigma,T,n,Otype )
if Otype.lower()=='call':
    print ' C =',C
else:
    print ' P =',P



