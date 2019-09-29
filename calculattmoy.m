function [ valeurs, modes ] = calculattmoy( A )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
valeurs(1,1)=A(1,2);
nb=1;
for tp=2:96
    q=[];
    q=find(A(tp,2)==valeurs);
    if(isempty(q))
         nb=nb+1;
         valeurs(nb,1)=A(tp,2);
    end
end

for tp=1:size(valeurs,1)
    led=0;
    temp=[];
    for nb=1:96
        if(A(nb,2)==valeurs(tp,1))
            led=led+1;
            tmp(led,1)=A(nb,8);
        end 
    end
    rol(tp,1)=led;
    %if (size(tmp,1)>2)
    if (size(tmp,1)>0)
        modes(tp,1)=mode(tmp(1:led,1));
    else
        modes(tp,1)=mode(A(:,8));
    end
end
    
end

