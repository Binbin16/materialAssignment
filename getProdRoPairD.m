function P=getProdRoPairD(i,j,u,v,Mat,Q,Data)

roMat1=exp(-(norm(Mat(i,:)-Data.normMat(u,:))^2)/Data.sigmaM^2);
roMat2=exp(-(norm(Mat(j,:)-Data.normMat(v,:))^2)/Data.sigmaM^2);

roPart1=exp((-(Q.DistPtD(i,u))^2)/Q.sigmaP(i,u)^2);
roPart2=exp((-(Q.DistPtD(j,v))^2)/Q.sigmaP(j,v)^2);

roDis=exp(-(norm(Q.spatRelD(i,j)-Data.spatRelD(u,v))^2)/(2*Data.sigmaD^2));

roShp=exp((-(Q.DistObjD(Data.partObj(u,2)))^2)/Q.sigmaS^2);

P=roMat1*roMat2*roPart1*roPart2*roDis*roShp;