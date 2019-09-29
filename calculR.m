D=liens(1,5);
%lien mdouda-sik-ihs mbouda
%D=liens(2,5);

for l=1:96
    if((A(l,11)==1||A(l,11)==0) && (A(l,10)>2) && (A(l,12)>=0))
        A(l,13)=round(A(l,10)/2);
    else
        A(l,13)=A(l,11);
    end
end

for l=1:96
    if(A(l,11)>=A(l,10))
       A(l,11)=0;
   end
   if((A(l,11)==1||A(l,11)==0) && (A(l,10)>=4) && (A(l,12)>0))
       A(l,11)=round(A(l,10)/2);
   end
end

R=[];
for l=1:96        
    if(A(l,10)>0 && A(l,10)~=1)
        R(l,1)=(1/(0.063801643*D))*(A(l,10)^(1/(1.1679358)));
    else
        R(l,1)=0;
    end
    if(A(l,11)>0 && A(l,11)~=1)
        R(l,2)=(A(l,11)/((0.063801643)*D)).^(1/(1.1679358));
    else
        R(l,2)=0;
    end
    
    if(A(l,12)>0 && A(l,12)~=1)
        R(l,3)=(1/(0.063801643*D))*(A(l,12)^(1/(1.1679358)));
    else
        R(l,3)=0;
    end
end
H=0.25*R;
H1=sum(H(:,1));
H2=sum(H(:,2));
H3=sum(H(:,3));
H4=mean([H1,H2,H3]);