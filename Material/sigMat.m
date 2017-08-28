function sigmaM=sigMat(normMat)

L1m=[];
for i=1:size(normMat,1)
    for j=i:size(normMat,1)
        L1m(i,j)=norm((normMat(i,:)-normMat(j,:)),1);
        L1m(j,i)=L1m(i,j);
    end
end

L1ma=L1m(:);
L1ma(L1ma==0)=[];

sL1ma=sort(L1ma);
l=length(L1ma);
sigmaM=sL1ma(ceil(l*0.05));
% ro=exp(-L1m.^2/sig^2);
% 
% imagesc(ro)
% colorbar
% title('Material Similarity(1 means similiar;0 means different)')

        
    

