%% homework 5 question 2


%% to get the obj files info in MATLAB...
clear all;
close all;
[ node_num, face_num, normal_num, order_max ] = obj_size ( 'shuttle.obj');
[ node_xyz, face_order, face_node, normal_vector, vertex_normal ] = obj_read ( 'shuttle.obj', node_num, face_num, normal_num, order_max );
count=1;



% figure(1)
% obj_display ( 'sphere.obj' )

x=node_xyz(1,:);
y=node_xyz(2,:);
z=node_xyz(3,:);


c=0;
for i=1:face_num
    for j=1:face_order(i)-2
        c=c+1;
        new_face_node(:,c)=face_node([1 j+1 j+2],i);
    end
end
    
% figure(2)
% tri=delaunay(x,y,z);
% trisurf(tri,x,y,z);

figure(3)
plot3(x,y,z,'.');
title('file nodes')
xlabel('x');
ylabel('y');
zlabel('z');
% 
% %% 1 find centriod
% [row_rawdata,column_rawdata]=size(node_xyz);
% Tx=sum(x);
% Ty=sum(y);
% Tz=sum(z);
% 
% Centriod=[Tx/column_rawdata Ty/column_rawdata Tz/column_rawdata];
% 
% %% 2 Move the center of the co-ordinate system to the centroid.
% 
% T_node=[x-Tx/column_rawdata; y-Ty/column_rawdata; z-Tz/column_rawdata;];
% figure(4)
% plot3(T_node(1,:),T_node(2,:),T_node(3,:),'.');
% title('file nodes after translation')
% xlabel('x');
% ylabel('y');
% zlabel('z');
% 
% %% 3 Scale the object (normalizing )
% 
% S=sqrt((sum(T_node(1,:).^2)+sum(T_node(2,:).^2)+sum(T_node(3,:).^2))/column_rawdata);
% % Sy=((y*y')/column)^0.5;
% % Sz=((z*z')/column)^0.5;
% 
% T_scale=[1/S 0 0 ; 0 1/S 0; 0 0 1/S];
% 
% S_node=T_scale*T_node;
% 
% figure(5)
% plot3(S_node(1,:),S_node(2,:),S_node(3,:),'.');
% title('file nodes after scalling')
% xlabel('x');
% ylabel('y');
% zlabel('z');
% 
% %% 4 By principal component analysis for the object align the principal axes to the coordinate frame.
%  
% % [coeff,xyz2] = princomp([S_node(1,:);S_node(2,:);S_node(3,:)]);
% % P_node = xyz2*coeff';
% 
% [coeff]=princomp(S_node');
% P_node=coeff*S_node;
% 
% figure(6)
% plot3(P_node(1,:),P_node(2,:),P_node(3,:),'.');
% title('PCA node')
% xlabel('x');
% ylabel('y');
% zlabel('z');
% 
% %% 5 Generate uniformly sampled points on the surface of the object 
% 
% [row_face, column_face]=size(face_node);
% 
% 
%   area=[];
% cum_area=[];
% 
% sum=0; 
% for i=1:face_num
%   A=[P_node(1,face_node(1,i)),P_node(2,face_node(1,i)),P_node(3,face_node(1,i))];
%   B=[P_node(1,face_node(2,i)),P_node(2,face_node(2,i)),P_node(3,face_node(2,i))];
%   C=[P_node(1,face_node(3,i)),P_node(2,face_node(3,i)),P_node(3,face_node(3,i))];
%   area(1,i)=0.5*sqrt(norm(A-B)^2 + norm(B-C)^2 + norm(A-C)^2);
%   
% end
% cum_area=zeros(1,face_num);
% cum_area(1,1)=area(1,1);
% for i=2:face_num
%     cum_area(1,i)=area(1,i)+cum_area(1,i-1);
% end  
%     
% SS=1000;
% for i=1:SS
%  r = cum_area(1,1)+(cum_area(1,face_num)-cum_area(1,1))*rand(1,1); %Generate values from the uniform distribution on the interval [a, b]: r = a + (b-a).*rand(100,1);
%  ind=find(cum_area < r);
%  sel_tri=ind(end);
%  r1=rand();
%  r2=rand();
%  At=[P_node(1,face_node(1,sel_tri)),P_node(2,face_node(1,sel_tri)),P_node(3,face_node(1,sel_tri))];
%  Bt=[P_node(1,face_node(2,sel_tri)),P_node(2,face_node(2,sel_tri)),P_node(3,face_node(2,sel_tri))];
%  Ct=[P_node(1,face_node(3,sel_tri)),P_node(2,face_node(3,sel_tri)),P_node(3,face_node(3,sel_tri))];
%  P=(1-sqrt(r1)).*At+sqrt(r1)*(1-r2).*Bt+sqrt(r1)*r2.*Ct;
%  PP(:,i)=P;
%  
% end
%   
% figure(7)
% plot3(PP(1,:),PP(2,:),PP(3,:),'.');
% title('points distribution')
% xlabel('x');
% ylabel('y');
% zlabel('z');
% 
% %% sector and shell histogram
% shell_num=20;
% 
% for i=1:SS
% dis(i)=sqrt(PP(1,i)^2+PP(2,i)^2+PP(3,i)^2);
% end
% 
% 
% % hist(dis,shell_num)
% 
% 
% max_dis=max(dis);
% per_dis=max_dis/shell_num;
% 
% 
% his=[];
% for i=1:shell_num
% points_find=find(dis<i*per_dis & dis>=(i-1)*per_dis );
%   [r,points_num]=size(points_find);  
%   his=[his,points_num];
% end
% 
% figure(8)
% % X=0:per_dis:max_dis;
% bar(his)
% xlabel('distance to the center')
% ylabel('points number')
% 
% 
