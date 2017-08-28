function Ef=edgeFunc(Func,th)

c=0;
sz=size(Func,1);
for i=1:sz
    for j=i+1:sz
        ro(i,j)=exp(-(norm(Func(i,2)-Func(j,2)))^2/(sigFunc(Func)^2));
        if Func(i,1)~=Func(j,1)
            ro(i,j)=0;
        end
        if ro(i,j)>=th
            c=c+1;
            Ef(c,:)=[i,j];
            c=c+1;
            Ef(c,:)=[j,i];
        end
    end
end