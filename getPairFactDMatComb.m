function P=getPairFactDMatComb(Mat,Q,Data)

Ed=Q.Ed;
sz=size(Ed,1);
EdData=Data.Ed;
szD=size(EdData,1);

P=zeros(sz,1);
for i=1:sz
    for k=1:szD
        P(i)=P(i)+getProdRoPairD(Ed(i,1),Ed(i,2),EdData(k,1),EdData(k,2),Mat,Q,Data);
    end
end
P=P/szD;