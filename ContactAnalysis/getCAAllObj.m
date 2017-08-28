function [D,Dsr]=getCAAllObj(nObject,nPart,N)

D=nan(sum(nPart));
Dsr=nan(sum(nPart));
c=0;
for i=1:nObject
    [d,dsr]=getContactAnalysis(['O',num2str(i)],nPart(i),N);
    D(c+1:c+nPart(i),c+1:c+nPart(i))=d;
    Dsr(c+1:c+nPart(i),c+1:c+nPart(i))=dsr;
    c=c+nPart(i);
end