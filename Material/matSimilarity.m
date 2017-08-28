function roMat=matSimilarity(filename)

normMat=normMaterial(filename);
sigmaM=sigMat(normMat);

for i=1:size(normMat,1)
    for j=i:size(normMat,1)
        roMat(i,j)=exp(-norm(normMat(i,:)-normMat(j,:))^2/sigmaM^2);
        roMat(j,i)=roMat(i,j);
    end
end