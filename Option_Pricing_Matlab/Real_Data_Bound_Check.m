%% Check whether bid/ask price of call/put option between corresponding upper/lower bound
%% lowerP_31 -- lower bound of put option price (number denotes the time)
%% upperP_31 -- upper bound of put option price
%% lowerC_31 -- lower bound of call option price
%% upperC_31 -- upper bound of put option price

%% bp_check31 -- a (17*1) vector, each element either 0 or 1
%%               0 represent out of the bound, 1 represent within the bound
%%               bp-put option bid price; ap-put option ask price;
%%               bc-call option bid price; ac-call option ask price;

load 'realdata_Q3.mat';   %% input data

%%%%% check real data of 09:31:00
for i=1:17
    lowerp(i)=max(Strike(i)*exp(-r*time)-spot_31*exp(-q*time),0);
    upperp(i)=Strike(i)*exp(-r*time);
    lowerc(i)=max(spot_31*exp(-q*time)-Strike(i)*exp(-r*time),0);
    upperc(i)=spot_31*exp(-q*time);
end
lowerP_31=lowerp';
upperP_31=upperp';
lowerC_31=lowerc';
upperC_31=upperc';

bp_check31=(upperP_31>=BidPut_true31 & BidPut_true31>=lowerP_31);
bc_check31=(upperC_31>=BidCall_true31 & BidCall_true31>=lowerC_31);
ac_check31=(upperC_31>=AskCall_true31 & AskCall_true31>=lowerC_31);
ap_check31=(upperP_31>=AskPut_true31 & AskPut_true31>=lowerP_31);



%%%%% check real data of 09:32:00
for i=1:17
    lowerp(i)=max(Strike(i)*exp(-r*time)-spot_32*exp(-q*time),0);
    upperp(i)=Strike(i)*exp(-r*time);
    lowerc(i)=max(spot_32*exp(-q*time)-Strike(i)*exp(-r*time),0);
    upperc(i)=spot_32*exp(-q*time);
end
lowerP_32=lowerp';
upperP_32=upperp';
lowerC_32=lowerc';
upperC_32=upperc';

bp_check32=(upperP_32>=BidPut_true32 & BidPut_true32>=lowerP_32);
bc_check32=(upperC_32>=BidCall_true32 & BidCall_true32>=lowerC_32);
ac_check32=(upperC_32>=AskCall_true32 & AskCall_true32>=lowerC_32);
ap_check32=(upperP_32>=AskPut_true32 & AskPut_true32>=lowerP_32);

%%%%% check real data of 09:33:00
for i=1:17
    lowerp(i)=max(Strike(i)*exp(-r*time)-spot_33*exp(-q*time),0);
    upperp(i)=Strike(i)*exp(-r*time);
    lowerc(i)=max(spot_33*exp(-q*time)-Strike(i)*exp(-r*time),0);
    upperc(i)=spot_33*exp(-q*time);
end
lowerP_33=lowerp';
upperP_33=upperp';
lowerC_33=lowerc';
upperC_33=upperc';

bp_check33=(upperP_33>=BidPut_true33 & BidPut_true33>=lowerP_33);
bc_check33=(upperC_33>=BidCall_true33 & BidCall_true33>=lowerC_33);
ac_check33=(upperC_33>=AskCall_true33 & AskCall_true33>=lowerC_33);
ap_check33=(upperP_33>=AskPut_true33 & AskPut_true33>=lowerP_33);