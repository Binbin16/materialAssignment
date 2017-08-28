function [HPt,HObj]=getHDistData(DPt,DObj)

nPart=size(DPt,1);
nObject=size(DObj,1);

HPt=zeros(nPart,nPart);
HObj=zeros(nObject,nObject);

for i=1:nPart
    for j=i+1:nPart
        HPt(i,j)=norm(DPt(i,:)-DPt(j,:));
    end
end

% Not required actually
for i=1:nObject
    for j=i+1:nObject
        HObj(i,j)=norm(DObj(i,:)-DObj(j,:));
    end
end
% % % %