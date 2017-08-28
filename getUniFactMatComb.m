function phi=getUniFactMatComb(Mat,Q,Data)

sz=size(Mat,1);

phi=zeros(sz,1);
for i=1:sz
    m=Mat(i,:);
    for k=1:size(Data.SimPart,1)
        phi(i)=phi(i)+getProdRoUni(i,k,m,Q,Data);
    end
end