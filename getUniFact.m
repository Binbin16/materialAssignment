function UniFact=getUniFact(nP,nM,Q,Data,normM,gamma)

UniFact=zeros(nP,nM);
for i=1:nP
    for j=1:nM
        m=normM(j,:);
        for k=1:size(Data.DistPt,1)
            UniFact(i,j)=UniFact(i,j)+getProdRoUni(i,k,m,Q,Data);
        end
    end
end
UniFact=UniFact.^gamma;