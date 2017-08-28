function P=getPairFactFMatComb(Mat,Q,Data)

Ef=Q.Ef;
sz=size(Ef,1);
EfData=Data.Ef;
szD=size(EfData,1);

P=zeros(sz,1);
for i=1:sz
    for k=1:szD
        P(i)=P(i)+getProdRoPairF(Ef(i,1),Ef(i,2),EfData(k,1),EfData(k,2),Mat,Q,Data);
    end
end
P=P/szD;