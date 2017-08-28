function Q=getQueryData(Query,nPart)

%  PreSteps

load database
%---------------------Parameters Need Adjusted-----------------------------
thEd=0.10; %edgeContact
thEs=0.40; %edgeShape
thEf=0.15; %edgeFunction
%--------------------------------------------------------------------------
Q.Query=Query;
Q.nPart=nPart;  

% wLF=0.5; %weight of LFD w.r.t. histograms from other descriptors
% wH=1-wLF;

[Q.LFPt,Q.LFObjD,Q.LFPtD]=getLFQuery(Q.Query,Q.nPart,Data.nObject,Data.nPart);

% Uncomment above line and delete following %
% load Q5LFresult1
% Q.LFPt=LFPt;
% load Q5LFresult2
% Q.LFObjD=LFObj;
% load Q5LFresult3
% Q.LFPtD=LFPt;
% % % %

% Nbin=10;
% Q.SimPart=getHistQueryPart(Q.Query,Q.nPart,Nbin);
% Q.SimObj=getHistQueryObject(Q.Query,Nbin);
% 
% [Q.HPt,Q.HObjD,Q.HPtD]=getHDistQuery(Q.SimPart,Q.SimObj,Data.SimPart,Data.SimObj);

% Q.HPt=Q.HPt/max(Q.HPt(:));
% Q.HObjD=Q.HObjD/max(Q.HObjD(:));
% Q.HPtD=Q.HPtD/max(Q.HPtD(:));
% Q.LFPt=Q.LFPt/max(Q.LFPt(:));
% Q.LFObjD=Q.LFObjD/max(Q.LFObjD(:));
% Q.LFPtD=Q.LFPtD/max(Q.LFPtD(:));

Q.DistPt=Q.LFPt;
Q.DistObjD=Q.LFObjD;
Q.DistPtD=Q.LFPtD;

% Q.DistPt=wLF*Q.LFPt+wH*Q.HPt;
% Q.DistObjD=wLF*Q.LFObjD+wH*Q.HObjD;
% Q.DistPtD=wLF*Q.LFPtD+wH*Q.HPtD;

N=100; % Number of sample points for uniform sampling
[Q.contAnaD,Q.spatRelD]=getContactAnalysis(['Q',num2str(Q.Query)],Q.nPart,N);

%thEd=0.1;
Q.Ed=edgeContact(Q.contAnaD,thEd);

%thEs=0.10;
Q.Es=edgeShape(Q.DistPt,thEs);

FuncFile=['Query',num2str(Query),'Func.xlsx'];
Q.Func=getFunc(FuncFile);

%thEf=0.35;
Q.Ef=edgeFunc(Q.Func,thEf);

Q.sigmaP=getSigPart(Q.DistPt,Q.DistPtD,Data.DistPt);
Q.sigmaS=sigShape(Q.DistObjD);

save(['QueryData',num2str(Q.Query),'.mat'],'Q')