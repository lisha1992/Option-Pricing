################## Geometric Basket Option    ##############
# Input arguments: S1, S2 = Spot prices of 2 assets
#                  K = Exercise price
#                  r = interest rate
#                  sig1,sig2 = volatility of 2 assets
#                  p = correlation
#                  T = expiry time
#                  Otype = call/put               
#
# Output arguments: C = call value 
#                   P = Put value
# usage: GeoBasketOption(S1,S2,K,r,sig1,sig2,p,T,Otype)


from math import log,sqrt,exp
from scipy.stats import norm

def N(x): # cumulative distribution function for standard normal distribution
    return norm.cdf(x)
    
def GeoBasketOption(S1,S2,K,r,sig1,sig2,p,T,Otype):
    if(T > 0):
        if(S1 > 0 and S2>0):
            sigma=0.5*sqrt(sig1*sig2*p)
            mu = r-0.5*0.5*(sig1**2+sig2**2)+0.5*sigma**2
            Bg=sqrt(S1*S2)
            d1 = (log(Bg/K) + mu*T+ 0.5*sigma*2*T)/(sigma*sqrt(T))
            d2 = d1 - sigma*sqrt(T)
            N1 = N(d1)
            N2 = N(d2)
            C = exp(-r*T)*(Bg*exp(mu*T)*N1-K*N2)
            
        else:
            C = 0.0          
    else:
        C = max(Bg-K,0)
        # P = max(K-Bg,0)
    P=exp(-r*T)*(K*N(-d2)-Bg*exp(mu*T)*N(-d1))
    return [C,P]

# test case
S1 = 100;S2 = 100; K = 100; r = 0.05; T = 3; sig1=0.3;sig2=0.3;p=0.5; Otype='call'
[C, P] = GeoBasketOption(S1,S2,K,r,sig1,sig2,p,T,Otype)
if Otype.lower()=='call':
    print ' C =',C
else:
    print ' P =',P



