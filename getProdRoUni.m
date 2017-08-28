function P=getProdRoUni(i,k,m,Q,Data)

roMat=exp(-(norm(m-Data.normMat(k,:))^2)/Data.sigmaM^2);

roPart=exp((-(Q.DistPtD(i,k))^2)/Q.sigmaP(i,k)^2);

roShp=exp(-((Q.DistObjD(Data.partObj(k,2)))^2)/Q.sigmaS^2);

roFunc=exp(-(norm(Q.Func(i,2)-Data.Func(k,2))^2)/Data.sigmaF^2);
if Q.Func(i,1)~=Data.Func(k,1)
    roFunc=0;
end

P=roMat*roPart*roShp*roFunc;