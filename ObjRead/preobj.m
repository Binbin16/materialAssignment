clear all
close all
clc

% File name
obj='m73.obj';

[node_num,face_num,normal_num,order_max]=obj_size(obj);
[node_xyz,face_order,face_node,normal_vector,vertex_normal]=obj_read ... 
    (obj,node_num,face_num,normal_num,order_max);

% Triangulate faces with more than 3 edges
if order_max~=3
    face_node=triangulation(face_node,face_order);
    face_num=size(face_node,2);
end


% Translation for mean centering
centroid=mean(node_xyz,2);
node_xyz=[node_xyz(1,:)-centroid(1);node_xyz(2,:)-centroid(2); ... 
    node_xyz(3,:)-centroid(3)];

% PCA: Alignment with principal axes
pca=princomp(node_xyz');
node_xyz=(pca')*node_xyz;

% Calculation of radial distance from centriod
for i=1:node_num
    rad(i)=norm(node_xyz(:,i));
end

% Scaling
scale_factor=max(rad);
node_xyz=node_xyz/scale_factor;


shape.X=node_xyz(1,:)';
shape.Y=node_xyz(2,:)';
shape.Z=node_xyz(3,:)';
shape.TRIV=face_node';

[shape]=test2(shape);