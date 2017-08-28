function P=getPairFactSMatComb(Mat,Q,Data)

Es=Q.Es;
sz=size(Es,1);
EsData=Data.Es;
szD=size(EsData,1);

P=zeros(sz,1);
for i=1:sz
    for k=1:szD
        P(i)=P(i)+getProdRoPairS(Es(i,1),Es(i,2),EsData(k,1),EsData(k,2),Mat,Q,Data);
    end
end
P=P/szD;