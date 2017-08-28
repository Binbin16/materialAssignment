function PreSteps
path(path, 'toolbox_fast_marching/');
path(path, 'toolbox_fast_marching/toolbox/');
path(path, 'toolbox_graph/');
path(path, 'toolbox_graph/off/');


cd ShapeSimilarity\AGD\toolbox_fast_marching
compile_mex;
cd ../../..

addpath(genpath('../Code'));