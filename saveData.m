clear all
close all
clc

PreSteps

nObject=20;
nPart=[5,5,3,4,3,3,8,5,6,11,10,5,5,5,4,18,15,16,17,15];

Data.nObject=nObject;
Data.nPart=nPart;

% wLF=0.5; %weight of LFD w.r.t. histograms from other descriptors
% wH=1-wLF;

cumNPart=cumsum(nPart);
c=1;
for i=1:sum(nPart)
    Data.partObj(i,1)=i;
    if i>cumNPart(c);
        c=c+1;
    end
    Data.partObj(i,2)=c;
end

Data.LFPt=getLFData(nObject,nPart);

% Uncomment above line and delete following %
% load LFresult
% Data.LFPt=LFPt;
% Data.LFObj=LFObj; % not required
% % % %

% Nbin=10;
% Data.SimPart=getHistAllPart(nObject,nPart,Nbin);
% Data.SimObj=getHistAllObject(nObject,Nbin);

% [Data.HPt,Data.HObj]=getHDistData(Data.SimPart,Data.SimObj);

% Data.HPt=Data.HPt/max(Data.HPt(:));
% Data.HObj=Data.HObj/max(Data.HObj(:)); % not required
% Data.LFPt=Data.LFPt/max(Data.LFPt(:));
% Data.LFObj=Data.LFObj/max(Data.LFObj(:)); % not required

Data.DistPt=Data.LFPt;
% Data.DistPt=wLF*Data.LFPt+wH*Data.HPt;
% Data.DistObj=wLF*Data.LFObj+wH*Data.HObj; % not required

N=100; % Number of sample points for uniform sampling
[Data.contAnaD,Data.spatRelD]=getCAAllObj(nObject,nPart,N);

Data.sigmaD=sigDis(Data.spatRelD);

MatFile='Mat.xlsx';
[Data.normMat,Data.scaleMat]=normMaterial(MatFile);
Data.sigmaM=sigMat(Data.normMat);

thEd=0.1;
Data.Ed=edgeContact(Data.contAnaD,thEd);

thEs=0.20;
Data.Es=edgeShape(Data.DistPt,thEs);

FuncFile='Func.xlsx';
Data.Func=getFunc(FuncFile);
Data.sigmaF=sigFunc(Data.Func);

thEf=0.35;
Data.Ef=edgeFunc(Data.Func,thEf);

save('database.mat','Data')