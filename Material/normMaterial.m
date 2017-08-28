function [normMat,sm]=normMaterial(filename)

addpath ../Database

Mat=xlsread(filename,'F:J');
Nmat=size(Mat,1);

sm1=0;sm2=0;sm3=0;sm4=0;sm5=0;
for i=1:Nmat
    sm1=sm1+Mat(i,1).^2;
    sm2=sm2+Mat(i,2).^2;
    sm3=sm3+Mat(i,3).^2;
    sm4=sm4+Mat(i,4).^2;
    sm5=sm5+Mat(i,5).^2;
end


for i=1:Nmat
    normDensity(i)=Mat(i,1)/sqrt(sm1)*100;
    normYoungModules(i)=Mat(i,2)/sqrt(sm2)*100;
    normPossionRaion(i)=Mat(i,3)/sqrt(sm3)*100;
    normYieldStrength(i)=Mat(i,4)/sqrt(sm4)*100;
    normThermalConductivity(i)=Mat(i,5)/sqrt(sm5)*100;
end

sm=[sm1;sm2;sm3;sm4;sm5];

normMat(:,1)=normDensity';
normMat(:,2)=normYoungModules';
normMat(:,3)=normPossionRaion';
normMat(:,4)=normYieldStrength';
normMat(:,5)=normThermalConductivity';