function sigmaF=sigFunc(Func)

NF=size(Func,1);

for i=1:NF
    for j=i:NF
        if Func(i,1)~=Func(j,1)
            D(i,j)=inf;
        else
            D(i,j)=norm(Func(i,2)-Func(j,2),1);
        end
        D(j,i)=D(i,j);
    end
end

DD=D(:);
DD(DD==0)=[];

sD=sort(DD);
l=length(DD);
sigmaF=sD(ceil(l*0.1));