function [muN,muE]=updateMsg(muN,muE,UniFact,PairFact)

szN=size(UniFact,1);
szM=size(UniFact,2);

nmuN=muN;
nmuE=muE;

for i=1:szN
    j=1;
    for k=1:szM
        nmuN{i,j}(k)=UniFact(i,k);
    end
    j=2;
    for k=1:szM
        p=1;
        for l=1:szN
            if i<l && ~isempty(PairFact{i,l})
                p=p*muE{i,l}{1,1}(k);
            elseif i>l && ~isempty(PairFact{l,i})
                p=p*muE{l,i}{1,2}(k);
            end
        end
        nmuN{i,j}(k)=p;
    end
    
    for j=i+1:szN
        if ~isempty(PairFact{i,j})
            m1=1;m2=1;
            for k=1:szM
                s=0;
                for k2=1:szM
                    s=s+PairFact{i,j}(k,k2)*muE{i,j}{2,2}(k2);
                end
                nmuE{i,j}{m1,m2}(k)=s;
            end
            
            m1=2;m2=1;
            for k=1:szM
                p=muN{i,1}(k);
                for l=1:szN
                    if l~=j && i<l && ~isempty(PairFact{i,l})
                        p=p*muE{i,l}{1,1}(k);
                    elseif l~=j && i>l && ~isempty(PairFact{l,i})
                        p=p*muE{l,i}{1,2}(k);
                    end
                end
                nmuE{i,j}{m1,m2}(k)=p;
            end
            
            m1=1;m2=2;
            for k=1:szM
                s=0;
                for k2=1:szM
                    s=s+PairFact{i,j}(k2,k)*muE{i,j}{2,1}(k2);
                end
                nmuE{i,j}{m1,m2}(k)=s;
            end
            
            m1=2;m2=2;
            for k=1:szM
                p=muN{j,1}(k);
                for l=1:szN
                    if l~=i && j<l && ~isempty(PairFact{j,l})
                        p=p*muE{j,l}{1,1}(k);
                    elseif l~=i && j>l && ~isempty(PairFact{l,j})
                        p=p*muE{l,j}{1,2}(k);
                    end
                end
                nmuE{i,j}{m1,m2}(k)=p;
            end
        end
    end
end

[muN,muE]=normalizeMsg(nmuN,nmuE);