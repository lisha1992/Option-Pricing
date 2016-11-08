n=100;
corrCoef_XZ=zeros(2,2,100);
for i=1:n
    corrCoef_XZ(:,:,i)=corrcoefFun();
end
    
