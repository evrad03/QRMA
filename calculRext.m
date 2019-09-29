D=liens(3,5);
for l=1:96 
    %A(l,10)=-A(l,10);
    if((A(l,10)<0))
        %A(l,10)=-(A(l,10));
    end
    if(A(l,10)>0 && A(l,10)~=1)
        R(l,1)=(1/(0.063801643*D))*(A(l,10)^(1/(1.1679358)));
    else
        R(l,1)=0;
    end
end
H=0.25*R;
H=sum(H);
%H=H/6;
if(H>200)
    %H=NaN;
end
if(H<150 && H>60)
    %H=H/2;
end