function [S,Mx,Mn]=sumMsg(muN,muE)

S=0;
Mx=-inf;
Mn=inf;

szN=size(muN,1);

for i=1:szN
    for j=1:2
        S=S+sum(muN{i,j});
        m=max(muN{i,j});n=min(muN{i,j});
        if m>Mx
            Mx=m;
        end
        if n<Mn
            Mn=n;
        end
    end
    for j=i+1:szN
        if ~isempty(muE{i,j})
            for m1=1:2
                for m2=1:2
                    S=S+sum(muE{i,j}{m1,m2});
                    m=max(muE{i,j}{m1,m2});n=min(muE{i,j}{m1,m2});
                    if m>Mx
                        Mx=m;
                    end
                    if n<Mn
                        Mn=n;
                    end
                end
            end
        end
    end
end