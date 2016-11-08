function [ volput ] = Newton_volput(S,K,r,q,volstart,time,P_true )
%UNTITLED4 Summary of this function goes here
%   Newton's Method for put option 
%   Output : implied volatility of put option (both Bid and Ask)

tol=1e-8;
volput=volstart;
diff=1;
k=1;
kmax=100;
while (diff>=tol & k<kmax)
     % apply extended BS formula 
    [ C,Cdelta,Cvega,P,Pdelta, Pvega] = BSPDE_Q31(S,K,r,q,volput,time );
    increment=(P-P_true)/(Pvega*10);
    volput=volput-increment;
    k=k+1;
    diff=abs(increment);
end

