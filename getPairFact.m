function PairFact=getPairFact(nP,nM,Q,Data,normM,alpha,beta,delta)

PairFact=cell(nP,nP);

Ed=Q.Ed;
sz=size(Ed,1);
EdData=Data.Ed;
szD=size(EdData,1);

for i=1:2:sz
    if isempty(PairFact{Ed(i,1),Ed(i,2)})
        PairFact{Ed(i,1),Ed(i,2)}=ones(nM,nM);
    end
    for m1=1:nM
        for m2=1:nM
            Mat=zeros(nP,size(normM,2));
            Mat(Ed(i,1),:)=normM(m1,:);
            Mat(Ed(i,2),:)=normM(m2,:);
            P=0;
            for k=1:szD
                P=P+getProdRoPairD(Ed(i,1),Ed(i,2),EdData(k,1),EdData(k,2),Mat,Q,Data);
            end
            P=(P/szD)^alpha;
            PairFact{Ed(i,1),Ed(i,2)}(m1,m2)=PairFact{Ed(i,1),Ed(i,2)}(m1,m2)*P;
        end
    end
end

Es=Q.Es;
sz=size(Es,1);
EsData=Data.Es;
szD=size(EsData,1);

for i=1:2:sz
    if isempty(PairFact{Es(i,1),Es(i,2)})
        PairFact{Es(i,1),Es(i,2)}=ones(nM,nM);
    end
    for m1=1:nM
        for m2=1:nM
            Mat=zeros(nP,size(normM,2));
            Mat(Es(i,1),:)=normM(m1,:);
            Mat(Es(i,2),:)=normM(m2,:);
            P=0;
            for k=1:szD
                P=P+getProdRoPairS(Es(i,1),Es(i,2),EsData(k,1),EsData(k,2),Mat,Q,Data);
            end
            P=(P/szD)^beta;
            PairFact{Es(i,1),Es(i,2)}(m1,m2)=PairFact{Es(i,1),Es(i,2)}(m1,m2)*P;
        end
    end
end

Ef=Q.Ef;
sz=size(Ef,1);
EfData=Data.Ef;
szD=size(EfData,1);

for i=1:2:sz
    if isempty(PairFact{Ef(i,1),Ef(i,2)})
        PairFact{Ef(i,1),Ef(i,2)}=ones(nM,nM);
    end
    for m1=1:nM
        for m2=1:nM
            Mat=zeros(nP,size(normM,2));
            Mat(Ef(i,1),:)=normM(m1,:);
            Mat(Ef(i,2),:)=normM(m2,:);
            P=0;
            for k=1:szD
                P=P+getProdRoPairF(Ef(i,1),Ef(i,2),EfData(k,1),EfData(k,2),Mat,Q,Data);
            end
            P=(P/szD)^delta;
            PairFact{Ef(i,1),Ef(i,2)}(m1,m2)=PairFact{Ef(i,1),Ef(i,2)}(m1,m2)*P;
        end
    end
end