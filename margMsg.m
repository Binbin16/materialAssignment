function MargProb=margMsg(muN,muE)

szN=size(muN,1);
szM=size(muN{1,1},1);

for i=1:szN
    for k=1:szM
        p=muN{i,1}(k);
        for j=1:szN
            if i<j && ~isempty(muE{i,j})
                p=p*muE{i,j}{1,1}(k);
            elseif i>j && ~isempty(muE{j,i})
                p=p*muE{j,i}{1,2}(k);
            end
        end
        MargProb(i,k)=p;
    end
end