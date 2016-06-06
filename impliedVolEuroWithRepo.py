###   Output : implied volatility of call option (both Bid and Ask)
from numpy import *
from math import log,sqrt,exp
from scipy.stats import norm

#########################
def N(x):     # cumulative distribution function for standard normal distribution
    return norm.cdf(x)

#######################################################
# Calculate Greeks of call/put option

def BS_Greeks(S,K,r,q,sigma,T,Otype):
    if(T> 0):
        if(S > 0):
            d1= (log(S/K)+(r-q)*T)/(sigma*sqrt(T)) + 0.5*sigma*sqrt(T)
            d2= (log(S/K)+(r-q)*T)/(sigma*sqrt(T)) - 0.5*sigma*sqrt(T)
            C = S*exp(-q*T)*N(d1)-K*exp(-r*T)*N(d2)
            Cdelta =exp(-q*T)*N(d1)
            Cvega = S*sqrt(T)*exp(-q*T)*exp(-0.5*d1**2)/sqrt(2*pi)
        else:
            C = 0.0
            Cdelta = 0.0
            Cvega = 0.0
    else:
        C = max(S*exp(-q*T)-K,0)
        Cdelta = 0.5*(sign(S*exp(-q*T)-K) + 1)
        Cvega = 0.0
    P = K*exp(-r*T)*N(-d2)-S*exp(-q*T)*N(-d1)
    Pdelta = Cdelta-exp(-q*T)
    Pvega = Cvega        
    return [C, Cdelta, Cvega, P, Pdelta, Pvega]
    
    
####################################################
# Calculate implied volatility of call option

def impVolCall(S,K,r,q,T,premium):
    # starting value of sigma
    sigStart = sqrt(2*abs( (log(S/K) + (r-q)*T)/T ) )

###### Newton's method #####
    tol = 1e-8
    sigC = sigStart
    sigdiff = 1
    itera = 1
    itera_max = 100
    while (sigdiff >= tol and itera < itera_max):
        [C, Cdelta, Cvega, P, Pdelta, Pvega] = BS_Greeks(S,K,r,q,sigC,T,Otype)
        increment = (C-premium)/(Cvega*10000)
   #     print Cvega
        sigC = sigC - increment
        itera = itera+1
        sigdiff = abs(increment)
    return sigC
###################################################


###################################################
# Output : implied volatility of call option (both Bid and Ask)

def impVolPut(S,K,r,q,T,premium):
    # starting value
    sigStart = sqrt(2*abs( (log(S/K) + (r-q)*T)/T ) )

###### Newton's method #####
    tol = 1e-8
    sigP = sigStart
    sigdiff = 1
    iteration = 1
    iteration_max = 100
    while (sigdiff >= tol and iteration < iteration_max):
        [C, Cdelta, Cvega, P, Pdelta, Pvega] = BS_Greeks(S,K,r,q,sigP,T,Otype)
        increment = (P-premium)/(Pvega*10000)
        sigP = sigP - increment
        iteration = iteration+1
        sigdiff = abs(increment)
    return sigP
########################################################


####################### TEST CASE  #####################

r = 0.03; S = 2; K = 2; T = 3; q=0.2; premium=2;Otype='put'
if Otype=='Call' or Otype=='call':
    sigma_C=impVolCall(S,K,r,q,T,premium)
    print 'implied volatility of call option:',sigma_C
else:
    sigma_P=impVolPut(S,K,r,q,T,premium)
    print 'implied volatility of put option:',sigma_P

    