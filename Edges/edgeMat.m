function Em=edgeMat(roMat,th)

c=0;
sz=size(roMat,1);
for i=1:sz
    for j=i+1:sz
        if roMat(i,j)>=th
            c=c+1;
            Em(c,:)=[i,j];
        end
    end
end