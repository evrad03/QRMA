%lien mdouda-sik-ihs mbouda
%D=111*sqrt(minus(5.62884, 5.621053)^2+minus(10.200095, 10.244194)^2);
%D=2.1715;
%lien banengo-bandjoun
%D=111*sqrt(minus(5.455514, 5.375208)^2+minus(10.421389, 10.423247)^2);
%lien mdouda-lepi mbouda
D=liens(1,5);
%lien mdouda-sik-ihs mbouda
%D=liens(2,5);
%lien mdouda-lepi mbouda-batang
%D=liens(3,5);
%poli
%D=111*sqrt(minus(8.67975,8.476388889)^2+minus(14.174806,13.73305556)^2);
%tibati
%D=111*sqrt(minus(6.46,6.47)^2+minus(12.62,12.60)^2);
%mbouda
%D=111*sqrt(minus(5.61432667,5.621053)^2+minus(10.257835,10.244194)^2);
%kumbo
%D=111*sqrt(minus(6.1697537,6.202417)^2+minus(10.672939,10.703722)^2);
%tiko1
%D=111*sqrt(minus(4.074888,4.0752)^2+minus(9.361333,9.367831)^2);
%edea
%D=111*sqrt(minus(3.782364,3.801892)^2+minus(10.14975,10.119653)^2);
%Yaounde
%D=111*sqrt(minus(3.855389,3.861167)^2+minus(11.503472,11.505944)^2);
%Abong-Mbang
%D=111*sqrt(minus(4.696111,4.922111)^2+minus(13.832778,13.838167)^2);
%Sangmelima
%D=111*sqrt(minus(2.922817,2.933794)^2+minus(11.984083,11.975389)^2);
%D=2.171548581561362;
%D=111*sqrt(minus(5.6269, 5.57862333)^2+minus(10.2570267, 10.3009233)^2);
%A(1,13)=A(1,11);
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
   if((A(l,11)>(A(l,10))) && (A(l,11)>(A(l,12))))
       %A(l,11)=0;
   end
   if(A(l,11)>5)
      %A(l,11)=0;
   end
end

R=[];
for l=1:96        %R(l,1)=(A(l,10)/((0.063801643)*D)).^(1/(1.1679358));
    if(A(l,10)>0 && A(l,10)~=1)
    %if(A(l,10)>0)
        %Hidde
        %R(l,1)=(0.063801643)*(A(l,10)/D).^(1/(1.1679358));
        %Doumania
        %R(l,1)=(A(l,10)/((0.063801643)*D)).^(1/(1.1679358));
        %modified
        R(l,1)=(1/(0.063801643*D))*(A(l,10)^(1/(1.1679358)));
    else
        R(l,1)=0;
        %R(l,1)=-A(l,10)/(((0.063801643)*D)).^(1/(1.1679358));
    end
    if(A(l,11)>0 && A(l,11)~=1)
        %R(l,2)=(1/(0.063801643*D))*(A(l,11)^(1/(1.1679358)));
        R(l,2)=(A(l,11)/((0.063801643)*D)).^(1/(1.1679358));
    else
        R(l,2)=0;
    end
    
    if(A(l,12)>0 && A(l,12)~=1)
        R(l,3)=(1/(0.063801643*D))*(A(l,12)^(1/(1.1679358)));
        %R(l,3)=(A(l,12)/((0.063801643)*D)).^(1/(1.1679358));
    else
        R(l,3)=0;
    end
end
H=0.25*R;
H1=sum(H(:,1));
H2=sum(H(:,2));
H3=sum(H(:,3));
H4=mean([H1,H2,H3]);
%if(H>200)
    %H=NaN;
%end
%if(H<150 && H>60)
    %H=H/2;
%end