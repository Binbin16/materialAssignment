function [sP,sComb]=sortComb(P,comb)

[nP,idx]=sort(P,'descend');
sComb=comb(idx,:);
% sP=nP/(sqrt(sum(nP.*nP)));
sP=nP/(sum(nP));