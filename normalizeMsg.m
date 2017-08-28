function [muN,muE]=normalizeMsg(muN,muE)

[~,Mx,Mn]=sumMsg(muN,muE);

szN=size(muN,1);
szM=size(muN{1,1},1);

if Mn~=Mx
    for i=1:szN
        for j=1:2
            muN{i,j}=(muN{i,j}-Mn*ones(szM,1))*0.9/(Mx-Mn)+0.1*ones(szM,1);
        end
        for j=i+1:szN
            if ~isempty(muE{i,j})
                for m1=1:2
                    for m2=1:2
                        muE{i,j}{m1,m2}=(muE{i,j}{m1,m2}-Mn*ones(szM,1))*0.9/(Mx-Mn)+0.1*ones(szM,1);
                    end
                end
            end
        end
    end
end
    

% if Mx>100
%     for i=1:szN
%         for j=1:2
%             muN{i,j}=muN{i,j}*100/S;
%         end
%         for j=i+1:szN
%             if ~isempty(muE{i,j})
%                 for m1=1:2
%                     for m2=1:2
%                         muE{i,j}{m1,m2}=muE{i,j}{m1,m2}*100/S;
%                     end
%                 end
%             end
%         end
%     end
% end

% while Mn<10e-10
%     for i=1:szN
%         for j=1:2
%             muN{i,j}=muN{i,j}*10^10;
%         end
%         for j=i+1:szN
%             if ~isempty(muE{i,j})
%                 for m1=1:2
%                     for m2=1:2
%                         muE{i,j}{m1,m2}=muE{i,j}{m1,m2}*10^10;
%                     end
%                 end
%             end
%         end
%     end
%     [~,~,Mn]=sumMsg(muN,muE);
% end
    