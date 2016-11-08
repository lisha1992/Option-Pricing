function [ volcall ] = Newton_volcall(S,K,r,q,volstart,time,C_true )
%UNTITLED4 Summary of this function goes here
%   Newton's Method for call option 
%   Output : implied volatility of call option (both Bid and Ask)

tol=1e-8;
volcall=volstart;   % initial guess
diff=1;
k=1;
kmax=100;
while (diff>=tol & k<kmax)
    % apply extended BS formula 
    [ C,Cdelta,Cvega,P,Pdelta, Pvega] = BSPDE_Q31(S,K,r,q,volcall,time );   
    increment=(C-C_true)/(Cvega); 
    volcall=volcall-increment;
    k=k+1;
    diff=abs(increment);
end

