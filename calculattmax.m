function [ valM, modM ] = calculattmax( A )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
valM(1,1)=A(1,3);
nb=1;
for tp=2:96
    q=[];
    q=find(A(tp,3)==valM);
    if(isempty(q))
         nb=nb+1;
         valM(nb,1)=A(tp,3);
    end
end

for tp=1:size(valM,1)
    led=0;
    temp=[];
    for nb=1:96
        if(A(nb,3)==valM(tp,1))
            led=led+1;
            tmp(led,1)=A(nb,9);
        end 
    end
    rol(tp,1)=led;
    %if (size(tmp,1)>2)
    if (size(tmp,1)>0)
        modM(tp,1)=mode(tmp(1:led,1));
    else
        modM(tp,1)=mode(A(:,9));
    end
end
    
end

