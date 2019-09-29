jr=1;
ms=5;
attenuation=NaN(31,3);
for cpt=1:1
    if (ms==5 && jr==32)
        jr=1;
        ms=ms+1;
    end
    if (ms==6 && jr==31)
        jr=1;
        ms=ms+1;
    end
        
    if (jr<10)
        %fich=['data/mbda-mbdalepi/mbda-mbdalepi20160', num2str(ms),'0',num2str(jr),'.txt']
        fich=['data/mbda-mbdasik/mbda-mbdasik20160', num2str(ms),'0',num2str(jr),'.txt']
    else
        %fich=['data/mbda-mbdalepi/mbda-mbdalepi20160', num2str(ms),num2str(jr),'.txt']
        fich=['data/mbda-mbdasik/mbda-mbdasik20160', num2str(ms),num2str(jr),'.txt']
    end
    
    fid=fopen(fich,'rt');
    fgetl(fid);
    fgetl(fid);
    fgetl(fid);
    fgetl(fid);
    fgetl(fid);
    i=1;
    k=1;
    while(not(feof(fid)) && i<97)
        l=fgetl(fid);
        [date,time, mins, avgs, maxs, minr, avgr, maxr]=strread(l,'%s %s %f %f %f %f %f %f');
        for j=1:8
            if (j==1)
                T(i,j)=date;
            end 
            if (j==2)
                T(i,j)=time;
            end
            if (j==3)
                A(i,j-2)=mins;
            end
            if (j==4)
                A(i,j-2)=avgs;
            end
            if (j==5)
                A(i,j-2)=maxs;
            end
            if (j==6)
                A(i,j-2)=minr;
            end
            if (j==7)
                A(i,j-2)=avgr;
            end
            if (j==8)
                A(i,j-2)=maxr;
                A(i,7)=round(A(i,1)-A(i,4));
                A(i,8)=round(A(i,2)-A(i,5));
                A(i,9)=round(A(i,3)-A(i,6));
            end
        end 
        i=i+1;
    end
    %calcul des modes associées aux différentes valeurs dans le fichier
    [valeurs,modes]=calculattmoy(A);
    [valm,modm]=calculattmin(A);
    [valM,modM]=calculattmax(A);
    %calcul des atténuations moyennes
    nbre=size(valeurs,1);
    for ri=1:96
        nb=0;
        for yo=1:nbre
            %on recherche la valeur dans la plage des valeurs
            if(A(ri,2)==valeurs(yo,1))
                nb=yo;
            end
        end
        if(nb>0) 
            A(ri,11)=A(ri,8)-modes(nb,1);
        else
            A(ri,11)=A(ri,8)-mode(A(:,8));
        end
    end
    
    %calcul des atténuations min
    nbre=size(valm,1);
    for ri=1:96
        nb=0;
        for yo=1:nbre
            %on recherche la valeur dans la plage des valeurs
            if(A(ri,1)==valm(yo,1))
                nb=yo;
            end
        end
        if(nb>0)
            A(ri,10)=A(ri,7)-modm(nb,1);
        else
            A(ri,10)=A(ri,7)-mode(A(:,7));
        end
    end
    
    %Calcul des atténuations max
    nbre=size(valM,1);
    for ri=1:96
        nb=0;
        for yo=1:nbre
            %on recherche la valeur dans la plage des valeurs
            if(A(ri,3)==valM(yo,1))
                nb=yo;
            end
        end
        if(nb>0) 
            A(ri,12)=A(ri,9)-modM(nb,1);
        else
            A(ri,12)=A(ri,9)-mode(A(:,9));
        end
    end
    
    fclose(fid);
    jr=jr+1;
    
	calculR
    
    cumul(cpt,1)=H1;
    cumul(cpt,2)=H2;
    cumul(cpt,3)=H3;
    cumul(cpt,4)=H4;
end 
    