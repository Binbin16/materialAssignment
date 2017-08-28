# Probabilistic Factor Graph Based Approach for Automatic Material Assignments to Three-Dimensional Objects

We present a probabilistic graphical model to assign materials to the parts (components) of a 3D object (assembly) by identifying the relations between shape, functionality, and material of the parts. By learning the context-dependent correlation with supervision from a set of objects and their segmented parts, the learned model can be used to assign engineering materials to the parts of a query object. 

For more details, please refer to the following publication:
> Zhang, Binbin, and Rahul Rai. "Probabilistic Factor Graph Based Approach for Automatic Material Assignments to Three-Dimensional Objects." Journal of Mechanical Design 139.1 (2017): 014501.

This repository contains the code developed in MATLAB. If you use any part of this code for your work, please cite the above paper.

#### Usage Instructions:
1. Run the 'saveData_step1.m' and 'saveData_step2.m' file, which extracts relevant information for the database (not included), and save it in 'database.mat' file.

2. Run the 'preProc.m' file, which extracts relevant information for the query, and save it in 'QueryDataX.mat' file.

3. Run the 'testSumProd.m' file, which lists recommended material to the parts of the query object.

Note: Some portions of the code is downloaded from MATLAB Central File Exchance and Github repositories.

*****************************************************************
### Owner:
	MAD Lab
	Department of Mechanical and Aerospace Engineering
	University at Buffalo, Buffalo, NY - 14260
	http://madlab.eng.buffalo.edu/
*****************************************************************