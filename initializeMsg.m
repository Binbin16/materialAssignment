function [muN,muE]=initializeMsg(UniFact,PairFact)

szN=size(UniFact,1);
szM=size(UniFact,2);

muN{szN,2}=[];
muE{szN,szN}=[];

for i=1:szN
    for j=1:2
        muN{i,j}=ones(szM,1);
    end
    for j=i+1:szN
        if ~isempty(PairFact{i,j})
            for m1=1:2
                for m2=1:2
                    muE{i,j}{m1,m2}=ones(szM,1);
                end
            end
        end
    end
end

[muN,muE]=normalizeMsg(muN,muE);