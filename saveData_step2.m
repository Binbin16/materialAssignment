load database_step1.mat

thEd=0.10; %edgeContact
thEs=0.40; %edgeShape
thEf=0.15; %edgeFunction
%-------------------------------------------------------------------
Data.sigmaD=sigDis(Data.spatRelD);

MatFile='Mat.xlsx';
[Data.normMat,Data.scaleMat]=normMaterial(MatFile);
Data.sigmaM=sigMat(Data.normMat);

% thEd=0.10
Data.Ed=edgeContact(Data.contAnaD,thEd);

%thEs=0.1;
Data.Es=edgeShape(Data.DistPt,thEs);

FuncFile='Func.xlsx';
Data.Func=getFunc(FuncFile);
Data.sigmaF=sigFunc(Data.Func);

%thEf=0.35;
Data.Ef=edgeFunc(Data.Func,thEf);

save('database.mat','Data')