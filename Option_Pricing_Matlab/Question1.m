clear
clc
load parameter.mat;
n=5;
price_call=zeros(1,5);
price_put=zeros(1,5);

%results=zeros(2,5);
for i=1:n
    [price_call(i),price_put(i)] = BlackScholesPDE_Q1( price(i),strike(i),rate(i),sigma(i),time(i));
end


subplot(2,2,1);
plot(strike(:,[1 2]),price_call(:,[1 2]),'-ob');
hold;
plot(strike(:,[1 2]),price_put(:,[1 2]),':xr','MarkerFaceColor','c');
xlabel('Stike price');  
ylabel('Option price');
legend('call option price','put option price');

subplot(2,2,2);
plot(time(:,[1 3]),price_call(:,[1 3]),'-ob');
hold;
plot(time(:,[1 3]),price_put(:,[1 3]),':xr','MarkerFaceColor','c');
xlabel('Time to expiry');  
ylabel('Option price');


subplot(2,2,3);
plot(sigma(:,[1 4]),price_call(:,[1 4]),'-ob');
hold;
plot(sigma(:,[1 4]),price_put(:,[1 4]),':xr','MarkerFaceColor','c');
xlabel('volatility');  
ylabel('Option price');


subplot(2,2,4);
plot(rate(:,[1 5]),price_call(:,[1 5]),'-ob');
hold;
plot(rate(:,[1 5]),price_put(:,[1 5]),':xr','MarkerFaceColor','c');
xlabel('Risk-free Rate');  
ylabel('Option price');

