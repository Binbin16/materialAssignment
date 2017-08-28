function P=getProdRoPairS(i,j,u,v,Mat,Q,Data)

roPart=exp((-((Q.DistPt(i,j)+Q.DistPt(j,i)))^2)/Q.sigmaP(i,u)^2);
roMat=exp(-(norm(Mat(i,:)-Mat(j,:))^2)/Data.sigmaM^2);

roMat1=exp(-(norm(Mat(i,:)-Data.normMat(u,:))^2)/Data.sigmaM^2);
roMat2=exp(-(norm(Mat(j,:)-Data.normMat(v,:))^2)/Data.sigmaM^2);

roPart1=exp((-(Q.DistPtD(i,u))^2)/Q.sigmaP(i,u)^2);
roPart2=exp((-(Q.DistPtD(j,v))^2)/Q.sigmaP(j,v)^2);

P=roPart*roMat*roMat1*roMat2*roPart1*roPart2;