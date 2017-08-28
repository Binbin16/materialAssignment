function sigmaD=sigDis(Dsr)

D=Dsr(:);
D(isnan(D))=[];
c=length(D);

DD=zeros(c,c);
for i=1:c
    for j=i+1:c
        DD(i,j)=abs(D(i)-D(j));
        DD(j,i)=DD(i,j);
    end
end


DDD=DD(:);

DDD(DDD==0)=[];

sD=sort(DDD);
l=length(DDD);
sigmaD=sD(ceil(l*0.08));