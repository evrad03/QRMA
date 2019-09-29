function [ valeursm, modesm ] = calculattmin( A )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
valeursm(1,1)=A(1,1);
nb=1;
for tp=2:96
    q=[];
    q=find(A(tp,1)==valeursm);
    if(isempty(q))
         nb=nb+1;
         valeursm(nb,1)=A(tp,1);
    end
end

for tp=1:size(valeursm,1)
    led=0;
    temp=[];
    for nb=1:96
        if(A(nb,1)==valeursm(tp,1))
            led=led+1;
            tmp(led,1)=A(nb,7);
        end 
    end
    rol(tp,1)=led;
    %if (size(tmp,1)>2)
    if (size(tmp,1)>0)
        modesm(tp,1)=mode(tmp(1:led,1));
    else
        modesm(tp,1)=mode(A(:,7));
    end
end
    
end

