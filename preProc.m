clear all
close all
clc

% saveData

 Q=getQueryData(6,10);

 addpath Material
 normM=discreteMat('DiscreteMat.xlsx',Data.scaleMat);

% test