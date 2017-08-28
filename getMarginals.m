function [Mat,MaxMat]=getMarginals(comb,P,normM)

sz=size(comb);
m=size(normM,1);

Mat=zeros(sz(2),m);
for i=1:sz(2)
    for j=1:m
        for k=1:sz(1)
            if comb(k,i)==j
                Mat(i,j)=Mat(i,j)+P(k,1);
            end
        end
    end
end

for i=1:sz(2)
    Mat(i,:)=Mat(i,:)/sum(Mat(i,:));
end

for i=1:sz(2)
    [~,idx]=max(Mat(i,:));
    MaxMat(i,1)=idx;
end