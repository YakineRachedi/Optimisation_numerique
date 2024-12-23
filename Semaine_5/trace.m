function trace(d,h)
    n = length(h);
    Dmax = sum(d);

    R = 0;
    Hmax = 0;

    plot([0,Dmax],[Hmax, Hmax], 'k')
    hold on
    for i = 1:n

        H_ancien = Hmax;
        R_ancien = R;
       
        Hmax = Hmax + h(i);
        R = R + d(i);
        
        plot([0,Dmax],[Hmax, Hmax], 'k')
        plot([R_ancien,R],[H_ancien,Hmax],'ro-')
    end

end