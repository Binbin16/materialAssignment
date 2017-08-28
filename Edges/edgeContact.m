function Ed=edgeContact(D,th)

c=0;Ed=[];
for i=1:size(D,1)
    for j=i+1:size(D,1)
        if D(i,j)<=th
            c=c+1;
            Ed(c,:)=[i, j];
            c=c+1;
            Ed(c,:)=[j, i];
        end
    end
end