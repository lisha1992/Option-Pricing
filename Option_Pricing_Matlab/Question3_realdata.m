load 'realdata_Q3.mat';   %% input data

%% global variables
r=0.04;
q=0.2;
time=(20160224-20160216)/365;


%%%% 09:31:00  Bid Call option volatility  
for i=1:17
    %% initial guess of implied volatility
    volstart=sqrt(2*abs((log(spot_31/Strike(i))+(r-q)*time)/time));  
    %% apply Newton's Method for call option
    bidvolc_31(i)=Newton_volcall(spot_31,Strike(i),r,q,volstart,time,BidCall_true31(i));
    BidVolC_31=bidvolc_31';
end

%%%% 09:31:00  Ask Call option volatility  
for i=1:17
    volstart=sqrt(2*abs((log(spot_31/Strike(i))+(r-q)*time)/time));  
    askvolc_31(i)=Newton_volcall(spot_31,Strike(i),r,q,volstart,time,AskCall_true31(i));
    AskVolC_31=askvolc_31';
end

%%%% 09:32:00 Bid Call option volatility  
for i=1:17
    volstart=sqrt(2*abs((log(spot_32/Strike(i))+(r-q)*time)/time));  
    bidvolc_32(i)=Newton_volcall(spot_32,Strike(i),r,q,volstart,time,BidCall_true32(i));
    BidVolC_32=bidvolc_32';
end

%%%% 09:32:00  Ask Call option volatility  
for i=1:17
    volstart=sqrt(2*abs((log(spot_32/Strike(i))+(r-q)*time)/time));  
    askvolc_32(i)=Newton_volcall(spot_32,Strike(i),r,q,volstart,time,AskCall_true32(i));
    AskVolC_32=askvolc_32';
end

%%%% 09:33:00 Bid Call option volatility  
for i=1:17
    volstart=sqrt(2*abs((log(spot_33/Strike(i))+(r-q)*time)/time));  
    bidvolc_33(i)=Newton_volcall(spot_33,Strike(i),r,q,volstart,time,BidCall_true33(i));
    BidVolC_33=bidvolc_33';
end

%%%% 09:33:00  Ask Call option volatility  
for i=1:17
    volstart=sqrt(2*abs((log(spot_33/Strike(i))+(r-q)*time)/time));  
    askvolc_33(i)=Newton_volcall(spot_33,Strike(i),r,q,volstart,time,AskCall_true33(i));
    AskVolC_33=askvolc_33';
end



%%%% 09:31:00  Bid Put option volatility
for i=1:17  
    volstart=sqrt(2*abs((log(spot_31/Strike(i))+(r-q)*time)/time));
    bidvolp31(i)=Newton_volput(spot_31,Strike(i),r,q,volstart,time,BidPut_true31(i));
    BidVolP_31=bidvolp31';
end

%%%% 09:31:00  Ask Put option volatility
for i=1:17  
    volstart=sqrt(2*abs((log(spot_31/Strike(i))+(r-q)*time)/time));
    askvolp31(i)=Newton_volput(spot_31,Strike(i),r,q,volstart,time,AskPut_true31(i));
    AskVolP_31=askvolp31';
end




%%%% 09:32:00  Bid Put option volatility
for i=1:17  
    volstart=sqrt(2*abs((log(spot_32/Strike(i))+(r-q)*time)/time));
    bidvolp32(i)=Newton_volput(spot_32,Strike(i),r,q,volstart,time,BidPut_true32(i));
    BidVolP_32=bidvolp32';
end

%%%% 09:32:00  Ask Put option volatility
for i=1:17  
    volstart=0.1*sqrt(2*abs((log(spot_32/Strike(i))+(r-q)*time)/time));
    askvolp32(i)=Newton_volput(spot_32,Strike(i),r,q,volstart,time,AskPut_true32(i));
    AskVolP_32=askvolp32';
end


%%%% 09:33:00  Bid Put option volatility
for i=1:17  
    volstart=sqrt(2*abs((log(spot_33/Strike(i))+(r-q)*time)/time));
    bidvolp33(i)=Newton_volput(spot_33,Strike(i),r,q,volstart,time,BidPut_true33(i));
    BidVolP_33=bidvolp33';
end

%%%% 09:33:00  Ask Put option volatility
for i=1:17  
    volstart=0.1*sqrt(2*abs((log(spot_33/Strike(i))+(r-q)*time)/time));
    askvolp33(i)=Newton_volput(spot_33,Strike(i),r,q,volstart,time,AskPut_true33(i));
    AskVolP_33=askvolp33';
end


results_31=[Strike,BidVolP_31,AskVolP_31,BidVolC_31,AskVolC_31];
results_32=[Strike,BidVolP_32,AskVolP_32,BidVolC_32,AskVolC_32];
results_33=[Strike,BidVolP_33,AskVolP_32,BidVolC_33,AskVolC_33];

csvwrite('31.csv',results_31);
csvwrite('32.csv',results_32);
csvwrite('33.csv',results_33);

figure;
plot(Strike,BidVolP_31,'-*b'); 
hold on;
a=polyfit(Strike,AskVolP_31,2);
b=polyval(x,Strike);
plot(Strike,b,'-xr');
hold on;
plot(Strike,BidVolC_31,'-ok');
hold on;
plot(Strike,AskVolC_31,'-xg');
hold on;
hold off;
legend('BidVolP','AskVolP','BidVolC','AskVolC');
xlabel('strike');  
ylabel('implied volatility');
set(gca,'YTick',[0:0.05:2])
title('09:31:00');

figure;
plot(Strike,BidVolP_32,'-*b'); 
hold on;
c=polyfit(Strike,AskVolP_32,2);
d=polyval(x,Strike);
plot(Strike,d,'-xr');
hold on;
plot(Strike,BidVolC_32,'-ok');
hold on;
plot(Strike,AskVolC_32,'-xg');
hold on;
hold off;
legend('BidVolP','AskVolP','BidVolC','AskVolC');
xlabel('strike');  
ylabel('implied volatility');
set(gca,'YTick',[0:0.05:2])
title('09:32:00');

figure;
plot(Strike,BidVolP_33,'-*b'); 
hold on;
c=polyfit(Strike,AskVolP_33,2);
d=polyval(x,Strike);
plot(Strike,d,'-xr');
hold on;
plot(Strike,BidVolC_33,'-ok');
hold on;
plot(Strike,AskVolC_33,'-xg');
hold on;
hold off;
legend('BidVolP','AskVolP','BidVolC','AskVolC');
xlabel('strike');  
ylabel('implied volatility');
set(gca,'YTick',[0:0.05:2])
title('09:33:00');
