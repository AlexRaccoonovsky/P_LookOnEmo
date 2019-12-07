%%Main script file in Project_LookOnEmo 
clc
clear all
load InitCellArray.mat;

%% Appending column PosEmo & NegEmo to Complex Table
CompTableAppend=AppendToCompTable(InitCellArray);
%% Forming cell array which consist of parameters for filtering
FormingIncludeParam;
%% Filtering Sample
FilteredSample=FilteringCompTable(CompTableAppend,IncludeParam);
%% Treatment & Plotting Graph
TreatAndPlot;
