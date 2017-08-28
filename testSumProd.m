clear all
close all
clc

tic
% PreSteps

%Q=getQueryData(1,5);%query 1: table
load QueryData1
load database

% addpath Material
% normM=discreteMat('DiscreteMat.xlsx',Data.scaleMat);
load normMat % normalized all available Material 

gamma=1/400;
alpha=1/20;
beta=1/20;
delta=1/400;

nP=size(Q.DistPt,1);
nM=size(normM,1);

t1=toc

UniFact=getUniFact(nP,nM,Q,Data,normM,gamma);
PairFact=getPairFact(nP,nM,Q,Data,normM,alpha,beta,delta);

t2=toc

[muN,muE]=initializeMsg(UniFact,PairFact);

for i=1:nP*4
    [muN,muE]=updateMsg(muN,muE,UniFact,PairFact);
end

t3=toc

MargProb=margMsg(muN,muE);
[~,idx]=max(MargProb,[],2);

t4=toc
