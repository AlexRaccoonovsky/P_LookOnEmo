%%Main script file in Project_LookOnEmo 
clc
clear all
load InitCellArray.mat;

%% Appending column PosEmo & NegEmo to Complex Table
CompTableAppend=AppendToCompTable(InitCellArray);
