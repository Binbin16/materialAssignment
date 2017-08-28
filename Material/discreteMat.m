function normM=discreteMat(filename,sm)

M=xlsread(filename,'A:E');

for i=1:5
    normM(:,i)=(M(:,i)/sqrt(sm(i)))*100;
end

save('../normMat.mat','normM')