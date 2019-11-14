function CompTableAppend=AppendToCompTable(InitCellArray)
% Function for extract & appending parameters in individual columns
% PosEmo(Positive Emotions), NegEmo (Negative Emotions) of Complex Table

% String of full path to file
FullPatch=strcat(InitCellArray{1,1},InitCellArray{1,2});
% load data from Complex Table
CompTable=load(FullPatch,'CompTable');
% Evaluating PosEmo & NegEmo 
CompTable.CompTable.PosEmo=CompTable.CompTable.HP-CompTable.CompTable.OP;
CompTable.CompTable.NegEmo=CompTable.CompTable.OP-CompTable.CompTable.LP;
% Result
CompTableAppend = CompTable.CompTable;
%CompTableAppend = table2struct(CompTableAppend);

