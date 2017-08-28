function [D,Dsr]=getContactAnalysis(Object,nPart,N)

% path='C:/Users/Binbin/Dropbox/Research/GraphicalModel/MaterialMexCode/Database_ana_samp/';
% %%%%%%%%%%%%%%%%%%%%%%%%%
% NumOj=3;% number of object
% objname{1,1}='m911';
% objname{2,1}='m921';
% objname{3,1}='m933';
% nPart=[5;5;3];

%%%%%%%%%%%%%%%%%%%%%%%%%
% uniform sampling: the number of sample point
addpath UniformSampling
% for numOj=1:NumOj
    str=[Object,'P'];
    D=zeros(nPart,nPart);
    Dsr=zeros(nPart,nPart);
    for numP=1:nPart
        P=UniformSampling([str,num2str(numP),'.obj'],N);
        C1=mean(P,2);
        for numP2=numP+1:nPart
            P2=UniformSampling([str,num2str(numP2),'.obj'],N);
            C2=mean(P2,2);
            Dsr(numP,numP2)=norm(C1-C2);
            Dsr(numP2,numP)=Dsr(numP,numP2);
            for i=1:N
                for j=1:N
                    dd(j)=min(norm(P(:,i)-P2(:,j)));      
                end
                dmin(i)=min(dd);
            end
            D(numP,numP2)=min(dmin);
            D(numP2,numP)=D(numP,numP2);
        end
    end
% % end
% 
% save('ContactAnalysis.mat','ContAnaObj');