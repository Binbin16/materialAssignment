function [P]=sampling(node_xyz,face_node,area,N)
% [P,R,S]=sampling(node_xyz,face_node,area,N)
    ca=cumsum(area);
    total_area=ca(end);
    f=size(face_node,2);
    
    for i=1:N
        % Choosing face based on area of faces
        r=rand;
        ra=r*total_area;
        m=1;n=f;
        while(abs(n-m)>2)
            j=m+round((n-m)/2);
            if ca(j)>=ra
                n=j;
            else
                m=j;
            end
        end
        if ra<=ca(n-1)
            if ra<=ca(m)
                n=m;
            else
                n=n-1;
            end
        end
        t=face_node(:,n);
        A=node_xyz(:,t(1));
        B=node_xyz(:,t(2));
        C=node_xyz(:,t(3));
        r1=rand;r2=rand;
        % Uniformly distributed point samples
        P(:,i)=(1-sqrt(r1))*A+sqrt(r1)*(1-r2)*B+sqrt(r1)*r2*C;
%         R(i)=norm(P(:,i)); % Distance from center to classify shells
%         S(i)=asind(P(3,i)/R(i)); % Angle from XY plane to classify sectors
    end