function Es=edgeShape(Dist,th)

c=0;
sz=size(Dist,1);Es=[];
for i=1:sz
    for j=i+1:sz
        ro(i,j)=exp(-(Dist(i,j))^2/sigPart(Dist,i,j)^2);
        if ro(i,j)>=th
            c=c+1;
            Es(c,:)=[i,j];
            c=c+1;
            Es(c,:)=[j,i];
        end
    end
end