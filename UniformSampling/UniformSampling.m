function P=UniformSampling(obj,N)

[vertex,faces]=read_obj(obj);
% [node_num,face_num,normal_num,order_max]=obj_size(obj);
% [node_xyz,face_order,face_node,normal_vector,vertex_normal]=obj_read ... 
%     (obj,node_num,face_num,normal_num,order_max);

face_num=size(faces,2);

% Calculation of area of faces for sampling
for i=1:face_num
    t=faces(:,i);
    tcorr=vertex(:,t);
    u=tcorr(:,2)-tcorr(:,1);
    v=tcorr(:,3)-tcorr(:,1);
    area(i)=0.5*norm(cross(u,v));
end

% Sampling uniformly distributed points [2]

P=sampling(vertex,faces,area,N);