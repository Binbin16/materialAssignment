function P=getProdRoPairF(i,j,u,v,Mat,Q,Data)

roFunc=exp(-(norm(Q.Func(i,2)-Q.Func(j,2))^2)/Data.sigmaF^2);
if Q.Func(i,1)~=Q.Func(j,1)
    roFunc=0;
end
roMat=exp(-(norm(Mat(i,:)-Mat(j,:))^2)/Data.sigmaM^2);

roMat1=exp(-(norm(Mat(i,:)-Data.normMat(u,:))^2)/Data.sigmaM^2);
roMat2=exp(-(norm(Mat(j,:)-Data.normMat(v,:))^2)/Data.sigmaM^2);

roFunc1=exp(-(norm(Q.Func(i,2)-Data.Func(u,2))^2)/Data.sigmaF^2);
if Q.Func(i,1)~=Data.Func(u,1)
    roFunc1=0;
end
roFunc2=exp(-(norm(Q.Func(j,2)-Data.Func(v,2))^2)/Data.sigmaF^2);
if Q.Func(j,1)~=Data.Func(v,1)
    roFunc2=0;
end

P=roFunc*roMat*roMat1*roMat2*roFunc1*roFunc2;