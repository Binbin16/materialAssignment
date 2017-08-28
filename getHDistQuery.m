function [HPt,HObjD,HPtD]=getHDistQuery(QPt,QObj,DPt,DObj)

nQPart=size(QPt,1);
nDObject=size(DObj,1);
nDPart=size(DPt,1);

HPt=zeros(nQPart,nQPart);
HObjD=zeros(nDObject,1);
HPtD=zeros(nQPart,nDPart);

for i=1:nQPart
    for j=i+1:nQPart
        HPt(i,j)=norm(QPt(i,:)-QPt(j,:));
    end
end

for i=1:nDObject
    HObjD(i,1)=norm(QObj-DObj(i,:));
end

for i=1:nQPart
    for j=1:nDPart
        HPtD(i,j)=norm(QPt(i,:)-DPt(j,:));
    end
end